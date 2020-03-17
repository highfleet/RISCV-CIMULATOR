# Hi Hi!
# <target> : <prerequisites> 
# [tab]  <commands>	

CC = c++
CFLAGS = 
LIBS = 

EXEC = run

H_COMMON = ./Utility.h\
		./Reg_def.h \

H_FILES = ./Utility.h\
		./Read_Elf.h\
		./Reg_def.h\
		./Simulation.h\
		./Instruction.h\

C_FILES = ./main.cpp\
		./Read_Elf.cpp\
		./Simulation.cpp\
		./Decode.cpp\

O_FILES = main.o Read_Elf.o Simulation.o Utility.o Decode.o

$(EXEC): $(O_FILES)
	$(CC) $(CFLAGS) -o $(EXEC) $(O_FILES)
	# rm $(O_FILES)

main.o:	./Read_Elf.h \
		$(H_COMMON)

Simulation.o: ./Simulation.h \
			./Read_Elf.h \
			./Instruction.h\
			$(H_COMMON)

Decode.o: ./Simulation.h\
		./Instruction.h\
		$(H_COMMON)

Read_Elf.o: ./Read_Elf.h \
			$(H_COMMON)

Utility.o: $(H_COMMON)

.PHONY: clean
clean: 
	rm $(O_FILES) $(EXEC)