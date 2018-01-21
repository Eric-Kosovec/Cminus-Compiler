# Cminus-Compiler
Compiles the toy language Cminus into MIPS assembly using flex and bison. Main components of the compiler are the CminusParser.y (parser) and CminusScanner.l (lexical analyzer) files within the parser folder.

Note: Some lines may appear to have weird spacing, but that's due to having worked on the project in Linux.

To compile:
You will need flex and bison, which can be installed through the following commands:
	sudo apt install bison
	sudo apt install flex

Now simply run command make in the root directory of the project, which creates the compiler binary called cmc.

To run:
Run ./cmc [.cm's filepath]

This will create a MIPS assembly file of the same name with extension .s in the same directory as the .cm file. This can be viewed and run in the Mars.jar program.

To cleanup:
Run make clean in the root directory of the project.

To test:
*** Testing will temporarily not work. ***
You will need java through the following command:
	sudo apt install default-jdk
