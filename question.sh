#!/bin/bash
function concent {
#пока значение i=0, цикл продолжает выполняться
k=0
    #цикл создан для проверки корректности ввода с клавиатуры
while [ $k -eq 0 ]
	do
		i=0
		echo 'Скажи Да! Не говори Нет!'
		while [ $i -eq 0 ]
			do
				echo
				read keyb
				sleep 1
        #проверка правильности введения с клавиатуры стиля и цвета
				case $keyb in
				$style    ) answer1=$keyb,' Молодец!!!'; printf "\033[1;37;42m$answer1\033[0m\n"; i=1;;
				$color    ) answer2=$keyb,'? Пидора ответ!!!'; printf "\033[1;97m\033[5;41m$answer2\033[0m\n\a"; i=1;;
				*         )  echo "Введите корректное значение (Да/Нет):";;
				esac
				echo
				sleep 1
			done
		j=0
		echo 'Продлжим общение? (Да/Нет)'
		while [ $j -eq 0 ]
			do
				echo
				read keyb
				sleep 1
				case $keyb in
				$style    ) answer1=$keyb,' Отлично!!!'; printf "\033[1;37;42m$answer1\033[0m\n"; j=1;;
				$color    ) answer2=$keyb'? Пидора ответ!!!'; printf "\033[1;97m\033[5;41m$answer2\033[0m\n\a"; j=1; k=1;;
				*         )  echo "Введите корректное значение (Да/Нет):";;
				esac
				echo
				sleep 1
			done
	done
}
export APP_PID=$a
style='Да'
color='Нет' 
echo 'Добро пожаловать в ChatGPT!!!'
echo '_____________________________'
echo
concent
sleep 3
a=`pidof /usr/bin/fly-term`
kill $a
