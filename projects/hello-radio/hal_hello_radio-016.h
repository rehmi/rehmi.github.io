/* hal_rf.h */

//#define USE_HARDWARE_SPI

/*
 * between #if 0 ... #endif is an M4 script to generate pin definitions
 */

/* BEGIN m4 macros *//*

define(`DEF_PIN',`#define $1  	P$2$3
#define $1_PORT	PORT$2
#define $1_IN()	(PIN$2 & (1<<$3))
#define $1_HI()	{PORT$2|= (1<<$3);  DDR$2|= (1<<$3);}
#define $1_LO()	{PORT$2&=~(1<<$3);  DDR$2|= (1<<$3);}
#define $1_PU()	{ DDR$2&=~(1<<$3); PORT$2|= (1<<$3);}
#define $1_ZZ()	{ DDR$2&=~(1<<$3); PORT$2&=~(1<<$3);}')

// begin generated pin definitions
DEF_PIN(RF_nCS,B,0)
DEF_PIN(RF_MOSI,B,2)
DEF_PIN(RF_MISO,D,7)
DEF_PIN(RF_SCK,B,1)
DEF_PIN(RF_nFSEL,D,5)
DEF_PIN(RF_nRST,D,1)
DEF_PIN(RF_nIRQ,D,2)
DEF_PIN(BUT0,D,4)
DEF_PIN(LED0,C,2)
DEF_PIN(LED1,C,3)
// end generated pin definitions

*//* END m4 macros */

// begin generated pin definitions
#define RF_nCS  	PB0
#define RF_nCS_PORT	PORTB
#define RF_nCS_IN()	(PINB & (1<<0))
#define RF_nCS_HI()	{PORTB|= (1<<0);  DDRB|= (1<<0);}
#define RF_nCS_LO()	{PORTB&=~(1<<0);  DDRB|= (1<<0);}
#define RF_nCS_PU()	{ DDRB&=~(1<<0); PORTB|= (1<<0);}
#define RF_nCS_ZZ()	{ DDRB&=~(1<<0); PORTB&=~(1<<0);}
#define RF_MOSI  	PB2
#define RF_MOSI_PORT	PORTB
#define RF_MOSI_IN()	(PINB & (1<<2))
#define RF_MOSI_HI()	{PORTB|= (1<<2);  DDRB|= (1<<2);}
#define RF_MOSI_LO()	{PORTB&=~(1<<2);  DDRB|= (1<<2);}
#define RF_MOSI_PU()	{ DDRB&=~(1<<2); PORTB|= (1<<2);}
#define RF_MOSI_ZZ()	{ DDRB&=~(1<<2); PORTB&=~(1<<2);}
#define RF_MISO  	PD7
#define RF_MISO_PORT	PORTD
#define RF_MISO_IN()	(PIND & (1<<7))
#define RF_MISO_HI()	{PORTD|= (1<<7);  DDRD|= (1<<7);}
#define RF_MISO_LO()	{PORTD&=~(1<<7);  DDRD|= (1<<7);}
#define RF_MISO_PU()	{ DDRD&=~(1<<7); PORTD|= (1<<7);}
#define RF_MISO_ZZ()	{ DDRD&=~(1<<7); PORTD&=~(1<<7);}
#define RF_SCK  	PB1
#define RF_SCK_PORT	PORTB
#define RF_SCK_IN()	(PINB & (1<<1))
#define RF_SCK_HI()	{PORTB|= (1<<1);  DDRB|= (1<<1);}
#define RF_SCK_LO()	{PORTB&=~(1<<1);  DDRB|= (1<<1);}
#define RF_SCK_PU()	{ DDRB&=~(1<<1); PORTB|= (1<<1);}
#define RF_SCK_ZZ()	{ DDRB&=~(1<<1); PORTB&=~(1<<1);}
#define RF_nFSEL  	PD5
#define RF_nFSEL_PORT	PORTD
#define RF_nFSEL_IN()	(PIND & (1<<5))
#define RF_nFSEL_HI()	{PORTD|= (1<<5);  DDRD|= (1<<5);}
#define RF_nFSEL_LO()	{PORTD&=~(1<<5);  DDRD|= (1<<5);}
#define RF_nFSEL_PU()	{ DDRD&=~(1<<5); PORTD|= (1<<5);}
#define RF_nFSEL_ZZ()	{ DDRD&=~(1<<5); PORTD&=~(1<<5);}
#define RF_nRST  	PD1
#define RF_nRST_PORT	PORTD
#define RF_nRST_IN()	(PIND & (1<<1))
#define RF_nRST_HI()	{PORTD|= (1<<1);  DDRD|= (1<<1);}
#define RF_nRST_LO()	{PORTD&=~(1<<1);  DDRD|= (1<<1);}
#define RF_nRST_PU()	{ DDRD&=~(1<<1); PORTD|= (1<<1);}
#define RF_nRST_ZZ()	{ DDRD&=~(1<<1); PORTD&=~(1<<1);}
#define RF_nIRQ  	PD2
#define RF_nIRQ_PORT	PORTD
#define RF_nIRQ_IN()	(PIND & (1<<2))
#define RF_nIRQ_HI()	{PORTD|= (1<<2);  DDRD|= (1<<2);}
#define RF_nIRQ_LO()	{PORTD&=~(1<<2);  DDRD|= (1<<2);}
#define RF_nIRQ_PU()	{ DDRD&=~(1<<2); PORTD|= (1<<2);}
#define RF_nIRQ_ZZ()	{ DDRD&=~(1<<2); PORTD&=~(1<<2);}
#define BUT0  	PD4
#define BUT0_PORT	PORTD
#define BUT0_IN()	(PIND & (1<<4))
#define BUT0_HI()	{PORTD|= (1<<4);  DDRD|= (1<<4);}
#define BUT0_LO()	{PORTD&=~(1<<4);  DDRD|= (1<<4);}
#define BUT0_PU()	{ DDRD&=~(1<<4); PORTD|= (1<<4);}
#define BUT0_ZZ()	{ DDRD&=~(1<<4); PORTD&=~(1<<4);}
#define LED0  	PC2
#define LED0_PORT	PORTC
#define LED0_IN()	(PINC & (1<<2))
#define LED0_HI()	{PORTC|= (1<<2);  DDRC|= (1<<2);}
#define LED0_LO()	{PORTC&=~(1<<2);  DDRC|= (1<<2);}
#define LED0_PU()	{ DDRC&=~(1<<2); PORTC|= (1<<2);}
#define LED0_ZZ()	{ DDRC&=~(1<<2); PORTC&=~(1<<2);}
#define LED1  	PC3
#define LED1_PORT	PORTC
#define LED1_IN()	(PINC & (1<<3))
#define LED1_HI()	{PORTC|= (1<<3);  DDRC|= (1<<3);}
#define LED1_LO()	{PORTC&=~(1<<3);  DDRC|= (1<<3);}
#define LED1_PU()	{ DDRC&=~(1<<3); PORTC|= (1<<3);}
#define LED1_ZZ()	{ DDRC&=~(1<<3); PORTC&=~(1<<3);}
// end generated pin definitions
