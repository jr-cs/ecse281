
module lab6 ();

	function logic [7:0] decoder3to8 (logic en_b, logic [2:0] in); // Creates "decoder3to8" function with "en_b" enable input and a three-bit logic vector for the "in" inputs
		casex({en_b, in}) // calls case function with don't cares for inputs of "decoder3to8" 
// Left-most bit in binary on left side is for "en_b"; otherwise just a three-bit truth table
// Uses slide 8 truth table for 74x138 decoder from recitation slides for left side and right side
			4'b1xxx: return 8'b1111_1111; // This is the don't care line of the casex
			4'b0000: return 8'b1111_1110; // This is the first of eight possiblities, as signified by the [7:0] on line 4
			4'b0001: return 8'b1111_1101; // The underscore is for readability btw; doesn't affect code
			4'b0010: return 8'b1111_1011;
			4'b0011: return 8'b1111_0111;
			4'b0100: return 8'b1110_1111;
			4'b0101: return 8'b1101_1111;
			4'b0110: return 8'b1011_1111;
			4'b0111: return 8'b0111_1111;
// COMPLETED 
        endcase
    endfunction

	function logic [2:0] encoder8to3 (logic en_b, logic [7:0] in_b); // Completed 
		casex({en_b, in_b})
// Right side is a three-bit truth table like left side of decoder
// Uses slide 9 truth table for 74x138 encoder from recitation slides for left side and right side
			9'b1_xxxxxxxx: return 3'b111;
			9'b0_xxxxxxx0: return 3'b000;
			9'b0_xxxxxx01: return 3'b001;
			9'b0_xxxxx011: return 3'b010;
			9'b0_xxxx0111: return 3'b011;
			9'b0_xxx01111: return 3'b100;
			9'b0_xx011111: return 3'b101;
			9'b0_x0111111: return 3'b110;
			9'b0_01111111: return 3'b111;

   // COMPLETED 
        endcase
    endfunction

    logic [2:0] in, out;
    logic       clk;

    assign out = encoder8to3(clk, decoder3to8(clk, in)); // Completed 

    initial begin
        clk = 1'b1;
        in  = 3'b111;
        forever #5 clk = ~clk;
    end

    always @ (posedge clk) begin // Triggers following code whenever it goes from 0 to 1 (flip flop) 
        in = in + 1; // Incrementing "in" by 1 
   // Completed! Runchao Li helped with lines 50, 51, and 53
    end

    initial
        #80 $finish();

endmodule