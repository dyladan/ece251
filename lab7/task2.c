//task 2

#include <mc9s12dp256.h>   // header file to be included for the controller
#include <stdio.h>

#pragma abs_address:1000
unsigned char volatile Array1[16] = {
0x56, 0x2F, 0x72, 0xB2, 0xAA, 0xB3, 0xCD, 0x2A, 0xF5, 0x46, 0x21, 0xAB, 0x7B, 0x2D, 0x01, 0x05
#pragma end_abs_address

#pragma abs_address:1020
unsigned int volatile Array2[16]={ 
$AA, $17, $F9, $12, $5A, $6B, $12, $7A, $21, $80, $19, $C5, $D7, $63, $A8, $33};
#pragma end_abs_address

#pragma abs_address:1100
unsigned char volatile Array3[16]={
 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
#pragma end_abs_address

#pragma abs_address:1120
unsigned char volatile Array4[16]={
 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
#pragma end_abs_address

#pragma abs_address:1040
signed char volatile Array5[16]={
 01, -32, 23, -90, 45, -03, -67, 11, 5, -15, 19, -21, 2, 3, 0, -55};
#pragma end_abs_address

#pragma abs_address:1140
signed char volatile Array6[16]={
 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
#pragma end_abs_address

#pragma abs_address:1160
signed char volatile Array7[16]={
 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
#pragma end_abs_address

int n;
n = 15;

Main(){
    
    
    for(int j=0; j<15; x++) //loop to
    
    {
        Array6[j] = Array5[j];
    
    }


    for(int x=0; x<n; x++)

    {

        for(int y=0; y<n-1; y++)

        {

            if(Array6[y]>Array6[y+1])

            {

                int temp = Array5[y+1];

                Array6[y+1] = Array6[y];

                Array6[y] = temp;

            }

        }

    }
    
    for(int x=0; x<n; x++_
    {
        Array7[15-x] = Array6[x];
    }
    
    puts("the maximum value is")
    
    puts("the minimum value is")



asm("Swi")
return(0)
}
