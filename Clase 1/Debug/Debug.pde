/* 
---> Debug
Este programa realiza la suma de dos variables tipo int y manda el resultado por
el puerto usb a la computadora

Autor: Gerardo Carmona
V1.0
Rev.: 09 / Nov / 2010
*/

int x = 50;
int y = 20;
int z;


void setup() {                
  Serial.begin(9600);    //Inicia la comunicación por el puerto serie a una velocidad de 9,600 kbps    
}

void loop() {
  z = y + x;
  Serial.print("z: ");
  Serial.println(z, DEC);
  delay(250); 
}
