#include <Servo.h>
Servo servoIzq;
Servo servoDer;

//--- Puertos ---------------------------------
#define servoIzqPin 9
#define servoDerPin 8
#define fotoIzqPin A0
#define fotoCenPin A1
#define fotoDerPin A2

//--- Constantes ------------------------------
#define sIzqAva 179
#define sIzqRev 0
#define sIzqStop 90
#define sDerAva 0
#define sDerRev 179
#define sDerStop 90
#define diferencia 100
#define detenerse 0
#define giroIzq 1
#define avanzar 2
#define giroDer 3
#define detenerse 0
#define repeticiones 10

//--- Variables -------------------------------
int fotoIzqVal;
int fotoCenVal;
int fotoDerVal;
int movimiento;

//--- Setup -----------------------------------
void setup(){
  servoIzq.attach(servoIzqPin);
  servoDer.attach(servoDerPin);
  Serial.begin(9600);
}

//--- Programa principal ----------------------
void loop(){
  fotoIzqVal = leerFoto(fotoIzqPin);
  fotoCenVal = leerFoto(fotoCenPin);
  fotoDerVal = leerFoto(fotoDerPin);
  
  movimiento = compararSensores(fotoIzqVal, fotoCenVal, fotoDerVal);
  
  servos(movimiento);
}

//--- Funciones ------------------------------
int leerFoto(int puerto){
  int valor = analogRead(puerto);
  return valor;
}

int compararSensores(int valIzq, int valCen, int valDer){
  int mov;
  
  if (valCen >= valIzq + diferencia && valCen >= valDer + diferencia){
    mov = avanzar;
  } else if (valIzq >= valCen + diferencia && valIzq >= valDer + diferencia){
    mov = giroIzq;
  } else if (valDer >= valIzq + diferencia && valDer >= valCen + diferencia){
    mov = giroDer;
  } else {
    mov = detenerse;
  }
  return mov;  
}

void servos(int direccion){
  if (direccion == giroIzq){
    for (int i = 0; i < repeticiones; i++){
      servoIzq.write(sIzqRev);
      servoDer.write(sDerAva);
      delay(15);
    }
  } else if (direccion == avanzar){
    for (int i = 0; i < repeticiones; i++){
      servoIzq.write(sIzqAva);
      servoDer.write(sDerAva);
      delay(15);
    }
  } else if (direccion == giroDer){
    for (int i = 0; i < repeticiones; i++){
      servoIzq.write(sIzqAva);
      servoDer.write(sDerRev);
      delay(15);
    }
  } else {
    servoIzq.write(sIzqStop);
    servoDer.write(sDerStop);
    delay(15);
  }
}
    
