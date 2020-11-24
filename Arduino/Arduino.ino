#include <LiquidCrystal.h> 
int Contrast=100;
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);  

int inpurRead0 = 7;
int inpurRead1 = 8;
int inpurRead2 = 9;
int inpurRead3 = 10;

void setup() {
  Serial.begin(9600);
  analogWrite(6,Contrast);
  lcd.begin(16, 2);
  pinMode(inpurRead0, INPUT);
  pinMode(inpurRead1, INPUT);
  pinMode(inpurRead2, INPUT);
  pinMode(inpurRead3, INPUT);
}

void loop() {
String sig0 = String(digitalRead(inpurRead0));
String sig1 = String(digitalRead(inpurRead1));
String sig2 = String(digitalRead(inpurRead2));
String sig3 = String(digitalRead(inpurRead3));

int flag = 0;

//int concatValue = sig3*1000 + sig2*100 + sig1*10 + sig0;
String concatValue = sig3 + sig2 + sig1 + sig0;
Serial.println(concatValue);

if( concatValue == "0000"){
  lcd.setCursor(0, 0);
  lcd.print("State 0 -> Reset");
  lcd.setCursor(0, 1);
  lcd.print("Displaying Time");}

if( concatValue == "1000"){
  lcd.setCursor(0, 0);
  lcd.print("State 0 -> Reset");
  lcd.setCursor(0, 1);
  lcd.print("Clock - Set Min ");}

if( concatValue == "0100"){
  lcd.setCursor(0, 0);
  lcd.print("State 0 -> Reset");
  lcd.setCursor(0, 1);
  lcd.print("Clock - Set Hour");}
// Clock done 


if( concatValue == "0010"){
  lcd.setCursor(0, 0);
  lcd.print("State 1 -> Alarm");
  lcd.setCursor(0, 1);
  lcd.print("                ");}

if( concatValue == "1010"){
  lcd.setCursor(0, 0);
  lcd.print("State 1 -> Reset");
  lcd.setCursor(0, 1);
  lcd.print("Alarm - Set Min ");}

if( concatValue == "0110"){
  lcd.setCursor(0, 0);
  lcd.print("State 1 -> Reset");
  lcd.setCursor(0, 1);
  lcd.print("Alarm - Set Hour");}
// Alarm done 


if( concatValue == "0001"){
  lcd.setCursor(0, 0);
  lcd.print("State 0 -> Timer");
  lcd.setCursor(0, 1);
  lcd.print("                ");}

if( concatValue == "0011"){
  lcd.setCursor(0, 0);
  lcd.print("State 0 -> Stopw");
  lcd.setCursor(0, 1);
  lcd.print("                ");}
}
