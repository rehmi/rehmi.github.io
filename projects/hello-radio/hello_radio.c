/* hr.c	- hello radio for MRF49XA	 -*- Mode: C -*-
 *
 * Rehmi Post <rehmi@cba.mit.edu>
 * CBA MIT 11/28/10
 *
 * (c) Massachusetts Institute of Technology 2010
 * Permission granted for experimental and personal use;
 * license for commercial sale available from MIT.
 *
 * History:
 * 20101128	Created this file; initial target is ATmega328P.
 *
 */

/****************************************************************/

//#define DEBUG

/****************************************************************/

#include <stdio.h>
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

#define TRUE (0==0)
#define FALSE (0!=0)

typedef unsigned char		BOOL;			// 8-bit unsigned
typedef unsigned char		BYTE;			// 8-bit unsigned
typedef unsigned short int	WORD;			// 16-bit unsigned
typedef unsigned long		DWORD;			// 32-bit unsigned
typedef signed char		CHAR;			// 8-bit signed
typedef signed short int	SHORT;			// 16-bit signed
typedef signed long		LONG;			// 32-bit signed

typedef unsigned char		u08;			// 8-bit unsigned
typedef unsigned short int	u16;			// 16-bit unsigned
typedef unsigned long		u32;			// 32-bit unsigned
typedef signed char		s08;			// 8-bit signed
typedef signed short int	s16;			// 16-bit signed
typedef signed long		s32;			// 32-bit signed


/****************************************************************/
/* hal_spi.h */

#define DDR_SPI		DDRB
#define DD_SCK		RF_SCK
#define DD_MOSI		RF_MOSI
#define DD_MISO		RF_MISO

typedef enum {
  SPI_MSB_FIRST = 0, SPI_LSB_FIRST = 1
} SPI_data_order;

inline void SPI_Init (void);
inline unsigned char  SPI_Transfer_Byte (unsigned char d);

/****************************************************************/
/* hal_usart.h */

extern void USART_Init(void);
extern void USART_SetBaudRate(unsigned long baud);
extern void USART_Transmit(unsigned char data);
extern int USART_Receive_Ready (void);
extern int USART_Receive (unsigned char *data);

#define uartSendByte 	USART_Transmit
#define uartReceiveByte USART_Receive
#define uartInit	USART_Init
#define uartSetBaudRate USART_SetBaudRate

/****************************************************************/

#ifdef HELLO_RADIO_BREADBOARD
#include "hal_breadboard.h"
#endif
#ifdef HELL_O_RADIO_13
#include "hal_hell-o-radio-13.h"
#endif
#if defined(HELLO_RADIO_016) | defined(FABRADIO0_16)
#include "hal_hello_radio-016.h"
#endif

#define TXLED_ON	LED1_HI
#define TXLED_OFF	LED1_LO
#define RXLED_ON	LED0_HI
#define RXLED_OFF	LED0_LO

/****************************************************************/

//#define BAND_915
//#define BAND_868 
#define BAND_434
    
#define XTAL_LD_CAP 0x0003		// crystal load 10pF

#define PAYLOAD_LEN 126		    	// maximum payload size
#define PACKET_LEN  PAYLOAD_LEN + 2	// maximum packet length with 2 byte CRC
#define PAYLOAD_MAX PACKET_LEN
    
#if 1
#if  defined(BAND_434)
#define FREQ_Band        0x0010		// 434MHz
#define _CFSREG           0xA640		// Center Frequency: 434MHz
#elif  defined(BAND_868)
#define FREQ_Band        0x0020		// 868MHz
#define _CFSREG           0xA640		// Center Frequency: 868MHz
#elif  defined(BAND_915)
#define FREQ_Band        0x0030	       	// 915MHz
#define _CFSREG           0xA7D0	       	// Center Frequency: 915.000MHz
#else
#error  "At least one frequency band must be defined"
#endif
#endif

#define _GENCREG                 (0x8000 | XTAL_LD_CAP |FREQ_Band)

