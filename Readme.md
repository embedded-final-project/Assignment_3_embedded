# How To use Eeeprom Module:
* Eeprom Ext memory is used to save data to non volatile storage
* you will find two APIs to be used: 
  1. `unsigned char EepromExt_Read(unsigned int addr);` you can use it to get specific data from specific address inside the permenant memory.
  2. `void EepromExt_Write(unsigned int addr, unsigned char val);` you can use it to write specific data to specific memory address.
* Sample Example:
  ```c
    volatile char date[10];  /*dd/mm/aa*/
    volatile char time[10];  /*hh:mm:ss*/

    unsigned char tmp, i;

    void main()
    {
        i2c_init();
        tmp=EepromExt_Read(10);
        //temp now have the content of memory address 10
        EepromExt_Write(10,0xA5);
        // memory address 10 have content of 0xA5
        EepromExt_Write(10,0x5A);
        // memory address 10 have content of 0x5A
        i= EepromExt_Read(10);
        //i now have the content of memory address 10 i.e. 0x5A
        //.... write the remaining code here
    }
   ``` 
# How to use Rtc Module:
* Rtc is used to get the current date and time.
* you will find one API to be used: 
  1. `void Rtc_GetDateTime(volatile char date[], volatile char time[]);` you have to create two arrays of 10 bytes size one for date and one for time and pass them to the Api to get the date and time.
* Sample Example:
  ```c
    volatile char date[10];  /*dd/mm/aa*/
    volatile char time[10];  /*hh:mm:ss*/

    void main()
    {
        i2c_init();
        Rtc_GetDateTime(date, time);
        //.... write the remaining code here
    }
   ``` 
# Example Reference:
check the file `SampleRtcEeepromExtTest.c` for the usage of the both APIs.

# Limitations
Not supported with P18FxxKxx Families.