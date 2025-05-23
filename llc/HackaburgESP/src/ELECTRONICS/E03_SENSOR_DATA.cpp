#include "c_electric.h"

bool Electronic::AccelSensorTriggered(){return 0;}    // evaluate sensor data
bool Electronic::buttonActivated(){return 0;} // mit button library entprellen?
bool Electronic::RFID(std::string& UUID_Pointer){return 0;}   // return: true if scan was correct / give "UUID_Pointer" the value 

long Electronic::GetValueAccelSensor(){return 0;}