#define AFCCREG                 0xC4F7
#define TXCREG                  0x9850	// deviation 90kHz, output power 7dBm-0dB
#define TXBREG                  0xB800
#define _RXCREG                  0x9481	// BW 200KHz, LNA gain 0dB, RSSI -97dBm
#define FIFORSTREG              0xCA81
#define _DRVSREG                 0xC623	// bit rate = 9579 / sec
#define PMCREG                  0x8201

/****************************************************************/

// transmit and receive packet buffers
//volatile BOOL       	hasPacket = FALSE;
//volatile BYTE       	RxPacket[PACKET_LEN];
//volatile BYTE       	RxPacketLen;
#if 0
BYTE 	       	TxPacket[PACKET_LEN] = {
  0xAA, 0xAA,
  0x55, 0x55,
  0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF,
  0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88, 0x99, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF,
  0x55, 0x55,
  0xAA, 0xAA
};
#endif

/****************************************************************/
/* app_sniffer.h */

#define NUM_RX_BUFS       4

BYTE FreqBand;
BYTE DataRate;
BYTE Deviation;
BYTE Channel;

WORD GENCREG = _GENCREG;
WORD DRVSREG = _DRVSREG;
WORD RXCREG  = _RXCREG;
WORD CFSREG  = _CFSREG;

/****************************************************************/

/****************************************************************/
/* hal_usart.c */

void USART_Init(void)
{ 
  /* Enable receiver and transmitter */ 
  UCSR0B = (1<<RXEN0)|(1<<TXEN0); 
  /* Set frame format: 8data, 2stop bit */ 
  UCSR0C = (1<<USBS0)|(3<<UCSZ00); 
}

void USART_SetBaudRate(unsigned long baud)
{ 
  unsigned int ubrr = F_CPU/8/baud - 1;

  /* Set 2X clock rate */
  UCSR0A = (1<<U2X0);
  /* Set baud rate */
  UBRR0H = (unsigned char)(ubrr>>8);
  UBRR0L = (unsigned char)ubrr;
}

void USART_Transmit(unsigned char data) 
{ 
  /* Wait for empty transmit buffer */ 
  while ( !( UCSR0A & (1<<UDRE0)) )
    ;
  /* Put data into buffer, sends the data */ 
  UDR0 = data;
}

int USART_Receive_Ready (void) 
{ 
  /* Wait for data to be received */ 
  return (UCSR0A & (1<<RXC0)) != 0;
}

int USART_Receive (unsigned char *data) 
{ 
  if (USART_Receive_Ready()) {
    *data = UDR0;
    return TRUE;
  } else {
    return FALSE;
  }
}

/****************************************************************/
/* hal_spi.c */

inline void SPI_Init ()
{
  /* Set MOSI, SCK, RF_nCS outputs, MISO input */ 
#ifdef RF_SCKm_ZZ
  RF_SCKm_ZZ();
#endif
#ifdef RF_SS_HI
  RF_SS_HI ();
#endif
  RF_SCK_HI ();
  RF_MOSI_HI ();
#ifdef RF_SCKm_ZZ
  RF_SCKm_ZZ();
#endif
  RF_nCS_HI ();
  RF_MISO_ZZ ();

#ifdef USE_HARDWARE_SPI
  /* Enable SPI, Master, mode 0, set clock rate fck/16 */ 
  SPCR = (0<<SPIE)|(1<<SPE)|(0<<DORD)|(1<<MSTR)|(0<<CPHA)|(0<<CPOL)|(0<<SPR1)|(0<<SPR0);
  SPSR = (0<<SPI2X);
#endif
}

