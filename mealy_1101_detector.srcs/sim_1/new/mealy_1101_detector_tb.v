`timescale 1ns / 1ns

module mealy_1101_detector_tb;
    // declare internal testbench signals
    localparam T = 20; // clk period
    reg clk, reset_n ,x;
    wire y;
    
    
     // Instantiate the binary counter module with 4 bits
      mealy_1101_detector dut (
           .clk(clk),
           .reset_n(reset_n),
           .x(x),
           .y(y)
       );
// Generate clock signal
           always begin
               clk = 1'b1;
               #(T/2);
               clk = 1'b0;
               #(T/2);
           end
  // rst
             initial begin
                 reset_n = 1'b0;
                 #(T/4);
                 reset_n = 1'b1;
             end
             
     
                 // Stimulus generation
                 initial begin
                     // initial values
                     x = 0;
                   repeat (2) @(posedge clk);
//                     x = 1'b1;
//                   repeat (2) @(posedge clk);
//                     x = 1'b0;
//                   @(posedge clk);
//                     x = 1'b1;
//                   repeat (2) @(posedge clk);
//                      x = 1'b1;
//                   repeat (2) @(posedge clk);
//                       x = 1'b0;
                  #T  x= 1'b1; 
                  #T  x= 1'b1; 
                  #T  x= 1'b0;
                  #T  x= 1'b1;
                  #T  x= 1'b1; 
                  #T  x= 1'b0;
                  #T  x= 1'b1;    
                  #T  x= 1'b0;
                  #T  x= 1'b1;
                  #T  x= 1'b1; 
                  #T  x= 1'b0;
                  #T  x= 1'b1;    
                     $stop;
                 end
endmodule
