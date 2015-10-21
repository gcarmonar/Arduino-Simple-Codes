/* 
---> DoWhile
Ejemplo de un ciclo Do...While

Autor: Gerardo Carmona
V2.0
Rev.: 08 / Sept / 2011

---> Historial
V2.0 | 08 / Sept / 2011
-Elimino comandos avanzados
+Se creo la secuencia de un semaforo peatonal

V1.0 | 15 / Nov / 2010
+Se creo el ejemplo

*/

// Puertos
int SemVerde = 6;
int SemAmarillo = 5;
int SemRojo = 4;
int PasoVerde = 3;
int PasoRojo = 2;
int botonPin = 7;

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
  delay(5000);
  digitalWrite(SemRojo, LOW);
  digitalWrite(PasoVerde, LOW);
    
}