inline unsigned char SPI_Transfer_Byte (unsigned char d)
{
#ifdef USE_HARDWARE_SPI
  SPDR = d; 				  /* start transfer to SPI */
  while(!(SPSR & (1<<SPIF)));		  /* wait for transfer complete */ 
  return SPDR;				  /* return byte transferred from SPI */
#else
  BYTE i;
  BYTE data = 0;

  RF_MOSI_LO ();
#ifdef RF_SCKm_ZZ
  RF_SCKm_ZZ();
#endif
  RF_SCK_LO ();

  for(i = 0; i < 8; i++) {
    if ((d & (0x80 >> i)) != 0) {
      RF_MOSI_HI ();
    } else {
      RF_MOSI_LO ();
    }
    data = (data << 1) | (RF_MISO_IN() ? 1 : 0);
#ifdef USE_HARDWARE_SPI
    RF_SCKm_ZZ();
#endif
    RF_SCK_HI ();
    RF_SCK_LO ();
  }  
  RF_MOSI_LO ();
  return data;
#endif 
}

inline unsigned char SPI_Transfer_Word (unsigned short w)
{
  unsigned short v;

#ifdef USE_HARDWARE_SPI
  SPDR = w >> 8;			  /* start transfer of high byte to SPI */
  while(!(SPSR & (1<<SPIF)));		  /* wait for transfer complete */
  v = SPDR << 8;			  /* store high byte transferred from SPI */
  SPDR = w & 0xFF;			  /* start transfer of low byte to SPI */
  while(!(SPSR & (1<<SPIF)));		  /* wait for transfer complete */
  v |= SPDR;				  /* store low byte transferred from SPI */
#else
  v  = SPI_Transfer_Byte (w >> 8) >> 8;
  v |= SPI_Transfer_Byte (w & 255) & 255;
#endif

  return v;				  /* return stored word */
}

/****************************************************************/

void RF_Interface_Init(void)
{
  // set I/O ports
  RF_nCS_HI ();
  RF_MOSI_HI ();
  RF_MISO_ZZ ();
#ifdef RF_SCKm_ZZ
  RF_SCKm_ZZ ();
#endif
  RF_SCK_HI ();

#ifdef RF_FINT_ZZ
  RF_FINT_ZZ ();
#endif
  RF_nFSEL_ZZ ();
#ifdef RF_INT_ZZ
  RF_INT_ZZ ();
#endif
  RF_nIRQ_ZZ ();

  RF_nRST_LO();
  _delay_us(500);
  RF_nRST_HI ();
  _delay_us(500);
  RF_nRST_PU();

  BUT0_PU();

  LED0_HI ();
  _delay_ms (100);
  LED0_LO ();
  LED1_HI ();
  _delay_ms (100);
  LED1_LO ();
 
  // XXX - TODO: enable RF interrupts
}


void RF_Set_Register(WORD setting)
{
  RF_nCS_LO();				/* select MRF49XA SPI */
  SPI_Transfer_Word (setting);
  RF_nCS_HI();				/* deselect MRF49XA SPI */
}

void RF_Int_Disable (void)
{
  // XXX
}

void RF_Int_Enable (void)
{
  // XXX
}

//#define DEBUG
void MRF49XA_Init (void)
{
#ifdef DEBUG
  printf ("entering MRF49XA_Init ()\n");
#endif

  // configuring the MRF49XA radio
  RF_Int_Disable ();

  RF_Set_Register(FIFORSTREG);
#ifdef DEBUG
  printf ("FIFORSTREG\n");
#endif

  RF_Set_Register(FIFORSTREG | 0x0002);       // enable synchron latch
#ifdef DEBUG
  printf ("FIFORSTREG | 0x0002\n");
#endif

  RF_Set_Register(GENCREG);
#ifdef DEBUG
  printf ("GENCREG\n");
#endif

  RF_Set_Register(AFCCREG);
#ifdef DEBUG
  printf ("AFCCREG\n");
#endif

  RF_Set_Register(CFSREG);
#ifdef DEBUG
  printf ("CFSREG\n");
#endif

  RF_Set_Register(DRVSREG);
#ifdef DEBUG
  printf ("DRVSREG\n");
#endif

  RF_Set_Register(PMCREG);
#ifdef DEBUG
  printf ("PMCREG\n");
#endif

  RF_Set_Register(RXCREG);
#ifdef DEBUG
  printf ("RXCREG\n");
#endif

  RF_Set_Register(TXCREG);
#ifdef DEBUG
  printf ("TXCREG\n");
#endif

  // antenna tuning on startup
#ifdef DEBUG
  printf ("turning on transmitter ()\n");
#endif
  RF_Set_Register(PMCREG | 0x0020);	    // turn on the transmitter
  _delay_ms(5);			    // wait for oscillator to stablize
  // end of antenna tuning
  RF_Set_Register(PMCREG | 0x0080); 	    // turn off transmitter, turn on receiver
#ifdef DEBUG
  printf ("turned off transmitter, turned on receiver\n");
#endif

  RF_Set_Register(GENCREG | 0x0040);	// enable the FIFO
  RF_Set_Register(FIFORSTREG);
  RF_Set_Register(FIFORSTREG | 0x0002); 	// enable synchron latch
  RF_Set_Register(0x0000);		// read status byte (read ITs)
    
  RF_Int_Enable ();
}
#undef DEBUG

