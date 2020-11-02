
module Alarm_Clock_EE271 (
  seg0, seg1, seg2, seg3, seg4, seg5, 
  switches, pushBtn, led,
  clk
);

// Initilisations goes from here >>>>>>>>>>>>>>>>>>>>>>>

// Seven Segment Display
output reg [7:0] seg0;
output reg [7:0] seg1;
output reg [7:0] seg2;
output reg [7:0] seg3;
output reg [7:0] seg4;
output reg [7:0] seg5;

// Switches
input [9:0] switches;

// Push button
input [1:0] pushBtn;

// LED's
input [9:0] led;

// Clock
input clk;

parameter resetState = 0, alarmState = 1, timerState = 2, stopwatchState = 3;

// Code goes from here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

reg [2:0] currentState, nextState;

initial begin
  seg0 = 8'b11_11_11_11;
  seg1 = 8'b11_11_11_11;
  seg2 = 8'b11_11_11_11;
  seg3 = 8'b11_11_11_11;
  seg4 = 8'b11_11_11_11;
  seg5 = 8'b11_11_11_11;
  currentState = 0 ;
end

always @ (posedge pushBtn) begin
  if (!pushBtn[0])
    currentState = currentState + 1;
    if (currentState > 3) begin
      currentState = 0;
  end
end


always @ (currentState) begin
  case(currentState)
    2'b00 : seg0 = 8'b11_00_00_00;
    2'b01 : seg0 = 8'b11_11_10_01;
    2'b10 : seg0 = 8'b10_10_01_00;
    2'b11 : seg0 = 8'b10_11_00_00;
  endcase
end

endmodule
