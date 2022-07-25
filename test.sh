#! /bin/bash
#Colors
RED="\033[00;31m"
BRED="\033[01;31m"
GREEN='\033[00;32m'
BGREEN='\033[01;32m'
YELLOW="\033[00;33m"
BYELLOW="\033[01;33m"
BLUE="\033[00;34m"
MAGENTA="\033[00;35m"
CYAN="\033[00;36m"
GREY="\033[00;37m"
WHITE="\033[00;0m"
#Variables
ARGV=$@
DIR=test
DIR1=$DIR/cmd_env
DIR2=$DIR/cmd_no_env
#intro
echo $YELLOW"---------------------------------------------------------"
echo "|	${MAGENTA}Tester de la Minishell en honor a Pdel-pin${YELLOW}	|"
echo "---------------------------------------------------------"$WHITE

#functions
manual_linux()
{
	echo "Comando introducido: $ARGV";
	rm -rf your_out my_out
	touch my_out
	bash -c "$ARGV" > my_out 2>&1
	echo "$ARGV" | ./minishell > your_out
	echo "$ARGV" | ./minishell > temp
	# echo "$ARGV" | bash > my_out 2>&1
	sed '$ d' your_out > tmp2
	tail -n +2 tmp2 > your_out
	rm -rf  tmp2

	if [ $(diff my_out your_out | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		if [ $(< my_out wc -l) -eq $(< your_out wc -l) ]; then
			echo $BGREEN"OK!"$WHITE;
		else
			echo $BRED"KO!"$WHITE;
		fi
	fi
}

linux_cmd()
{
	echo $CYAN"-----> COMMANDS WITH ENV <-----"$WHITE;
	# cat Makefile
	bash -c "cat Makefile" > $DIR1/my_out1 2>&1
	echo "cat Makefile" | ./minishell > $DIR1/your_out1 2>&1
	sed '$ d' $DIR1/your_out1 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out1
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out1 $DIR1/your_out1 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat -e Makefile
	bash -c "cat -e Makefile" > $DIR1/my_out2 2>&1
	echo "cat -e Makefile" | ./minishell > $DIR1/your_out2 2>&1
	sed '$ d' $DIR1/your_out2 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out2
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out2 $DIR1/your_out2 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | grep -i make
	bash -c "cat Makefile | grep -i make" > $DIR1/my_out3 2>&1
	echo "cat Makefile | grep -i make" | ./minishell > $DIR1/your_out3 2>&1
	sed '$ d' $DIR1/your_out3 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out3
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out3 $DIR1/your_out3 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | grep -i make | wc
	bash -c "cat Makefile | grep -i make | wc" > $DIR1/my_out4 2>&1
	echo "cat Makefile | grep -i make | wc" | ./minishell > $DIR1/your_out4 2>&1
	sed '$ d' $DIR1/your_out4 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out4
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out4 $DIR1/your_out4 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#sort Makefile -r
	bash -c "sort Makefile -r" > $DIR1/my_out5 2>&1
	echo "sort Makefile -r" | ./minishell > $DIR1/your_out5 2>&1
	sed '$ d' $DIR1/your_out5 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out5
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out5 $DIR1/your_out5 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#sort Makefile -r | wc -l
	bash -c "sort Makefile -r | wc -l" > $DIR1/my_out6 2>&1
	echo "sort Makefile -r | wc -l" | ./minishell > $DIR1/your_out6 2>&1
	sed '$ d' $DIR1/your_out6 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out6
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out6 $DIR1/your_out6 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | sort | grep -i make | wc -w -l
	bash -c "cat Makefile | sort | grep -i make | wc -w -l" > $DIR1/my_out7 2>&1
	echo "cat Makefile | sort | grep -i make | wc -w -l" | ./minishell > $DIR1/your_out7 2>&1
	sed '$ d' $DIR1/your_out7 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out7
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out7 $DIR1/your_out7 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/bin/ls -l -a
	bash -c "/bin/ls -l -a" > $DIR1/my_out8 2>&1
	echo "/bin/ls -l -a" | ./minishell > $DIR1/your_out8 2>&1
	sed '$ d' $DIR1/your_out8 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out8
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out8 $DIR1/your_out8 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		if [ $(< $DIR1/my_out8 wc -l) -eq $(< $DIR1/your_out8 wc -l) ]; then
			echo $BGREEN"OK!"$WHITE;
		else
			echo $BRED"KO!"$WHITE;
		fi
	fi
	#/bin/ls -la | wc
	bash -c "/bin/ls -la | wc" > $DIR1/my_out9 2>&1
	echo "/bin/ls -la | wc" | ./minishell > $DIR1/your_out9 2>&1
	sed '$ d' $DIR1/your_out9 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out9
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out9 $DIR1/your_out9 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/bin/cat Makefile
	bash -c "/bin/cat Makefile" > $DIR1/my_out10 2>&1
	echo "/bin/cat Makefile" | ./minishell > $DIR1/your_out10 2>&1
	sed '$ d' $DIR1/your_out10 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out10
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out10 $DIR1/your_out10 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | noexiste | ls
	bash -c "cat Makefile | noexiste | ls" > $DIR1/my_tmp 2>&1
	tail -n +2 $DIR1/my_tmp > $DIR1/my_out11
	head -n 1 $DIR1/my_tmp > $DIR1/word
	awk '{$1 = ""; print > "test/cmd_env/word"}' $DIR1/word
	cat $DIR1/word | sed 's/^[[:space:]]*//' >> $DIR1/my_out11
	rm -rf $DIR1/my_tmp $DIR1/word
	echo "cat Makefile | noexiste | ls" | ./minishell > $DIR1/your_out11 2>&1
	sed '$ d' $DIR1/your_out11 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out11
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out11 $DIR1/your_out11 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#noexiste | ls
	bash -c "noexiste | ls" > $DIR1/my_tmp 2>&1
	tail -n +2 $DIR1/my_tmp > $DIR1/my_out12
	head -n 1 $DIR1/my_tmp > $DIR1/word
	awk '{$1 = ""; print > "test/cmd_env/word"}' $DIR1/word
	cat $DIR1/word | sed 's/^[[:space:]]*//' >> $DIR1/my_out12
	rm -rf $DIR1/my_tmp $DIR1/word
	echo "noexiste | ls" | ./minishell > $DIR1/your_out12 2>&1
	sed '$ d' $DIR1/your_out12 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out12
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out12 $DIR1/your_out12 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#noexiste
	bash -c "noexiste" > $DIR1/my_tmp 2>&1
	tail -n +2 $DIR1/my_tmp > $DIR1/my_out13
	head -n 1 $DIR1/my_tmp > $DIR1/word
	awk '{$1 = ""; print > "test/cmd_env/word"}' $DIR1/word
	cat $DIR1/word | sed 's/^[[:space:]]*//' >> $DIR1/my_out13
	rm -rf $DIR1/my_tmp $DIR1/word
	echo "noexiste" | ./minishell > $DIR1/your_out13 2>&1
	sed '$ d' $DIR1/your_out13 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out13
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out13 $DIR1/your_out13 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/binn/ls
	bash -c "/binn/ls" > $DIR1/my_tmp 2>&1
	tail -n +2 $DIR1/my_tmp > $DIR1/my_out13
	head -n 1 $DIR1/my_tmp > $DIR1/word
	awk '{$1 = ""; print > "test/cmd_env/word"}' $DIR1/word
	cat $DIR1/word | sed 's/^[[:space:]]*//' >> $DIR1/my_out13
	rm -rf $DIR1/my_tmp $DIR1/word
	echo "/binn/ls" | ./minishell > $DIR1/your_out13 2>&1
	sed '$ d' $DIR1/your_out13 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out13
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out13 $DIR1/your_out13 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls -l | noexiste
	bash -c "ls -l | noexiste" > $DIR1/my_tmp 2>&1
	tail -n +2 $DIR1/my_tmp > $DIR1/my_out14
	head -n 1 $DIR1/my_tmp > $DIR1/word
	awk '{$1 = ""; print > "test/cmd_env/word"}' $DIR1/word
	cat $DIR1/word | sed 's/^[[:space:]]*//' >> $DIR1/my_out14
	rm -rf $DIR1/my_tmp $DIR1/word
	echo "ls -l | noexiste" | ./minishell > $DIR1/your_out14 2>&1
	sed '$ d' $DIR1/your_out14 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out14
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out14 $DIR1/your_out14 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls archivonoexiste
	bash -c "ls archivonoexiste" > $DIR1/my_out15 2>&1
	echo "ls archivonoexiste" | ./minishell > $DIR1/your_out15 2>&1
	sed '$ d' $DIR1/your_out15 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out15
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out15 $DIR1/your_out15 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls archivonoexiste -la
	bash -c "ls archivonoexiste -la" > $DIR1/my_out16 2>&1
	echo "ls archivonoexiste -la" | ./minishell > $DIR1/your_out16 2>&1
	sed '$ d' $DIR1/your_out16 > tmp2
	tail -n +2 tmp2 > $DIR1/your_out16
	rm -rf  tmp2
	if [ $(diff $DIR1/my_out16 $DIR1/your_out16 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
}

linux_cmd_noenv()
{
	echo $CYAN"-----> COMMANDS WITHOUT ENV <-----"$WHITE;
	# cat Makefile
	env -i bash -c "cat Makefile" > $DIR2/my_out1 2>&1
	echo "cat Makefile" | env -i ./minishell > $DIR2/your_out1 2>&1
	sed '$ d' $DIR2/your_out1 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out1
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out1 $DIR2/your_out1 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat -e Makefile
	env -i bash -c "cat -e Makefile" > $DIR2/my_out2 2>&1
	echo "cat -e Makefile" | env -i ./minishell > $DIR2/your_out2 2>&1
	sed '$ d' $DIR2/your_out2 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out2
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out2 $DIR2/your_out2 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | grep -i make
	env -i bash -c "cat Makefile | grep -i make" > $DIR2/my_out3 2>&1
	echo "cat Makefile | grep -i make" | env -i ./minishell > $DIR2/your_out3 2>&1
	sed '$ d' $DIR2/your_out3 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out3
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out3 $DIR2/your_out3 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | grep -i make | wc
	env -i bash -c "cat Makefile | grep -i make | wc" > $DIR2/my_out4 2>&1
	echo "cat Makefile | grep -i make | wc" | env -i ./minishell > $DIR2/your_out4 2>&1
	sed '$ d' $DIR2/your_out4 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out4
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out4 $DIR2/your_out4 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#sort Makefile -r
	env -i bash -c "sort Makefile -r" > $DIR2/my_out5 2>&1
	echo "sort Makefile -r" | env -i ./minishell > $DIR2/your_out5 2>&1
	sed '$ d' $DIR2/your_out5 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out5
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out5 $DIR2/your_out5 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#sort Makefile -r | wc -l
	env -i bash -c "sort Makefile -r | wc -l" > $DIR2/my_out6 2>&1
	echo "sort Makefile -r | wc -l" | env -i ./minishell > $DIR2/your_out6 2>&1
	sed '$ d' $DIR2/your_out6 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out6
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out6 $DIR2/your_out6 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | sort | grep -i make | wc -w -l
	env -i bash -c "cat Makefile | sort | grep -i make | wc -w -l" > $DIR2/my_out7 2>&1
	echo "cat Makefile | sort | grep -i make | wc -w -l" | env -i ./minishell > $DIR2/your_out7 2>&1
	sed '$ d' $DIR2/your_out7 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out7
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out7 $DIR2/your_out7 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/bin/ls -l -a
	env -i bash -c "/bin/ls -l -a" > $DIR2/my_out8 2>&1
	echo "/bin/ls -l -a" | env -i ./minishell > $DIR2/your_out8 2>&1
	sed '$ d' $DIR2/your_out8 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out8
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out8 $DIR2/your_out8 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		if [ $(< $DIR2/my_out8 wc -l) -eq $(< $DIR2/your_out8 wc -l) ]; then
			echo $BGREEN"OK!"$WHITE;
		else
			echo $BRED"KO!"$WHITE;
		fi
	fi
	#/bin/ls -la | wc
	env -i bash -c "/bin/ls -la | wc" > $DIR2/my_out9 2>&1
	echo "/bin/ls -la | wc" | env -i ./minishell > $DIR2/your_out9 2>&1
	sed '$ d' $DIR2/your_out9 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out9
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out9 $DIR2/your_out9 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/bin/cat Makefile
	env -i bash -c "/bin/cat Makefile" > $DIR2/my_out10 2>&1
	echo "/bin/cat Makefile" | env -i ./minishell > $DIR2/your_out10 2>&1
	sed '$ d' $DIR2/your_out10 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out10
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out10 $DIR2/your_out10 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | noexiste | ls
	env -i bash -c "cat Makefile | noexiste | ls" > $DIR2/my_tmp 2>&1
	tail -n +2 $DIR2/my_tmp > $DIR2/my_out11
	head -n 1 $DIR2/my_tmp > $DIR2/word
	awk '{$1 = ""; print > "test/cmd_no_env/word"}' $DIR2/word
	cat $DIR2/word | sed 's/^[[:space:]]*//' >> $DIR2/my_out11
	rm -rf $DIR2/my_tmp $DIR2/word
	echo "cat Makefile | noexiste | ls" | env -i ./minishell > $DIR2/your_out11 2>&1
	sed '$ d' $DIR2/your_out11 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out11
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out11 $DIR2/your_out11 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#noexiste | ls
	env -i bash -c "noexiste | ls" > $DIR2/my_tmp 2>&1
	tail -n +2 $DIR2/my_tmp > $DIR2/my_out12
	head -n 1 $DIR2/my_tmp > $DIR2/word
	awk '{$1 = ""; print > "test/cmd_no_env/word"}' $DIR2/word
	cat $DIR2/word | sed 's/^[[:space:]]*//' >> $DIR2/my_out12
	rm -rf $DIR2/my_tmp $DIR2/word
	echo "noexiste | ls" | env -i ./minishell > $DIR2/your_out12 2>&1
	sed '$ d' $DIR2/your_out12 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out12
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out12 $DIR2/your_out12 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#noexiste
	env -i bash -c "noexiste" > $DIR2/my_tmp 2>&1
	tail -n +2 $DIR2/my_tmp > $DIR2/my_out13
	head -n 1 $DIR2/my_tmp > $DIR2/word
	awk '{$1 = ""; print > "test/cmd_no_env/word"}' $DIR2/word
	cat $DIR2/word | sed 's/^[[:space:]]*//' >> $DIR2/my_out13
	rm -rf $DIR2/my_tmp $DIR2/word
	echo "noexiste" | env -i ./minishell > $DIR2/your_out13 2>&1
	sed '$ d' $DIR2/your_out13 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out13
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out13 $DIR2/your_out13 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/binn/ls
	env -i bash -c "/binn/ls" > $DIR2/my_tmp 2>&1
	tail -n +2 $DIR2/my_tmp > $DIR2/my_out13
	head -n 1 $DIR2/my_tmp > $DIR2/word
	awk '{$1 = ""; print > "test/cmd_no_env/word"}' $DIR2/word
	cat $DIR2/word | sed 's/^[[:space:]]*//' >> $DIR2/my_out13
	rm -rf $DIR2/my_tmp $DIR2/word
	echo "/binn/ls" | env -i ./minishell > $DIR2/your_out13 2>&1
	sed '$ d' $DIR2/your_out13 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out13
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out13 $DIR2/your_out13 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls -l | noexiste
	env -i bash -c "ls -l | noexiste" > $DIR2/my_tmp 2>&1
	tail -n +2 $DIR2/my_tmp > $DIR2/my_out14
	head -n 1 $DIR2/my_tmp > $DIR2/word
	awk '{$1 = ""; print > "test/cmd_no_env/word"}' $DIR2/word
	cat $DIR2/word | sed 's/^[[:space:]]*//' >> $DIR2/my_out14
	rm -rf $DIR2/my_tmp $DIR2/word
	echo "ls -l | noexiste" | env -i ./minishell > $DIR2/your_out14 2>&1
	sed '$ d' $DIR2/your_out14 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out14
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out14 $DIR2/your_out14 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls archivonoexiste
	env -i bash -c "ls archivonoexiste" > $DIR2/my_out15 2>&1
	echo "ls archivonoexiste" | env -i ./minishell > $DIR2/your_out15 2>&1
	sed '$ d' $DIR2/your_out15 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out15
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out15 $DIR2/your_out15 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls archivonoexiste -la
	env -i bash -c "ls archivonoexiste -la" > $DIR2/my_out16 2>&1
	echo "ls archivonoexiste -la" | env -i ./minishell > $DIR2/your_out16 2>&1
	sed '$ d' $DIR2/your_out16 > tmp2
	tail -n +2 tmp2 > $DIR2/your_out16
	rm -rf  tmp2
	if [ $(diff $DIR2/my_out16 $DIR2/your_out16 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
}

redir_linux()
{
	#> salida0
	
}

tester_linux()
{
	linux_cmd
	linux_cmd_noenv
	redir_linux
}

if [ $(uname -s) = Linux ]; then
	echo "ES LINUX";
	if [ ! -d test ]; then
		mkdir -p $DIR $DIR1 $DIR2;
	fi
	if [ $# -eq 0 ];then
		tester_linux
		echo "RECOMENDACIONES: ";
		echo "cat | cat | cat | cat | cat | cat | cat | cat | cat | cat | ls -l -a"
		echo "cat | top | ls"
		echo "cat | /bin/cat | cat | cat | cat | /bin/cat | cat | cat | cat | /bin/cat | ls -l -a"
		echo "env -i ./minishell // env -i bash"
	elif [ $# -eq 1 ];then
		manual_linux
	else
		echo "Wrong arguments";
	fi
elif [ $(uname -s) = Darwin ]; then
	echo "ES MAC";
	if [ $# -eq 0 ];then
		echo "En construccion";
	elif [ $# -eq 1 ];then
		manual_mac
	else
		echo "Wrong arguments";
	fi
fi
