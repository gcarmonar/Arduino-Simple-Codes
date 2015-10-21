/* 
---> SuenaBocinaV2
Versión 1. Se prende y apaga una bocina utilizando solo un boton.
En esta verión se el concepto de bandera.

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
int estadoBocina = 0;

// =========== Inicialización ====================================
void setup(){
  pinMode(bocinaPin, OUTPUT);
  pinMode(botonPin, INPUT);  
}

// =========== Programa Principal ================================
void loop(){
  botonValue = digitalRead(botonPin);
  if (botonValue == 1 && estadoBocina == 0){
    tone(bocinaPin, 3500);
    estadoBocina = 1;
  }else if(botonValue == 1 && estadoBocina == 1){
    noTone(bocinaPin);
    estadoBocina = 0;
  }
}
