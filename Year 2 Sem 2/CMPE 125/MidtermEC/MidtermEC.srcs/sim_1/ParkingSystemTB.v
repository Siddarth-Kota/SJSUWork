`timescale 1ns / 1ps

module ParkingSystemTB;
    //Inputs
    reg clk;
    reg rst;
    reg sensor_in;
    reg sensor_out;
    reg [3:0] passcode_in;

    //Outputs
    wire gate_in;
    wire gate_out;

    ParkingSystem dut(
        .clk(clk),
        .rst(rst),
        .sensor_in(sensor_in),
        .sensor_out(sensor_out),
        .passcode_in(passcode_in),
        .gate_in(gate_in),
        .gate_out(gate_out)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time: %0t | Sensor In: %b | Sensor Out: %b | Passcode: %b | Gate In: %b | Gate Out: %b | Current_state = %b | Counter = %b", $time, sensor_in, sensor_out, passcode_in, gate_in, gate_out, dut.cs, dut.counter);

        clk = 0;
        rst = 0;
        sensor_in = 0;
        sensor_out = 0;
        passcode_in = 4'b0000;

        #15 rst = 1;
        #10;

        //Car enters the parking and Entrance sensor is activated
        sensor_in = 1;

        //User enters correct password and gate opens
        #30; 
        passcode_in = 4'b1010;
        #50;

        sensor_in = 0;
        #20;

        //Outpit sensor detected
        sensor_out = 1;

        //First password is wrong
        #30;
        passcode_in = 4'b0000;
        #50;

        //Second password is correct and gate opens
        #30;
        passcode_in = 4'b1010;
        #50;

        sensor_out = 0;
        #50;

        $finish;
    end
endmodule