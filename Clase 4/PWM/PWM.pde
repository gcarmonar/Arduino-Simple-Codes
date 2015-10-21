/* 
---> PWM
Salida Analogica con PWM

Autor: Gerardo Carmona
V1.0
Rev.: 28 / Sept / 2011

---> Historial
v1.5  |  28 / Sept / 2011
+ Se agrego el comando Serial.print para mandar información sobre
  el potenciometro y el ciclo de trabajo del Led

v1.0  |  20 / Jun / 2011
+ Se creo el programa

*/

// Puertos
int ledPin = 9;
int potPin = A0;

// Variables
int potValue;

// Inicialización
void setup() {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

// Programa principal
void loop() {
  potValue = analogRead(potPin);
  Serial.print("Lectura del potenciometro (0-1023): ");
  Serial.println(potValue, DEC);
  
  potValue = map(potValue, 0, 1023, 0, 255);
  Serial.print("Valor mapeado (0-255): ");
  Serial.println(potValue, DEC);
  Serial.println(""); //Se deja un espacio en blanco para separar valores
  
  analogWrite(ledPin, potValue);
  
  delay(300);  
}
