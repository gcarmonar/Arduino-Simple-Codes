/* 
---> CicloFor
Es recomendable que al inicio de un programa escribas una breve descripción de lo que el código hace.
Ejemplo: Este código hace parpadear al Led que esta conectado al Pin 12 a una frecuencia de 0.5H, después
de 10 veces enciende el led conectado al puerto 11 y se espera 3 segundos antes de iniciar otra vez.

Autor: Gerardo Carmona
V1.0
Rev.: 02 / Nov / 2010
*/

// Puertos
int led = 12;    // Declara led como puerto 12
int led2 = 11;   // Declara led como puerto 11

// Inicialización
void setup() {
  pinMode (led, OUTPUT);    // Declara al puerto Led (12) como salida
  pinMode (led2, OUTPUT);   // Declara al puerto Led2 (11) como salida
}

// Programa principal
void loop() {    // Ciclo infinito
  for (int i=0; i <= 10; i++){
    digitalWrite (led, HIGH);    // Establece al puerto en estado alto o uno lógico
    delay(200);    // Realiza una pausa de 200 ms
    digitalWrite (led, LOW);    // Establece al puerto en estado bajo o cero lógico
    delay(200);    // Realiza una pausa de 200 ms
  }
  digitalWrite (led2, HIGH);    // Establece al puerto en estado alto o uno lógico al finalizar el for    
  delay(3000);
  digitalWrite (led2, LOW);     // Apaga el Led2 (Establece al puerto en estado bajo o cero lógico)   
}



