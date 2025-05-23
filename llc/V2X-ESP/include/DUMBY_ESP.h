#pragma once


#include <string>
#include <iostream>
class Dumby_ESP{
public:
    std::string getBluetoothData();
    void sendBluetoothData();

private:
    std::string buffer;
    bool m_BluetoothActive;
};