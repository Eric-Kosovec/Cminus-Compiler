# Cminus-Compiler
Compiles the toy language Cminus into MIPS assembly using flex and bison. Main components of the compiler are the CminusParser.y (parser) and CminusScanner.l (lexical analyzer) files within the parser folder.

Note: Some lines may appear to have weird spacing, but that's due to having worked on the project in Linux.

## Compiling the Compiler
You will need a Linux machine with flex and bison, which can be installed through the following commands:
>sudo apt install bison<br>
>sudo apt install flex

Now simply run command 'make' in the root directory of the project, which creates the compiler binary called 'cmc.'

## Running the Compiler
Run with the following command: 
>./cmc [.cm's filepath]

This will create a MIPS assembly file of the same name with extension '.s' in the same directory as the '.cm' file. This can be viewed and run in the Mars.jar program, assuming you have Java installed.

## Cleaning Up
Run 'make clean' in the root directory of the project.

## Testing
**Testing will temporarily not work.**
You will need to install Java through the following command:
>sudo apt install default-jdk

Inside the test folder, run the test.sh shell script, which will test each program against known-good output files.
