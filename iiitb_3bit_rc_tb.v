module iiitb_3bit_rc_tb;

    // Inputs
    reg Clock;
    reg Reset;

    // Outputs
    wire [2:0] Count_out;

    // Instantiate the Unit Under Test (UUT)
    iiitb_3bit_rc uut (
        .Clock(Clock),
        .Reset(Reset),
        .Count_out(Count_out)
    );

    ///////////////////Clock generation ///////////////////////////
    initial Clock = 0;
    always #10 Clock = ~Clock;

    ////////// #10 means wait for 10 ns before executing the next statement. ///////////

    //Simulation inputs.
    initial begin
    //Apply Reset for 50 ns.
        $dumpfile("iiitb_3bit_rr_out.vcd");
        $dumpvars(0,iiitb_3bit_rc_tb);
        Reset = 1; //Reset is high
        #50;       //Wait for 50 ns
        Reset = 0; //Reset is low.
    end


endmodule

