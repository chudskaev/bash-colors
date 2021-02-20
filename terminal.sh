#!/bin/bash
function consent {
#пока значение i=0, цикл продолжает выполняться
i=0    
    #цикл создан для проверки корректности ввода с клавиатуры
while [ $i -eq 0 ]
do
    read keyb
        #проверка правильности введения с клавиатуры стиля
        if [ $keyb = 00 ] || [ $keyb = 01 ] || [ $keyb = 04 ] || [ $keyb = 05 ] || [ $keyb = 07 ]
        then
            answer=$keyb
            i=1
        #проверка правильности введения с клавиатуры цвета
        else 
            if [ $keyb = "30" ] || [ $keyb = "31" ] || [ $keyb = "32" ] || [ $keyb = "33" ] || [ $keyb = "34" ] || [ $keyb = "35" ] || [ $keyb = "36" ] || [ $keyb = "37" ] || [ $keyb = "39" ]
            then 
                answer=$keyb
                i=1
            else
                echo "Введите корректное значение:"
            fi
        fi
done
}

#Сохранение старого файла
#cp ~/.bashrc ~/.bashrc_old 
#Ищем номер строки с параметром force_color_prompt=yes
str_numb_prompt=`cat ~/.bashrc | grep -n force_color_prompt=yes | cut -c '1-2'`
#Готовим переменную для работы команды sed
k=$str_numb_prompt"s/^#//"
#Убираем шарп перед строкой с номером str_numb_prompt
sudo sed -i $k ~/.bashrc
#Ищем номер строки с параметрами chroot и 033 (отвечают за цвета)
str_numb_colors=`cat ~/.bashrc | grep -n chroot | grep 033 | cut -c '1-2'`
#Готовим переменную для работы команды sed
l=$str_numb_colors"s/^/#/"
#Ставим шарп перед строкой с номером str_numb_prompt
sudo sed -i $l ~/.bashrc
echo "Выбор формата отображения выводимой строки:
Стиль шрифта:
00 — простой текст      04 — подчеркнутый текст     07 — инверсия, фон цвета текста
01 — жирный текст       05 — мигающий текст
Цвета шрифта:
30 — черный             33 — ёлтый/оранжевый        36 — цвета морской волны
31 — красный            34 — голубой                37 — светло-серый
32 — зеленый            35 — фиолетовый             39 — по умолчанию"
echo -n "Выберите стиль шрифта для пользователя: "
consent
userstyle=$answer
echo -n "Выберите цвет шрифта для пользователя: "
consent
temp=$answer
usercolor=$temp"m"
echo -n "Выберите стиль шрифта для @: "
consent
dogstyle=$answer
echo -n "Выберите цвет шрифта для @: "
consent
temp=$answer
dogcolor=$temp"m"
echo -n "Выберите стиль шрифта для хоста: "
consent
hoststyle=$answer
echo -n "Выберите цвет шрифта для хоста: "
consent
temp=$answer
hostcolor=$temp"m"
echo -n "Выберите стиль шрифта для двоеточия: "
consent
pointsstyle=$answer
echo -n "Выберите цвет шрифта для двоеточия: "
consent
temp=$answer
pointscolor=$temp"m"
echo -n "Выберите стиль шрифта для директорий: "
consent
dirstyle=$answer
echo -n "Выберите цвет шрифта для директорий: "
consent
temp=$answer
dircolor=$temp"m"
echo -n "Выберите стиль шрифта для текста: "
consent
textstyle=$answer
echo -n "Выберите цвет шрифта для текста: "
consent
temp=$answer
textcolor=$temp"m"
text="PS1=\x27\x24{debian_chroot:+(\x24debian_chroot)}\x5C[\x5C033["$userstyle";"$usercolor"\x5C]\x5Cu\x5C[\x5C033["$dogstyle";"$dogcolor"\x5C]@\x5C[\x5C033["$hoststyle";"$hostcolor"\x5C]\x5Ch\x5C[\x5C033["$pointsstyle";"$pointscolor"\x5C]:\x5C[\x5C033["$dirstyle";"$dircolor"\x5C]\x5Cw\x5C[\x5C033["$textstyle";"$textcolor"\x5C]\x5C\x24\x27"
m=$str_numb_colors"s/.*/"$text"/"
sed -i $m ~/.bashrc
#sed -i $text ~/.bashrc
echo "Для вступления изменений в силу перезапустите терминал"
#PS1='${debian_chroot:+($debian_chroot)}[    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '33[01;31m][    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '33[01;31m]@[    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '33[01;31m]h[    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '33[01;31m]:[    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '33[01;31m]w[    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '33[01;31m]$'
