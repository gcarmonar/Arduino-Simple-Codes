/* 
---> SuenaBocinaV1
Versión 1. Se prende y apaga una bocina utilizando solo un boton.
En esta verión se utiliza el do while.

Autor: Gerado Carmona
Versión: 1.0
Rev.: 22 / Sept / 2011
*/

// =========== Puertos ===========================================
const int bocinaPin = 3;
const int botonPin = 2;

// =========== Constantes ========================================

// =========== Variables =========================================
int botonValue;
int potValue;

// =========== Inicialización ====================================
void setup(){
  pinMode(bocinaPin, OUTPUT);
  pinMode(botonPin, INPUT);  
}

// =========== Programa Principal ================================
void loop(){
  
  // Ciclo que se estara ejecutando hasta que el boton sea 
  // presionado
  do{
    botonValue = digitalRead(botonPin); // Solo se lee el boton
    tone(bocinaPin, 3500);
  }while(botonValue == 0);
  
  delay(200); //Tiempo que le da al usuario a quitar el dedo
  
  // Ciclo que se estara ejecutando hasta que el boton sea 
  // presionado
  do{
    botonValue = digitalRead(botonPin); // Solo se lee el boton
    noTone(bocinaPin);
  }while(botonValue == 0);
  
  delay(200); // Tiempo que le da al usuario a quitar el dedo
}
