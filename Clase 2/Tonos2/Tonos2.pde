/* 
---> Tonos2
Se utiliza el comando Tone sin duración de tiempo, se paga con el
comando noTone(Pin);, además se intruduce el concepto de flag 
(bandera)

Autor: Gerardo Carmona
V1.0
Rev.: 09 / Sept / 2011
*/

// Puertos
int bocinaPin = 8;
int botonPin = 7;

//Variables
int botonEstado;
int bocinaSuena;

//Inicialización
void setup(){
  pinMode(botonPin, INPUT);
  pinMode(bocinaPin, OUTPUT);
  Serial.begin(9600);
}

// Programa principal
void loop(){
  botonEstado = digitalRead(botonPin);
  Serial.println(botonEstado, DEC);
  if (botonEstado == HIGH && bocinaSuena == 1){  //Suena la bocina si se presiona el boton
    tone(bocinaPin, 4400);
    bocinaSuena = 0;
    delay(250); //Tiempo que le doy a la persona para que deje de apretar el boton
  }else if (botonEstado == HIGH && bocinaSuena == 0){ //Apaga la bocina se se preciona el boton de nuevo
    noTone(bocinaPin); //Comando para dejar de sonar la bocina
    bocinaSuena = 1;
    delay(250); //Tiempo que le doy a la persona para que deje de apretar el boton
  }
}
