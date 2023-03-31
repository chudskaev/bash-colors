#!/bin/bash
function concent {
#пока значение i=0, цикл продолжает выполняться
i=0
    #цикл создан для проверки корректности ввода с клавиатуры
while [ $i -eq 0 ]
do
    read keyb
        #проверка правильности введения с клавиатуры стиля и цвета
	case $keyb in
		$style    ) answer1=$keyb,' Молодец!!!'; i=1;;
		$color    ) answer2='| Пидора ответ!!! |'; i=1;;
		*         )  echo "Введите корректное значение (Да/Нет):";;
	esac
done
#i=0
#while [ $i -eq 0 ]
#do
#    read keyb
#	case $keyb in
#		$color    ) answer2=$keyb; i=1;;
#		*         )  echo "Введите корректное значение:";;
#	esac
#done
}
#style='[0][0-7]'
#color='[3][0-7]'
style='Да'
color='Нет' 
echo 'Скажи Да!'
concent
printf "\033[1;37;42m$answer1\033[0m\n"
printf "\033[1;97m\033[5;41m$answer2\033[0m\n\a" 
