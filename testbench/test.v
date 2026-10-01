`include "DUT.v"

module tb;

    reg CLK;
    reg rst;

    // Instantiate DUT
    DUT DUT_inst (
        .CLK(CLK),
        .rst(rst)
    );

    integer i;
    
    // Clock generation
    always #5 CLK = ~CLK;

    // Test sequence
    initial begin
        CLK = 0;
        rst = 1;

        // Apply reset
        #10;
        rst = 0;
        
        // ================= INITIALIZE DATA MEMORY =================
        //DUT_inst.Data_Path_inst.Data_Memory_inst.mem[0] = 0;
        for(i=0;i<1024;i=i+1)
        begin
            DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[i]=0;
            DUT_inst.Data_Path_inst.Data_Memory_inst.mem[i]=0;
        end

        // ================= LOAD INSTRUCTIONS =================
        // Example program:
        // ADDI x1, x0, 5
        // ADDI x2, x0, 10
        // ADD  x3, x1, x2
        // SW   x3, 0(x0)
        // LW   x4, 0(x0)

        //DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[0] = 32'h00500093; // ADDI x1,x0,5
        //DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[1] = 32'h00A00113; // ADDI x2,x0,10
        //DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[2] = 32'h002081B3; // ADD x3,x1,x2
        //DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[3] = 32'h00302023; // SW x3,0(x0)
        //DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[4] = 32'h00002203; // LW x4,0(x0)

        // ADDI x1,x0,5  = 32'h00500093
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[0] = 8'h93;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[1] = 8'h00;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[2] = 8'h50;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[3] = 8'h00;
        
        // ADDI x2,x0,10 = 32'h00A00113
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[4] = 8'h13;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[5] = 8'h01;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[6] = 8'hA0;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[7] = 8'h00;
        
        // ADD x3,x1,x2 = 32'h002081B3
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[8]  = 8'hB3;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[9]  = 8'h81;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[10] = 8'h20;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[11] = 8'h00;
        
        // SW x3,0(x0) = 32'h00302023
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[12] = 8'h23;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[13] = 8'h20;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[14] = 8'h30;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[15] = 8'h00;
        
        // LW x4,0(x0) = 32'h00002203
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[16] = 8'h03;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[17] = 8'h22;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[18] = 8'h00;
        DUT_inst.Data_Path_inst.Instruction_Memory_inst.mem[19] = 8'h00;

        // ================= RUN =================
        #200;

        // ================= CHECK RESULTS =================
        $display("x1 = %0d", DUT_inst.Data_Path_inst.Register_File_inst.mem[1]);
        $display("x2 = %0d", DUT_inst.Data_Path_inst.Register_File_inst.mem[2]);
        $display("x3 = %0d", DUT_inst.Data_Path_inst.Register_File_inst.mem[3]);
        $display("x4 = %0d", DUT_inst.Data_Path_inst.Register_File_inst.mem[4]);

        $display("Memory[0] = %0d", DUT_inst.Data_Path_inst.Data_Memory_inst.mem[0]);

        // Expected:
        // x1 = 5
        // x2 = 10
        // x3 = 15
        // x4 = 15
        // mem[0] = 15

        $finish;
    end

endmodule
