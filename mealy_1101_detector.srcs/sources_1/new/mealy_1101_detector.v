module mealy_1101_detector(
    input clk,
    input x,
    input reset_n,
    output reg y
    );
    
    reg [2:0] current_state , next_state;
    localparam s0 = 2'b00;
    localparam s1 = 2'b01;
    localparam s2 = 2'b10;
    localparam s3 = 2'b11;
    
    
    always @(posedge clk, negedge reset_n)
    begin
        if(!reset_n)
        current_state <= s0;
        else
        current_state <= next_state;
    end
    
    always @(*)
    begin
       y <= 0;
        case(current_state)
            s0:
                begin
                    if(x)
                        next_state <= s1;
                    else
                        next_state <= s0;
                end
            s1: 
                begin
                    if(x)
                        next_state <= s2;
                    else
                        next_state <= s0;
                end
            s2: 
                begin
                    if(x)
                        next_state <= s2;
                    else
                        next_state <= s3;
                end
            s3:     
                begin
                    if(x)
                    begin
                        next_state <= s1;
                        y <= 1 ;
                    end
                    else
                        next_state <= s0;
                 end
            
             default: next_state <= current_state;
        endcase
    end
    
endmodule
