/* 
---> RobotSumoSencillo
Programa de pelea de un mini-sumo.

Autor: Gerado Carmona
Versión: 1.1
Rev.: 07 / Nov / 2011

---> Historial
v1.1 | 07 / Nov / 11
+ Se corriguieron algunos errores

v1.0 | 24 / Oct / 11
+ Se creo el programa

*/

// =========== Librerias =========================================
#include <Servo.h>
Servo servoIzq;
Servo servoDer;

// =========== Puertos ===========================================
#define senQrdDerPin A0
#define senQrdIzqPin A1
#define ledQrdDerPin 9
#define ledQrdIzqPin 8
#define senIrDerPin 2
#define ledIrDerPin 3
#define senIrIzqPin 12
#define ledIrIzqPin 13
#define servoIzqPin 11
#define servoDerPin 10
#define ledStatusPin 4

// =========== Constantes ========================================
// Constante para determinar cuando es blanco y cuando es negro
#define brightness 800
// Constantes para los motores
#define serIzqAvaRa 179
#define serDerAvaRa 0
#define serIzqRevRa 0
#define serDerRevRa 179
#define serIzqStop 90
#define serDerStop 90
// numero de repeticiones de los servos
#define repAvanza 20
#define repGiro 20
#define repVuelta 30
#define repReversa 20


// =========== Variables =========================================
int senQrdValue;
int senIrValue;

// =========== Inicialización ====================================
void setup(){
  Serial.begin(9600);
  
  pinMode(senIrDerPin,INPUT);
  pinMode(senIrIzqPin,INPUT);
  pinMode(ledQrdDerPin,OUTPUT);
  pinMode(ledQrdIzqPin,OUTPUT);
  pinMode(ledIrDerPin,OUTPUT);
  pinMode(ledIrIzqPin,OUTPUT);
  pinMode(ledStatusPin, OUTPUT);
  servoIzq.attach(servoIzqPin);
  servoDer.attach(servoDerPin);
  
  // Conteo reglamentario de 5 segundos antes de iniciar la pelea
  for (int i = 0; i < 5; i++){
    digitalWrite(ledStatusPin, HIGH);
    delay(500);
    digitalWrite(ledStatusPin, LOW);
    delay(500);
  }  
}

// =========== Programa Principal ================================
void loop(){
  senQrdValue = SensoresLinea();
  if (senQrdValue == 0){
    senIrValue = SensoresIr();
    Serial.println(senIrValue);
  }
    
  motoresServo(senQrdValue, senIrValue);
  
}

// =========== Sub-rutinas =======================================
int SensoresLinea(){
  digitalWrite(ledQrdDerPin,HIGH);
  digitalWrite(ledQrdIzqPin,HIGH);
  delay(1); // tiempo para que los leds iluminen
  int _senQrdDerValue = analogRead(senQrdDerPin);
  int _senQrdIzqValue = analogRead(senQrdIzqPin);
  digitalWrite(ledQrdDerPin,LOW);
  digitalWrite(ledQrdIzqPin,LOW);
  
  if (_senQrdDerValue > brightness){
    _senQrdDerValue = 0;
  }else{
    _senQrdDerValue = 1;
  }
  
  if (_senQrdIzqValue > brightness){
    _senQrdIzqValue = 0;
  }else{
    _senQrdIzqValue = 1;
  }
  
  return  _senQrdIzqValue*2 + _senQrdDerValue;
}

int SensoresIr(){
  int microsecs = 1000;
  int _senIrDerValue;
  int _senIrIzqValue;
  
  while (microsecs > 0) {
    digitalWrite(ledIrDerPin, HIGH);
    delayMicroseconds(10);         
    digitalWrite(ledIrDerPin, LOW);
    delayMicroseconds(10);        
    microsecs -= 26;
  }
   _senIrDerValue = !digitalRead(senIrDerPin);
   
   microsecs = 1000;
   
   while (microsecs > 0) {
    digitalWrite(ledIrIzqPin, HIGH);
    delayMicroseconds(10);         
    digitalWrite(ledIrIzqPin, LOW);
    delayMicroseconds(10);        
    microsecs -= 26;
  }
   _senIrIzqValue = !digitalRead(senIrIzqPin);
  
  return  _senIrIzqValue*2 + _senIrDerValue; 
}

void motoresServo(int _senQrdValue, int _senIrValue){
  if (_senQrdValue == 0){
    switch (_senIrValue){
      case 0:
        // No encuentro enemigo, avanzo de Frente
        muevoServos(serIzqAvaRa, serDerAvaRa, repAvanza);
        break;
      case 1:
        // Enemigo a la Derecha
        muevoServos(serIzqAvaRa, serDerStop, repGiro);
        break;
      case 2:
        // Enemigo a la Izquierda
        muevoServos(serIzqStop, serDerAvaRa, repGiro);
        break;
      case 3:
        // Enemigo enfrente de mi
        muevoServos(serIzqAvaRa, serDerAvaRa, repAvanza);
        break;
    }
  }else{
    switch (senQrdValue){
      case 1:
        // Linea en mi sensor derecho
        muevoServos(serIzqRevRa, serDerRevRa, repReversa);
        muevoServos(serIzqRevRa, serDerAvaRa, repGiro);
        break;
      case 2:
        // Linea en mi sensor izquierdo
        muevoServos(serIzqRevRa, serDerRevRa, repReversa);
        muevoServos(serIzqAvaRa, serDerRevRa, repGiro);
        break;
      case 3:
        // Linea en mis dos sensores
        muevoServos(serIzqRevRa, serDerRevRa, repReversa*2);
        muevoServos(serIzqRevRa, serDerAvaRa, repVuelta);
        break;
    }
  }  
}

void muevoServos(int _movIzq, int _movDer, int _repeticiones){
  for (int i = 0; i < _repeticiones; i++){  
    servoIzq.write(_movIzq);
    servoDer.write(_movDer);
    delay(15);
  }
}

