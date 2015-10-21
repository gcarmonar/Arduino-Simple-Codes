/* 
---> Proyecto2_Modificado
Proyecto 2 con bocina indicadora.

Autor: Gerardo Carmona
V1.0
Rev.: 09 / Sept / 2011

*/

// Puertos
int SemVerde = 6;
int SemAmarillo = 5;
int SemRojo = 4;
int PasoVerde = 3;
int PasoRojo = 2;
int botonPin = 7;
int bocinaPin = 8;


//Variables
int botonState;


void setup(){
  pinMode(SemVerde, OUTPUT);
  pinMode(SemAmarillo, OUTPUT);
  pinMode(SemRojo, OUTPUT);
  pinMode(PasoRojo, OUTPUT);
  pinMode(PasoVerde, OUTPUT);
  pinMode(botonPin, INPUT);
}


void loop(){
  do{
    botonState = digitalRead(botonPin);
    digitalWrite(SemVerde, HIGH);
    digitalWrite(PasoRojo, HIGH);
  }while (botonState == LOW);

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
  
  //Suena 4 veces con sonidos cortos
  for (int i = 0; i < 4; i++){
    tone(bocinaPin, 4400, 50);
    delay(950);
  }
  //Suena una vez con una duración mayor
  tone(bocinaPin, 4400, 50);
  delay(150);
  tone(bocinaPin, 4400, 50);
  delay(750);  
  digitalWrite(SemRojo, LOW);
  digitalWrite(PasoVerde, LOW);
  
}