void Cmd_RF_buzz (void)
{
  int i;

  RF_Set_Register(FIFORSTREG);
  RF_Set_Register(FIFORSTREG | 0x0002);       // enable synchron latch
  RF_Set_Register(GENCREG);
  RF_Set_Register(AFCCREG);
  RF_Set_Register(CFSREG);
  RF_Set_Register(DRVSREG);
  RF_Set_Register(PMCREG);
  RF_Set_Register(RXCREG);
  RF_Set_Register(TXCREG);
  for (i = 0; i < 20; i++) {
    RF_Set_Register(PMCREG | 0x0020);	    // turn on the transmitter
    _delay_ms(1);
    RF_Set_Register(PMCREG | 0x0080); 	    // turn off transmitter
    _delay_ms(1);
  }
}


/****************************************************************/
/* RF_packet.c */

#include <util/crc16.h>

WORD CRC16(BYTE *ptr, BYTE count)
{
  WORD crc;
    
  crc = 0;

  while(count-- > 0 ) {
    crc = _crc_xmodem_update (crc, *ptr++);
  }
  
  return crc;
}

void MRF_Send_Packet(BYTE *packet, BYTE len)
{
    BYTE ptr;
    BYTE synCount;
    WORD crc = 0;
    
#define SPI_Transfer_Byte_CRC(b) {	\
      BYTE d=(b);			\
      crc =_crc_xmodem_update (crc, d);	\
      SPI_Transfer_Byte(d);		\
}

    TXLED_ON();
    
    if (len > PACKET_LEN) {
        len = PACKET_LEN;
    }

    //Start_Transmitting:
    RF_Int_Disable ();

    // Turn off receiver, enable the TX register
    RF_Set_Register(PMCREG);
    RF_Set_Register(GENCREG | 0x0080);
    
    // enable transmitter
    RF_Set_Register(PMCREG | 0x0020);


    RF_nCS_LO ();			// select MRF49XA SPI */

    SPI_Transfer_Byte(0xB8);                 // FIFO write
    SPI_Transfer_Byte(0xAA);                 // 3rd preamble
    
    for (ptr = 0, synCount = 0; ptr < len+2; ) {    // 2 CRC bytes follow packet
      if( RF_MISO_IN() ) {
	if( ptr == 0 && synCount < 3 ) {
	  switch(synCount) {
	  case 0:
	    SPI_Transfer_Byte(0x2D);
	    break;
	  case 1:
	    SPI_Transfer_Byte(0xD4);
	    break;
	  case 2:
	    crc = 0;
	    SPI_Transfer_Byte_CRC(len+2);
	    break;
	  default:
	    break;
	  }
	  synCount++;
	} else {
	  if (ptr < len) {
	    SPI_Transfer_Byte_CRC(packet[ptr]);
	  } else if (ptr == len) {
	    SPI_Transfer_Byte(crc >> 8);
	  } else if (ptr == len+1) {
	    SPI_Transfer_Byte(crc &  0xff);
	  }
	  ptr++;
	}
      }
    }

    RF_nCS_HI ();
    
    // Turn off the transmitter, disable the Tx register
    RF_Set_Register(PMCREG | 0x0080);
    RF_Set_Register(GENCREG | 0x0040 );
    RF_Set_Register(FIFORSTREG | 0x0002);
    RF_Int_Enable ();
         
    TXLED_OFF ();
}

