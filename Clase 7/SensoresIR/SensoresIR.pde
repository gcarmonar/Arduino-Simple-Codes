/* 
---> SensoresIR
Programa básico de como leer un sensor IR.
El sensor IR tiene 2 filtros:
1: Filtra señales infrarrojas, solo deja pasar aquellas cuya
longitud de onda esta alrededor de los 980 nm
2: Solo lee señales a una frecuencia de 38 KHz, esto es que la
señal no sea continua, sino que se encuentre parpadeando a dicha
frecuencia.

Autor: Gerado Carmona
Versión: 1.0
Rev.: 20 / Oct / 2011
*/

// =========== Puertos ===========================================
#define irLedPin 7
#define irSensorPin 6


// =========== Constantes ========================================


// =========== Variables =========================================
int irSensorValue;

// =========== Inicialización ====================================
void setup(){
  Serial.begin(9600);
  pinMode(irLedPin, OUTPUT);
  pinMode(irSensorPin, INPUT);
}

// =========== Programa Principal ================================
void loop(){
  irSensorValue = leerSensorIr();
  
}

// =========== Sub-rutinas =======================================
int leerSensorIr(){
  int microsecs = 1000;
  int _irSensorValue;
  
  // Parpadear a 38 KHz (1/38000 seg)
  while (microsecs > 0) {
   digitalWrite(irLedPin, HIGH);  // Toma alrededor de 3 us esta accioón
   delayMicroseconds(10);         // Se espera por 10 us
   digitalWrite(irLedPin, LOW);   // También le toma 3 us esta acción
   delayMicroseconds(10);         // Se espera otros 10 us
 
   // alrededor de 26 us le toma estas acciones
   microsecs -= 26;
  }
  
  // Lee un 0 si ve objeto, 1 si no lo ve.
  _irSensorValue = !digitalRead(irSensorPin);
  Serial.println(_irSensorValue);
  delay(100);
  // Invierto el valor, 0 no hay objeto, 1 si hay objeto.
  return _irSensorValue;
}
