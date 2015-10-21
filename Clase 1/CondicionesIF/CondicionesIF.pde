/* 
---> CondicionesIF
En este archivo se muestran las diferentes formas de hacer una condición IF sencilla

Autor: Gerardo Carmona
V1.0
Rev.: 13 / Nov / 2010
*/

// Se declaran constantes para los establecer
// los números de los puertos
const int Led = 13;
const int Boton = 12;

int estado = 0;

void setup(){
  pinMode(Led, OUTPUT);
  pinMode(Boton, INPUT); 
}


void loop(){
  estado = digitalRead(Boton);
  // Forma 1
  if (estado == HIGH) digitalWrite(Led, HIGH); 
  // Forma 2
  if (estado == HIGH){ digitalWrite(Led, HIGH);}
  // Forma 3
  if (estado == HIGH){ 
    digitalWrite(Led, HIGH);
  }
  // Forma 4 (Solo si es una línea de código)
  if (estado == HIGH)
    digitalWrite(Led, HIGH);
}
