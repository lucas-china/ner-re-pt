#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")
printf "\n*** output gold ***\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for level in "${levels[@]}"
	do
		for i in {0..9}
		do
			printf "\n** fold "$i" **\n"
			FOLDER=../outputs/repeat-$r/fold-$i
			OUT=../outputs/repeat-$r/ner-results/fold-$i

			python "../src/out-conll-gold.py" $FOLDER/t-$level-test-doc.txt $OUT/out-$level-gold.txt
		done

		# TODO
		# printf "\n** experiences **\n"
		# FOLDER=../outputs/repeat-$r/fold-$i
		# OUT=../outputs/repeat-$r/ner-results/fold-$i

		# python "../src/out-conll-gold.py" $FOLDER/t-$level-test-doc.txt $OUT/out-$level-gold.txt
	done
done