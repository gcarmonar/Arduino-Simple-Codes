/* 
---> LeerBoton
Se utiliza un metodo para leer una boton y se regresa el valor.

Autor: Gerado Carmona
Versión: 1.0
Rev.: 12 / Oct / 2011
*/

// =========== Puertos ===========================================
#define botonPin 2
#define ledPin 13

// =========== Constantes ========================================


// =========== Variables =========================================
int botonValue;

// =========== Inicialización ====================================
void setup(){
  pinMode(botonPin, INPUT);
  pinMode(ledPin, OUTPUT);
}

// =========== Programa Principal ================================
void loop(){
  botonValue = leerBoton();
  if (botonValue == 1) {
    digitalWrite(ledPin, HIGH);
  }else{
    digitalWrite(ledPin, LOW);
  }
}

// =========== Sub-rutinas =======================================
int leerBoton(){
  int variable;
  variable = digitalRead(botonPin);
  return variable;
}
