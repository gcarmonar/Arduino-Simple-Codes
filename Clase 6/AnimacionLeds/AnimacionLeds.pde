/* 
---> AnimacionLeds
Realiza una animación en una matriz de leds de 3x3

Autor: Gerado Carmona
Versión: 1.0
Rev.: 12 / Oct / 2011
*/

// =========== Puertos ===========================================
#define LedPin11 12
#define LedPin12 11
#define LedPin13 10
#define LedPin21 9
#define LedPin22 8
#define LedPin23 7
#define LedPin31 6
#define LedPin32 5
#define LedPin33 4

// =========== Constantes ========================================
#define tiempo 500

// =========== Variables =========================================


// =========== Inicialización ====================================
void setup(){
  for (int i = 4; i <= 12; i++){
    pinMode(i, OUTPUT);
  }
}

// =========== Programa Principal ================================
void loop(){
  signoMas();
  delay(tiempo);
  ledsOff();
  delay(tiempo/5);
  
  signoPor();
  delay(tiempo);
  ledsOff();
  delay(tiempo/5);
  
  animacion1();
  delay(tiempo/5);
  
}

// =========== Sub-rutinas =======================================
void signoMas(){
  digitalWrite(LedPin11, LOW);
  digitalWrite(LedPin12, HIGH);
  digitalWrite(LedPin13, LOW);
  digitalWrite(LedPin21, HIGH);
  digitalWrite(LedPin22, HIGH);
  digitalWrite(LedPin23, HIGH);
  digitalWrite(LedPin31, LOW);
  digitalWrite(LedPin32, HIGH);
  digitalWrite(LedPin33, LOW);
  
}

void signoPor(){
  digitalWrite(LedPin11, HIGH);
  digitalWrite(LedPin12, LOW);
  digitalWrite(LedPin13, HIGH);
  digitalWrite(LedPin21, LOW);
  digitalWrite(LedPin22, HIGH);
  digitalWrite(LedPin23, LOW);
  digitalWrite(LedPin31, HIGH);
  digitalWrite(LedPin32, LOW);
  digitalWrite(LedPin33, HIGH);
}

void ledsOff(){
  digitalWrite(LedPin11, LOW);
  digitalWrite(LedPin12, LOW);
  digitalWrite(LedPin13, LOW);
  digitalWrite(LedPin21, LOW);
  digitalWrite(LedPin22, LOW);
  digitalWrite(LedPin23, LOW);
  digitalWrite(LedPin31, LOW);
  digitalWrite(LedPin32, LOW);
  digitalWrite(LedPin33, LOW);
}

void ledsOn(){
  digitalWrite(LedPin11, HIGH);
  digitalWrite(LedPin12, HIGH);
  digitalWrite(LedPin13, HIGH);
  digitalWrite(LedPin21, HIGH);
  digitalWrite(LedPin22, HIGH);
  digitalWrite(LedPin23, HIGH);
  digitalWrite(LedPin31, HIGH);
  digitalWrite(LedPin32, HIGH);
  digitalWrite(LedPin33, HIGH);
}

void animacion1(){
  for (int i = 4; i <= 12; i++){
    digitalWrite(i, HIGH);
    delay(tiempo/5);
  }
  for (int i = 4; i <= 12; i++){
    digitalWrite(i, LOW);
    delay(tiempo/5);
  }
}

