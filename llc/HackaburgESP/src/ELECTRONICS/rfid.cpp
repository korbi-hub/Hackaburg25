#include <SPI.h>
#include <MFRC522.h>

const int pin_rfid_rst = 17;
const int pin_rfid_cs = 5;

// SPI with MISO=19, MOSI=23, CLK=18, CS=5
MFRC522_SPI spiDevice(pin_rfid_cs, pin_rfid_rst);
MFRC522 mfrc(&spiDevice);

bool rfid_match = false;

bool rfid_is_key_match()
{
    if (!rfid_match) return false;
    rfid_match = false;
    return true;
}


void rfid_setup()
{
    SPI.begin(18, 19, 23);
    mfrc.PCD_Init();
    mfrc.PCD_DumpVersionToSerial();
}


void rfid_loop()
{
    if (!mfrc.PICC_IsNewCardPresent()) {
        return;
    }

    // Select one of the cards
    if (!mfrc.PICC_ReadCardSerial()) {
        Serial.println("Bad read (was card removed too quickly?)");
        return;
    }

    if (mfrc.uid.size == 0) {
        Serial.println("Bad card (size = 0)");
    } else {
        char tag[sizeof(mfrc.uid.uidByte) * 4+1] = { 0 };
        for (int i = 0; i < mfrc.uid.size; i++) {
            char buff[5]; // 3 digits, dash and \0.
            snprintf(buff, sizeof(buff), "%s%d", i ? "-" : "", mfrc.uid.uidByte[i]);
            strncat(tag, buff, sizeof(tag)-1);
        };
        Serial.println("Good scan: ");
        Serial.println(tag);

        int cmp = strcmp(tag, "185-187-175-185");
        if (cmp == 0)
        {
            Serial.println("match!");
            rfid_match = true;
        }
    };

    // disengage with the card.
    //
    mfrc.PICC_HaltA();
}