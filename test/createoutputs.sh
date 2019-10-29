for file in *.cm;
do
	../cmc $file
done

for file in *.s;
do
	echo -n "Processing $file... "
	outfile="output/${file%.*}.output"
	infile="input/${file%.*}.in"
	
	if [ -f $infile ]; then
		java -jar ../bin/Mars.jar me nc $file < $infile > $outfile
	else
		java -jar ../bin/Mars.jar me nc $file > $outfile
	fi

	echo "Done"
done
