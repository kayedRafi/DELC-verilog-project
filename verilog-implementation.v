// File: gate_level.v
module gate_level(A,B,C,D,G,F);
    input A,B,C,D,G;
    output F;
    wire a,b,c,d,g,w1,w2,w3,w4,w5,w6;
    
    not(a,A);
    not(b,B);
    not(c,C);
    not(d,D);
    not(g,G);
    
    or(w1,a,b,C,G);
    or(w2,a,B,C,d,g);
    or(w3,A,B,C,d,G);
    or(w4,A,B,c,d,g);
    or(w5,A,b,c,D,g);
    or(w6,A,B,c,D,G);
    
    and(F,w1,w2,w3,w4,w5,w6);
endmodule

// File: data_flow.v
module data_flow(A,B,C,D,G,F);
    input A,B,C,D,G;
    output F;
    wire w1,w2,w3,w4,w5,w6;
    
    assign w1=~A|~B|C|G;
    assign w2=~A|B|C|~D|~G;
    assign w3=A|B|C|~D|G;
    assign w4=A|B|~C|~D|~G;
    assign w5=A|~B|~C|D|~G;
    assign w6=A|B|~C|D|G;
    
    assign F=w1 & w2 & w3 & w4 & w5 & w6;
endmodule

// File: behavioral.v
module behavioral_model(A,B,C,D,G,F);
    input A,B,C,D,G;
    output F;
    wire A,B,C,D,G;
    reg F;
    
    always @*
    begin
        case ({A,B,C,D,G})
            5'b00010,
            5'b00100,
            5'b00111,
            5'b01101,
            5'b10011,
            5'b11000,
            5'b11010: F = 0;
            default: F = 1;
        endcase
    end
endmodule

// File: testbench.v
module test_bench();
    reg a, b, c, d, g;
    wire F;
    
    behavioral_model b1(a,b,c,d,g,F);
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
        
        // Test all 32 input combinations
        {a,b,c,d,g} = 5'b00000; #100;
        $display("a=%b,b=%b,c=%b,d=%b,g=%b,F=%b",a,b,c,d,g,F);
        
        {a,b,c,d,g} = 5'b00001; #100;
        $display("a=%b,b=%b,c=%b,d=%b,g=%b,F=%b",a,b,c,d,g,F);
        
        // ... (remaining test cases)
        
        {a,b,c,d,g} = 5'b11111; #100;
        $display("a=%b,b=%b,c=%b,d=%b,g=%b,F=%b",a,b,c,d,g,F);
    end
endmodule
