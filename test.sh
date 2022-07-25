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

tester_linux()
{
	echo $CYAN"-----> COMMANDS <-----"$WHITE;
	# cat Makefile
	bash -c "cat Makefile" > $DIR/my_out1 2>&1
	echo "cat Makefile" | ./minishell > $DIR/your_out1 2>&1
	sed '$ d' $DIR/your_out1 > tmp2
	tail -n +2 tmp2 > $DIR/your_out1
	rm -rf  tmp2
	if [ $(diff $DIR/my_out1 $DIR/your_out1 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat -e Makefile
	bash -c "cat -e Makefile" > $DIR/my_out2 2>&1
	echo "cat -e Makefile" | ./minishell > $DIR/your_out2 2>&1
	sed '$ d' $DIR/your_out2 > tmp2
	tail -n +2 tmp2 > $DIR/your_out2
	rm -rf  tmp2
	if [ $(diff $DIR/my_out2 $DIR/your_out2 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | grep -i make
	bash -c "cat Makefile | grep -i make" > $DIR/my_out3 2>&1
	echo "cat Makefile | grep -i make" | ./minishell > $DIR/your_out3 2>&1
	sed '$ d' $DIR/your_out3 > tmp2
	tail -n +2 tmp2 > $DIR/your_out3
	rm -rf  tmp2
	if [ $(diff $DIR/my_out3 $DIR/your_out3 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | grep -i make | wc
	bash -c "cat Makefile | grep -i make | wc" > $DIR/my_out4 2>&1
	echo "cat Makefile | grep -i make | wc" | ./minishell > $DIR/your_out4 2>&1
	sed '$ d' $DIR/your_out4 > tmp2
	tail -n +2 tmp2 > $DIR/your_out4
	rm -rf  tmp2
	if [ $(diff $DIR/my_out4 $DIR/your_out4 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#sort Makefile -r
	bash -c "sort Makefile -r" > $DIR/my_out5 2>&1
	echo "sort Makefile -r" | ./minishell > $DIR/your_out5 2>&1
	sed '$ d' $DIR/your_out5 > tmp2
	tail -n +2 tmp2 > $DIR/your_out5
	rm -rf  tmp2
	if [ $(diff $DIR/my_out5 $DIR/your_out5 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#sort Makefile -r | wc -l
	bash -c "sort Makefile -r | wc -l" > $DIR/my_out6 2>&1
	echo "sort Makefile -r | wc -l" | ./minishell > $DIR/your_out6 2>&1
	sed '$ d' $DIR/your_out6 > tmp2
	tail -n +2 tmp2 > $DIR/your_out6
	rm -rf  tmp2
	if [ $(diff $DIR/my_out6 $DIR/your_out6 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | sort | grep -i make | wc -w -l
	bash -c "cat Makefile | sort | grep -i make | wc -w -l" > $DIR/my_out7 2>&1
	echo "cat Makefile | sort | grep -i make | wc -w -l" | ./minishell > $DIR/your_out7 2>&1
	sed '$ d' $DIR/your_out7 > tmp2
	tail -n +2 tmp2 > $DIR/your_out7
	rm -rf  tmp2
	if [ $(diff $DIR/my_out7 $DIR/your_out7 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/bin/ls -l -a
	bash -c "/bin/ls -l -a" > $DIR/my_out8 2>&1
	echo "/bin/ls -l -a" | ./minishell > $DIR/your_out8 2>&1
	sed '$ d' $DIR/your_out8 > tmp2
	tail -n +2 tmp2 > $DIR/your_out8
	rm -rf  tmp2
	if [ $(diff $DIR/my_out8 $DIR/your_out8 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		if [ $(< $DIR/my_out8 wc -l) -eq $(< $DIR/your_out8 wc -l) ]; then
			echo $BGREEN"OK!"$WHITE;
		else
			echo $BRED"KO!"$WHITE;
		fi
	fi
	#/bin/ls -la | wc
	bash -c "/bin/ls -la | wc" > $DIR/my_out9 2>&1
	echo "/bin/ls -la | wc" | ./minishell > $DIR/your_out9 2>&1
	sed '$ d' $DIR/your_out9 > tmp2
	tail -n +2 tmp2 > $DIR/your_out9
	rm -rf  tmp2
	if [ $(diff $DIR/my_out9 $DIR/your_out9 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/bin/cat Makefile
	bash -c "/bin/cat Makefile" > $DIR/my_out10 2>&1
	echo "/bin/cat Makefile" | ./minishell > $DIR/your_out10 2>&1
	sed '$ d' $DIR/your_out10 > tmp2
	tail -n +2 tmp2 > $DIR/your_out10
	rm -rf  tmp2
	if [ $(diff $DIR/my_out10 $DIR/your_out10 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#cat Makefile | noexiste | ls
	bash -c "cat Makefile | noexiste | ls" > $DIR/my_tmp 2>&1
	tail -n +2 $DIR/my_tmp > $DIR/my_out11
	head -n 1 $DIR/my_tmp > $DIR/word
	awk '{$1 = ""; print > "test/word"}' $DIR/word
	cat $DIR/word | sed 's/^[[:space:]]*//' >> $DIR/my_out11
	rm -rf $DIR/my_tmp $DIR/word
	echo "cat Makefile | noexiste | ls" | ./minishell > $DIR/your_out11 2>&1
	sed '$ d' $DIR/your_out11 > tmp2
	tail -n +2 tmp2 > $DIR/your_out11
	rm -rf  tmp2
	if [ $(diff $DIR/my_out11 $DIR/your_out11 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#noexiste | ls
	bash -c "noexiste | ls" > $DIR/my_tmp 2>&1
	tail -n +2 $DIR/my_tmp > $DIR/my_out12
	head -n 1 $DIR/my_tmp > $DIR/word
	awk '{$1 = ""; print > "test/word"}' $DIR/word
	cat $DIR/word | sed 's/^[[:space:]]*//' >> $DIR/my_out12
	rm -rf $DIR/my_tmp $DIR/word
	echo "noexiste | ls" | ./minishell > $DIR/your_out12 2>&1
	sed '$ d' $DIR/your_out12 > tmp2
	tail -n +2 tmp2 > $DIR/your_out12
	rm -rf  tmp2
	if [ $(diff $DIR/my_out12 $DIR/your_out12 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#noexiste
	bash -c "noexiste" > $DIR/my_tmp 2>&1
	tail -n +2 $DIR/my_tmp > $DIR/my_out13
	head -n 1 $DIR/my_tmp > $DIR/word
	awk '{$1 = ""; print > "test/word"}' $DIR/word
	cat $DIR/word | sed 's/^[[:space:]]*//' >> $DIR/my_out13
	rm -rf $DIR/my_tmp $DIR/word
	echo "noexiste" | ./minishell > $DIR/your_out13 2>&1
	sed '$ d' $DIR/your_out13 > tmp2
	tail -n +2 tmp2 > $DIR/your_out13
	rm -rf  tmp2
	if [ $(diff $DIR/my_out13 $DIR/your_out13 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#/binn/ls
	bash -c "/binn/ls" > $DIR/my_tmp 2>&1
	tail -n +2 $DIR/my_tmp > $DIR/my_out13
	head -n 1 $DIR/my_tmp > $DIR/word
	awk '{$1 = ""; print > "test/word"}' $DIR/word
	cat $DIR/word | sed 's/^[[:space:]]*//' >> $DIR/my_out13
	rm -rf $DIR/my_tmp $DIR/word
	echo "/binn/ls" | ./minishell > $DIR/your_out13 2>&1
	sed '$ d' $DIR/your_out13 > tmp2
	tail -n +2 tmp2 > $DIR/your_out13
	rm -rf  tmp2
	if [ $(diff $DIR/my_out13 $DIR/your_out13 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls -l | noexiste
	bash -c "ls -l | noexiste" > $DIR/my_tmp 2>&1
	tail -n +2 $DIR/my_tmp > $DIR/my_out14
	head -n 1 $DIR/my_tmp > $DIR/word
	awk '{$1 = ""; print > "test/word"}' $DIR/word
	cat $DIR/word | sed 's/^[[:space:]]*//' >> $DIR/my_out14
	rm -rf $DIR/my_tmp $DIR/word
	echo "ls -l | noexiste" | ./minishell > $DIR/your_out14 2>&1
	sed '$ d' $DIR/your_out14 > tmp2
	tail -n +2 tmp2 > $DIR/your_out14
	rm -rf  tmp2
	if [ $(diff $DIR/my_out14 $DIR/your_out14 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls archivonoexiste
	bash -c "ls archivonoexiste" > $DIR/my_out15 2>&1
	echo "ls archivonoexiste" | ./minishell > $DIR/your_out15 2>&1
	sed '$ d' $DIR/your_out15 > tmp2
	tail -n +2 tmp2 > $DIR/your_out15
	rm -rf  tmp2
	if [ $(diff $DIR/my_out15 $DIR/your_out15 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#ls archivonoexiste -la
	bash -c "ls archivonoexiste -la" > $DIR/my_out16 2>&1
	echo "ls archivonoexiste -la" | ./minishell > $DIR/your_out16 2>&1
	sed '$ d' $DIR/your_out16 > tmp2
	tail -n +2 tmp2 > $DIR/your_out16
	rm -rf  tmp2
	if [ $(diff $DIR/my_out16 $DIR/your_out16 | wc -l) -eq 0 ]; then
		echo $BGREEN"OK!"$WHITE;
	else
		echo $BRED"KO!"$WHITE;
	fi
	#echo "$ARGV" | ./minishell > your_out
}

if [ $(uname -s) = Linux ]; then
	echo "ES LINUX";
	if [ ! -d test ]; then
		mkdir $DIR;
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
