/* 
---> Tonos
Archivo para generar tonos

Autor: Gerardo Carmona
V1.0
Rev.: 17 / Nov / 2010
*/

// Puertos
int bocinaPin = 7;

//Variables


void setup(){
  pinMode(bocinaPin, OUTPUT);
}


void loop(){
  //   Puerto, frecuencia, duración
  tone(bocinaPin, 4400, 200);
  delay(550);
  tone(bocinaPin, 2000, 200);
  delay(550);
}
