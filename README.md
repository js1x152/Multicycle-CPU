# CMPEN331_MultiCycleCPU

This was a multicycle processor designed in Verilog as the Final Project for CMPEN331, a class I completed while attending Penn State University. 

If you follow the Datapath, you can see that the processor is broken down into 5 phases: Fetch, Decode, Execution, Memory, and Writeback. 
In Instruction fetch, the processor gets the instruction from memory based on what the line the program counter is pointing to. 
In the Instruction Decode phase, the control unit deciphers what values it should pass on to the ALU. 
In the Execution phase, the ALU processes the values it's been given and decides what logic operation to perform based on the aluc.
In the Memory phase, values are passed along to the register file if needed or the value from the alu is written to memory or the alu is used to find the memory address. 
In the Writeback phase, values are either grabbed and passed along to the multiplexers in the decode stage, or values from the alu are written to the registers. 
