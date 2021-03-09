#!/bin/bash
function consent {
#пока значение i=0, цикл продолжает выполняться
i=0
    #цикл создан для проверки корректности ввода с клавиатуры
while [ $i -eq 0 ]
do
    read keyb
        #проверка правильности введения с клавиатуры стиля и цвета
	case $keyb in
		02|03|06  )  echo "Введите корректное значение:";;
		$style    ) answer1=$keyb; i=1;;
		*         )  echo "Введите корректное значение:";;
	esac
done
i=0
while [ $i -eq 0 ]
do
    read keyb
	case $keyb in
		$color    ) answer2=$keyb; i=1;;
		*         )  echo "Введите корректное значение:";;
	esac
done
}
style='[0][0-7]'
color='[3][0-7]'
echo $style
consent
echo $answer1
echo $answer2
