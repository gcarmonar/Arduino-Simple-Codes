/* 
---> CondicionesIfElse
Ejemplo del uso de una condición IF...ELSE

Autor: Gerardo Carmona
V1.0
Rev.: 14 / Nov / 2010
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
  if (estado == HIGH){
    digitalWrite(Led, HIGH);
  } else {
    digitalWrite(Led, LOW);
  }
}
