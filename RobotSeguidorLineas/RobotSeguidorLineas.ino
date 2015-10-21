/* 
---> RobotSeguidorLineas
Mi robot seguidor de lineas

Autor: Gerado Carmona
Versión: 1.0
Rev.: 25 / Jun / 2012

--> Historial
v1.0 :: 25 / Jun / 2012
+ Se creó el archivo

*/

// =========== Librerias =========================================
#include <Servo.h>
Servo serDer;
Servo serIzq;

// =========== Puertos ===========================================
#define serDerPin 9
#define serIzqPin 8
#define senDerPin A0
#define senCenPin A1
#define senIzqPin A2
#define ledStatusPin 13
#define botStopPin 2

// =========== Constantes ========================================
// Constantes para los motores servos
#define serDerAva 0
#define serIzqAva 179
#define serDerRev 179
#define serIzqRev 0
#define serDerStop 90
#define serIzqStop 90
#define repeticiones 8
// Constante para comparar el sensor de linea
#define compara 500

// =========== Variables =========================================
int botStopValue;
boolean ledStatus = LOW;
int sensores;
int movimiento;

// =========== Inicialización ====================================
void setup(){
  Serial.begin(9600);
  serDer.attach(serDerPin);
  serIzq.attach(serIzqPin);
  pinMode(ledStatusPin, OUTPUT);
  pinMode(botStopPin, INPUT);
}

// =========== Programa Principal ================================
void loop(){
  do{
    digitalWrite(ledStatusPin, ledStatus);
    botStopValue = digitalRead(botStopPin);
    sensores = leerSensores();
    servos(sensores);
  }while (botStopValue == 0);
  
  delay(300);
  
  do{
    botStopValue = digitalRead(botStopPin);
    digitalWrite(ledStatusPin, ledStatus);
    ledStatus = !ledStatus;
    delay(75);
  }while (botStopValue == 0);
  
  delay(300);
  
}

// =========== Sub-rutinas =======================================
int leerSensores(){
  int sensorIzq = analogRead(senIzqPin);
  int sensorCen = analogRead(senCenPin);
  int sensorDer = analogRead(senDerPin);
  
  if (sensorIzq > compara){
    sensorIzq = 1;
  } else {
    sensorIzq = 0;
  }
  
  if (sensorCen > compara){
    sensorCen = 1;
  } else {
    sensorCen = 0;
  }
  
  
  if (sensorDer > compara){
    sensorDer = 1;
  } else {
    sensorDer = 0;
  }
  
  return sensorIzq*4 + sensorCen*2 + sensorDer;
}

void servos(int _movimiento){
  switch (_movimiento){
    case 0:
      movServos(serIzqStop, serDerStop, repeticiones);
      break;
    case 1:
      movServos(serIzqStop, serDerAva, repeticiones);
      break;
    case 2:
      movServos(serIzqAva, serDerAva, repeticiones);
      break;
    case 3:
      movServos(serIzqStop, serDerAva, repeticiones/2);
      break;
    case 4:
      movServos(serIzqAva, serDerStop, repeticiones);
      break;
    case 6:
      movServos(serIzqAva, serDerStop, repeticiones/2);
      break;
    default:
      movServos(serIzqAva, serDerAva, repeticiones);
  }
}

void movServos(int servoIzq, int servoDer, int rep){
  for (int i = 0; i < rep; i++){
    serIzq.write(servoIzq);
    serDer.write(servoDer);
    delay(15);
  }
}

  

