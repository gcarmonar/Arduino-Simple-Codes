/* 
---> Map
Se utiliza un potenciómetro para controlar una secuencia de 
encendido de 3 leds, también se emplea el comando map para 
cambiar la escala de la pausa.

Autor: Gerardo Carmona
V1.0
Rev.: 15 / Nov / 2010
*/

// Puertos
int potPin = A0;    
int led1Pin = 7;
int led2Pin = 6;
int led3Pin = 5;

//Variables
int potValue = 0;


void setup(){
  pinMode(led1Pin, OUTPUT);
  pinMode(led2Pin, OUTPUT);
  pinMode(led3Pin, OUTPUT);
}


void loop(){
  potValue = analogRead(potPin);  // Solo se actualiza la velocidad al llegar al inicio
  potValue = map(potValue, 0, 1023, 20, 333);
  digitalWrite(led1Pin, HIGH); 
  delay(potValue);
  digitalWrite(led1Pin, LOW); 
  delay(potValue);
  digitalWrite(led2Pin, HIGH); 
  delay(potValue);
  digitalWrite(led2Pin, LOW); 
  delay(potValue);
  digitalWrite(led3Pin, HIGH); 
  delay(potValue);
  digitalWrite(led3Pin, LOW); 
  delay(potValue);
}
