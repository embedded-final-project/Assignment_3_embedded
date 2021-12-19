
#define ICLK  RC3_bit
#define IDAT  RC4_bit
#define TIDAT TRISC4_bit

extern void i2c_init(void);
extern void i2c_start(void);
extern void i2c_stop(void);
extern void i2c_wb(unsigned char val);
extern unsigned char i2c_rb(unsigned char ack);
extern void i2c_acktst(unsigned char val);