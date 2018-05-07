# TODO: ALLOW FOR INDIVIDUAL FILE TESTING THROUGH ARGUMENTS

for file in *.cm;
do
	../cmc "$file"
done

for file in *.s;
do
	printf "Testing %s...\n" "$file"

	outfile="output/${file%.*}.out"
	infile="input/${file%.*}.in"
	
	# Run the appropriate MIPS assembly .s file through Mars and absorb its output.
	# If a file of the form *.in exists, it must be used as input for the program.
	if [ -f "$infile" ]; then
		output=$(java -jar ../bin/Mars.jar me nc "$file" < "$infile")
	else
		output=$(java -jar ../bin/Mars.jar me nc "$file")
	fi
	
	# Files of the form *.out will have the expected output MARS should generate.
	expected="$(cat "$outfile")"
	
	# Test the expected output against the actual output so as to report errors.
	if [ "$output" != "$expected" ]; then
		echo "Error: Output different between "$file" result and "$outfile"."
		echo "Output:"
		echo "$output"
		echo ""
		echo "Expected:"
		echo "$expected"
	fi
	
done