/****************************************************************/
/* RF_interrupts.c */

BOOL RF_Int_Enabled (void)
{
  return TRUE;
}


BOOL RF_Int_Flag (void)
{
  return TRUE;
}

void RF_Int_Clear (void)
{
}

#if 0
volatile BOOL RxPacketValid[NUM_RX_BUFS];
BYTE RxPacket[NUM_RX_BUFS][PACKET_LEN]; 
volatile BYTE RxPacketLen[NUM_RX_BUFS]; 
WORD totalReceived = 0;

int ISR(INT0_vect)
{
  if (RF_Int_Enabled() && RF_Int_Flag()) {
    RF_nCS_LO ();
    if (RF_MISO_IN ()) {
      BYTE RxPacketPtr;
      BYTE tmpPacketLen;
      WORD counter;

      // There is data in RX FIFO
      RF_nCS_HI ();
      RF_nFSEL_LO ();                   // FIFO selected
      
      tmpPacketLen = SPI_Transfer_Byte(0);
                     
      if (tmpPacketLen >= PAYLOAD_LEN || tmpPacketLen == 0 || hasPacket) {
      IGNORE_HERE:            
	RF_nFSEL_HI();                          // bad packet len received
	RF_Set_Register(PMCREG);                // turn off the transmitter and receiver
	RF_Set_Register(FIFORSTREG);            // reset FIFO
	RF_Set_Register(GENCREG);               // disable FIFO, TX_latch
	RF_Set_Register(GENCREG | 0x0040);      // enable FIFO
	RF_Set_Register(PMCREG | 0x0080);       // turn on receiver
	RF_Set_Register(FIFORSTREG | 0x0002);   // FIFO synchron latch re-enabled
	goto RETURN_HERE;
      }
            
      RxPacketLen = tmpPacketLen;
      RXLED_ON();
      RF_nFSEL_HI();
            
      RxPacketPtr = 0;
      counter = 0;
            
      while(1) {
	  if (counter++ == 0xFFFF) {
	      goto IGNORE_HERE;
	  } else if (RF_FINT_IN()) {
	      RF_nFSEL_LO ();
	      counter = 0;
	      RxPacket[RxPacketPtr++] = SPI_Transfer_Byte(0);
	      
	      if (RxPacketPtr >= RxPacketLen) {
		  WORD received_crc;
		  WORD calculated_crc;
		  BYTE i;
                        
		  RF_nFSEL_HI();
		  RF_Set_Register(FIFORSTREG);
		  RXLED_OFF();
                        
		  RxPacketLen -= 2;       // do not count CRC
		  received_crc = ((WORD)RxPacket[RxPacketLen+1]) 
		    + (((WORD)RxPacket[RxPacketLen]) << 8);
		  calculated_crc = CRC16((BYTE *)RxPacket, RxPacketLen);

		  if (received_crc != calculated_crc) {
		      RxPacketPtr = 0;
		      RxPacketLen = 0;
		      // FIFO synchron latch re-enable 
		      RF_Set_Register(FIFORSTREG | 0x0002);
		      goto IGNORE_HERE;
		  }

		  RF_Set_Register(FIFORSTREG | 0x0002);
		  hasPacket = TRUE;

		  goto RETURN_HERE;
	      }
	      RF_nFSEL_HI();
	  }
      }
    } else {            // read the rest of the interrupts
	SPI_Transfer_Byte(0);
  	RF_nCS_HI ();
    }
          
  RETURN_HERE:        
    RF_Int_Clear ();
  }
}
#endif

/****************************************************************/

#define NODATA		0
#define DATA_RECEIVED	-1
#define PACKET_RECEIVED 1

