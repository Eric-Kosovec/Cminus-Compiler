for file in *.cm;
do

	../cmc $file

done

for file in *.s;
do
	echo -n "Processing $file... "
	outfile="${file%.*}.out"
	infile="${file%.*}.in"
	
	if [ -f $infile ]; then
		java -jar Mars.jar me nc $file < $infile > $outfile
	else
		java -jar Mars.jar me nc $file > $outfile
	fi

	echo "Done"
done
