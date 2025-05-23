#include <Arduino.h>
#include "c_esp32.h"

ESP_Steuerung* c_esp = new ESP_Steuerung(); 


void setup() {
  c_esp->A01_Setup();
}

void loop() {
  c_esp->A02_CommIn();
  c_esp->A03_SetFlags();
  c_esp->A09_SequenceManager();
  c_esp->A30_Messages();
  c_esp->A31_CommOut();
}