int MRF_Receive_Packet (BYTE *data, BYTE *length)
{
  static unsigned char len = 0;
  static unsigned char nrbytes = 0;
  unsigned char bl;

  RF_nCS_LO();		// chip select low

  if (RF_MISO_IN()) {		// in case of FINT then read out
    RF_nCS_HI();
    RF_nFSEL_LO();
    if(len) {	       // is this the first byte? go on if not
      // number of bytes in payload is the first byte
      data[(nrbytes++)] = SPI_Transfer_Byte(0);

      if (nrbytes >= len) {    // end of packet
	RF_Set_Register(FIFORSTREG); // reset FIFO	
	RF_nFSEL_HI();		     // whole packet received
	*length = nrbytes;
	nrbytes=0;
	len =0;
	return PACKET_RECEIVED;
      }
    } else {			// the first byte received
      bl=SPI_Transfer_Byte(0);
      // check if correct number of bytes in payload
      if((bl>0) && (bl<PAYLOAD_MAX)) {
	len=bl;
	nrbytes=0; 
      } else {
	RF_nFSEL_HI();			   // bad packet length
	RF_Set_Register(PMCREG);	   // turn off tx and rx
	RF_Set_Register(FIFORSTREG);	   // reset FIFO
	RF_Set_Register(GENCREG);	   // disable FIFO , Tx_latch
	RF_Set_Register(GENCREG | 0x0040); // enable the FIFO	
	RF_Set_Register(PMCREG | 0x0080);  // turn on receiver
	RF_Set_Register(FIFORSTREG | 0x0002); // FIFO syncron latch re-enable
	return NODATA;
      }
    }
    RF_nFSEL_HI();
    return DATA_RECEIVED;
  } else {
    RF_nCS_HI();
    return NODATA;
  } 
}


/****************************************************************/
 
/****************************************************************/
/* set up stdio to USART */

int usart_putchar(char c, FILE *stream)
{
  if (c == '\n')
    usart_putchar('\r', stream);
  USART_Transmit (c);
  return 0;
}

FILE stdout_usart[] = {FDEV_SETUP_STREAM(usart_putchar, NULL, _FDEV_SETUP_WRITE)};

/****************************************************************/
/* set up stdio to SPI */

int spi_putchar(char c, FILE *stream)
{
  if (c == '\n')
    spi_putchar('\r', stream);
  SPI_Transfer_Byte (c);
  return 0;
}

FILE stdout_spi[] = {FDEV_SETUP_STREAM(spi_putchar, NULL, _FDEV_SETUP_WRITE)};

/****************************************************************/

BYTE rx_packet[PACKET_LEN];
BYTE tx_packet[PACKET_LEN];

void Cmd_RX_loop (void)
{
  BYTE dummy;
  BYTE length, i;

  while (!USART_Receive_Ready()) {
    switch (MRF_Receive_Packet (rx_packet, &length)) {
    case NODATA:
      break;
    case DATA_RECEIVED:
      putchar ('.');
      break;
    case PACKET_RECEIVED:
      printf ("Received packet of length %d\n", length);
      for (i = 0; i < length; i++) {
	printf ("%02x ", rx_packet[i]);
      }
      printf ("\n");
      RF_Set_Register(FIFORSTREG | 0x0002); // FIFO sync latch re-enable
      break;
    default:
      break;
    }
  }
  USART_Receive (&dummy);
  return;
}

void puthex (BYTE b)
{
  static char hex[] = "0123456789ABCDEF";
  putchar (hex[0xf & (b>>4)]);
  putchar (hex[0xf & (b)   ]);
}

#define BUTTON0_PRESSED() (!BUT0_IN())

//#define DEBUG

