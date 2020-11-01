module Alarm_Clock_EE271 (
	seg0, seg1, seg2, seg3, seg4, seg5, 
	switches, pushBtn, led,
	clk
);

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

always @ (clk)
   begin
		if (switches) begin
			seg0 = 8'b00_00_00_00;
			seg1 = 8'b00_00_00_00;
			seg2 = 8'b00_00_00_00;
			seg3 = 8'b00_00_00_00;
			seg4 = 8'b00_00_00_00;
			seg5 = 8'b00_00_00_00;
		end
		else begin
			seg0 = 8'b11_11_11_11;
			seg1 = 8'b11_11_11_11;
			seg2 = 8'b11_11_11_11;
			seg3 = 8'b11_11_11_11;
			seg4 = 8'b11_11_11_11;
			seg5 = 8'b11_11_11_11;
		end
   end
endmodule