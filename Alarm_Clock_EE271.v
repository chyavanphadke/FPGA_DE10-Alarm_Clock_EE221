module Alarm_Clock_EE271 (
	clk, 
	pushBtn, 
	switches, 
	led, 
	seg0, seg1, 
	seg2, seg3, 
	seg4, seg5
);

// Switches
input [9:0] switches;

// Push button
input [1:0] pushBtn;

// Clock
input clk;

// LED's
output [9:0] led;


output reg [7:0] seg0;
output reg [7:0] seg1;
output reg [7:0] seg2;
output reg [7:0] seg3;
output reg [7:0] seg4;
output reg [7:0] seg5;

reg [1:0] currentState;

reg [24:0]counter_pressed, counter_not_pressed;
reg button_state = 1'b1;

initial begin
currentState <= 2'b0;
counter_pressed <= 25'b0;
counter_not_pressed <= 25'b0;
end

initial begin
  seg0 = 8'b11_11_11_11;
  seg1 = 8'b11_11_11_11;
  seg2 = 8'b11_11_11_11;
  seg3 = 8'b11_11_11_11;
  seg4 = 8'b11_11_11_11;
  seg5 = 8'b11_11_11_11;
end

always @ (posedge clk or negedge pushBtn[1])
begin
	if(!pushBtn[1])
		begin
		currentState <= 2'b0;
		counter_pressed<= 25'b0;
		counter_not_pressed<= 25'b0;
		end
	
	else
		begin
	
		if(!pushBtn[0] & !button_state)
			begin
			counter_pressed <= counter_pressed + 1'b1;
			end

		else
			begin
			counter_pressed <= 25'b0;
			end

		if(counter_pressed == 25'd2000000)
			begin
			currentState = currentState + 1'b1;
			counter_pressed <= 25'b0;
			button_state = 1'b1;
			end

		if(pushBtn[0] & button_state)
			begin
			counter_not_pressed <= counter_not_pressed + 1'b1;		
			end

		else
			begin
			counter_not_pressed <= 25'b0;
			end

		if(counter_not_pressed == 25'd2000000)
			begin
			counter_not_pressed <= 25'b0;
			button_state = 1'b0;
			end
		end
end

assign led[7:0] = currentState[1:0];

always @ (currentState) begin
  case(currentState)
		0: seg0 = 8'b11_00_00_00;
		1: seg0 = 8'b11_11_10_01;
		2: seg0 = 8'b10_10_01_00;
		3: seg0 = 8'b10_11_00_00;
		4: seg0 = 8'b10_01_10_01;
		5: seg0 = 8'b10_01_00_10;
		6: seg0 = 8'b10_00_00_10;
		7: seg0 = 8'b11_11_10_00;
		8: seg0 = 8'b10_00_00_00;
		9: seg0 = 8'b10_01_00_00;
  endcase
end

endmodule 
