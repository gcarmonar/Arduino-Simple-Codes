/* 
---> Proyecto2_Modificado
Proyecto 2 con bocina indicadora.

Autor: Gerardo Carmona
V1.0
Rev.: 09 / Sept / 2011

*/

// Puertos
const int SemVerde = 6;
const int SemAmarillo = 5;
const int SemRojo = 4;
const int PasoVerde = 3;
const int PasoRojo = 2;
const int botonPin = 7;


//Variables
int botonState;


void setup(){
  pinMode(SemVerde, OUTPUT);
  pinMode(SemAmarillo, OUTPUT);
  pinMode(SemRojo, OUTPUT);
  pinMode(PasoRojo, OUTPUT);
  pinMode(PasoVerde, OUTPUT);
}


void loop(){
  botonState = digitalRead(botonPin);
  if (botonState == LOW){
    digitalWrite(SemVerde, HIGH);
    digitalWrite(PasoRojo, HIGH);
  }else{
    for (int i = 0; i < 3; i++){
      digitalWrite(SemVerde, LOW); 
      delay(500);
      digitalWrite(SemVerde, HIGH); 
      delay(500);
    }
    digitalWrite(SemVerde, LOW);
    digitalWrite(SemAmarillo, HIGH);
    delay(1000);
    digitalWrite(SemAmarillo, LOW);
    digitalWrite(SemRojo, HIGH);
    digitalWrite(PasoVerde, HIGH);
    digitalWrite(PasoRojo, LOW);
    delay(5000);
    digitalWrite(SemRojo, LOW);
    digitalWrite(PasoVerde, LOW);
  }
}
