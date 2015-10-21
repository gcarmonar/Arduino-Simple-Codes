/* 
---> Proyecto3
Solución al proyecto 3 (Domótica).
Un led se enciende y se apaga de dos formas:
 * Forma automática: Por medio de una fotorresistencia, la cual 
   se le puede ajustar la sensibilidad por medio de un 
   potenciometro, detecta si se hace de noche.
 * Forma manual: Por medio de un botón se paga o se enciende el
   led.
Se utiliza un botón para poder cambiar entre modos de operación y
una bocina emitirá un pequeño sonido cada vez que el led se 
enciende o se apaga.

Lista de componentes:
(1) Arduino UNO o similar
(1) Protoboard
(1) Resistencia de 260 ohms
(1) Led cualquier color
(1) Fotorresistencia
(3) Resistencias de 10K ohms
(2) Botones
(1) Potenciómetro de 10K ohms
Varios cables


Autor: Gerado Carmona
Versión: 1.0
Rev.: 29 / Sept / 2011
*/

// =========== Puertos ===========================================
const int potPin = A1;
const int ldrPin = A0;
const int botModoPin = 12;
const int botOnOffPin = 11;
const int bocinaPin = 10;
const int ledPin = 13;

// =========== Constantes ========================================
const int frecuencia = 3500;
const int duracion = 50;
const int pausa = 200;

// =========== Variables =========================================
int potValue;
int ldrValue;
int botModoValue;
int botOnOffValue;
int ledStatus;
int ledStatusAnt;

// =========== Inicialización ====================================
void setup(){
  pinMode(botModoPin, INPUT);
  pinMode(botOnOffPin, INPUT);
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}

// =========== Programa Principal ================================
void loop(){
  // Modo Automático
  do{
    botModoValue = digitalRead(botModoPin);
    ldrValue = analogRead(ldrPin);
    potValue = analogRead(potPin);
    potValue = map(potValue, 0, 1023, 20, 600);
    
    Serial.print("Potenciometro: ");
    Serial.println(potValue, DEC);
    Serial.print("LDR: ");
    Serial.println(ldrValue, DEC);
    delay(pausa);
    
    // Comparo valores para saber si es de noche
    if (ldrValue < potValue){
      digitalWrite(ledPin, HIGH);
      ledStatus = 1;
    }else{
      digitalWrite(ledPin, LOW);
      ledStatus = 0;
    }
    
    // Checo si el status del led cambio, si es así
    // suena una bocina
    if (ledStatus != ledStatusAnt){
      tone(bocinaPin, frecuencia, duracion);
    }
    
    ledStatusAnt = ledStatus;
    
  }while(botModoValue == 0);
  
  delay(pausa);
  
  // Modo manual
  do{
    botModoValue = digitalRead(botModoPin);
    botOnOffValue = digitalRead(botOnOffPin);
    
    if (botOnOffValue == 1 && ledStatus == 0){
      digitalWrite(ledPin, HIGH);
      ledStatus = 1;
      tone(bocinaPin, frecuencia, duracion);
    }else if (botOnOffValue == 1 && ledStatus == 1){
      digitalWrite(ledPin, LOW);
      ledStatus = 0;
      tone(bocinaPin, frecuencia, duracion);
    }  
    
    delay(pausa);
    
  }while(botModoValue == 0);
  
  delay(pausa);
}

// =========== Sub-rutinas =======================================