void Cmd_TXRX_button_loop (void)
{
  BYTE c;
  BYTE rx_len, tx_len = 0, i;
  BOOL receiving = FALSE;
  BOOL building_packet = FALSE;
  BYTE button_down = 10;
  WORD crc = 0, pcrc;

  while (1) {
    if (!receiving) {
      if (BUTTON0_PRESSED()) {
	button_down = 10;
	MRF_Send_Packet ((BYTE *)"R^*|B1", 6);
      } else if (button_down > 0) {
	button_down--;
	MRF_Send_Packet ((BYTE *)"R^*|B0", 6);
      }
    }

    switch (MRF_Receive_Packet (rx_packet, &rx_len)) {
    case NODATA:
      break;

    case DATA_RECEIVED:
      RXLED_ON();
      receiving = TRUE;
      break;

    case PACKET_RECEIVED:
      RXLED_OFF();
      receiving = FALSE;

      for (i = 0; i < rx_len - 2; i++) {
	crc =0;
	crc = _crc_xmodem_update (crc, rx_packet[i]);
      }

      pcrc = rx_packet[rx_len]<<8 | rx_packet[rx_len+1];

      if (TRUE || crc == pcrc) {
#ifdef DEBUG
	printf ("[%02x]", rx_len);
#endif
	putchar ('{');
#ifdef DEBUG
	for (i = 0; i < rx_len; i++) {
	  puthex (rx_packet[i]);
	}
#else
	for (i = 0; i < rx_len - 2; i++) {
	  putchar (rx_packet[i]);
	}
#endif
	putchar ('}');
      }
      RF_Set_Register(FIFORSTREG | 0x0002); // FIFO sync latch re-enable
#ifdef DEBUG
      printf ("<%04x,%04x>", pcrc, crc);
#endif
      putchar ('\n');
      break;

    default:
      break;
    }

    if (USART_Receive_Ready()) {
      USART_Receive (&c);
      switch (c) {
      case '{':
	tx_len = 0;
	building_packet = TRUE;
	break;

      case '}':
	MRF_Send_Packet (tx_packet, tx_len);
	break;

      case '\033':
      case 'x':
      case 'q':
	if (!building_packet)
	  return;
      default:
	if (tx_len < PACKET_LEN) {
	  tx_packet[tx_len++] = c;
	}
	break;
      }
    }
  }
}

void Cmd_TX_loop (void)
{
  BYTE dummy;

  while (!USART_Receive_Ready()) {
    MRF_Send_Packet ((BYTE *)"Hello, radio!", 13);
    _delay_ms (100);
  }
  USART_Receive (&dummy);
  return;
}

BOOL running = TRUE;
void Cmd_Interpreter (void)
{
  BYTE c;

  while (running) {
    printf ("> ");
    while (!USART_Receive_Ready());
    if (USART_Receive (&c)) {
      printf ("%c\n", c);
      switch (c) {
      case '?':
	printf ("?\tprint this help message\n");
	printf ("b\tbuzz on RF (500 Hz OOK for 20 cycles\n");
	printf ("r\treceive and print packets until keypress\n");
	printf ("t\ttransmit packets until keypress\n");
	printf ("k\tremote keyfob demo loop until keypress\n");
	break;
      case 't':
	Cmd_TX_loop ();
	break;
      case 'r':
	Cmd_RX_loop ();
	break;
      case 'b':
	Cmd_RF_buzz ();
	break;
      case 'k':
	Cmd_TXRX_button_loop ();
	break;
      default:
	printf ("unknown command\n");
	break;
      }
    }
  }
}

/****************************************************************/

char version[] = "hr.c - Hello Radio v0.2 " __DATE__ " " __TIME__;

int main(void)
{
  BYTE c;

  cli();

  BUT0_PU ();
  LED1_HI ();
  //  while (BUT0_IN());
  LED1_LO ();

  USART_Init ();
  USART_SetBaudRate (9600L);
  stdout = stdout_usart;
  printf ("\n*** %s ***\n", version);

  //  printf ("initializing SPI...");
  SPI_Init ();
  //  printf ("\n");

  //  printf ("initializing RF interface...");
  RF_Interface_Init ();
  //  printf ("\n");

  //  printf ("MRF49XA_init()...");
  MRF49XA_Init ();
  //  printf ("\n");

  while (USART_Receive (&c));
  
  //  printf ("Cmd_TXRX_button_loop()...");
  MRF_Send_Packet ((BYTE *)"", 0);
  //  printf ("\n");
  Cmd_TXRX_button_loop ();

  printf ("*** entering command interpreter; type '?' for help\n");
  Cmd_Interpreter ();

  return 0;
}
