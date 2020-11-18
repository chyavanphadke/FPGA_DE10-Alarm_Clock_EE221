#include <LiquidCrystal.h> 
int Contrast=100;
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);  

int inputSignal0 = 8;
int inputSignal1 = 9;

void setup() {
  analogWrite(6,Contrast);
  lcd.begin(16, 2);
  pinMode(inputSignal0, INPUT);
  pinMode(inputSignal1, INPUT);
}

void loop() {
int signal0 = digitalRead(inputSignal0);
int signal1 = digitalRead(inputSignal1);

if (signal0 == 0 && signal1 == 0) {
    lcd.setCursor(0, 0);
    lcd.print("State 0 -> Reset");
    lcd.setCursor(0, 1);
    lcd.print("");
  } else if (signal0 == 0 && signal1== 1) {
    lcd.setCursor(0, 0);
    lcd.print("State 1 -> Alarm");
    lcd.setCursor(0, 1);
    lcd.print("");
  } else if (signal0 == 1 && signal1 == 0) {
    lcd.setCursor(0, 0);
    lcd.print("State 2 -> Timer");
    lcd.setCursor(0, 1);
    lcd.print("");
  } else if (signal0 == 1 && signal1 == 1) {
    lcd.setCursor(0, 0);
    lcd.print("State 3 -> Stopw");
    lcd.setCursor(0, 1);
    lcd.print("");
  }
}
