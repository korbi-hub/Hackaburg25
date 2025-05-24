#include "c_esp32.h"

ESP_Steuerung* c_esp = new ESP_Steuerung(); 


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);         // WICHTIG: Seriellen Monitor starten!
  c_esp->A01_Setup();
  Serial.println("Setup completed");
}

void loop() {
  c_esp->A02_CommIn();
  c_esp->A03_SetFlags();
  c_esp->A09_SequenceManager();
  c_esp->A10_Sequence0_Einrichtung();
  c_esp->A11_Sequence1_Aufsperren();
  //c_esp->A12_Sequence2_FahrenV2X();
  c_esp->A13_Sequence3_Zusperren();
  c_esp->A14_Sequence4_FalscheUUID();
  c_esp->A15_Sequence5_Beschleunigungssensor();
  c_esp->A30_Messages();
  c_esp->A31_CommOut();
}

