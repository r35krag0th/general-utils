#!/bin/bash

SampleOutput() {
    echo -e "\033[0;${1}m[normal] \033[1;${1}m[bold]\033[0m";
}

SampleBackground() {
    Foreground=$1
    Background=$2

    echo -ne "\033[0;${Foreground};${Background}m [${Foreground}/${Background}] \033[0m";
}

SampleOuputWithBackground() {
    SampleBackground $1 40
    SampleBackground $1 41
    SampleBackground $1 42
    SampleBackground $1 43
    SampleBackground $1 44
    SampleBackground $1 45
    SampleBackground $1 46
    SampleBackground $1 47
    echo ""
}

Columns=$(tput cols)
Lines=$(tput lines)

if [ $Columns -lt 130 ]; then
    echo -e "\033[1;31mError: \033[0;37mPlease make your terminal 130+ cols wide.\033[0m"
    exit 1;
fi

if [ $Lines -lt 24 ]; then
    echo -e "\033[1;31mError: \033[0;37mPlease make your terminal 24+ lines tall.\033[0m"
    exit 2;
fi

echo -e "\033[0;37m------ \033[1;37mForeground Only \033[0;37m------\033[0m"
echo -n "(30) Black   --> "
SampleOutput 30

echo -n "(31) Red     --> "
SampleOutput 31

echo -n "(32) Green   --> "
SampleOutput 32

echo -n "(33) Yellow  --> "
SampleOutput 33

echo -n "(34) Blue    --> "
SampleOutput 34

echo -n "(35) Magenta --> "
SampleOutput 35

echo -n "(36) Cyan    --> "
SampleOutput 36

echo -n "(37) White   --> "
SampleOutput 37

echo ""
echo -e "\033[0;37m------ \033[1;37mWith Backgrounds \033[0;37m------\033[0m"
echo -n "(30) Black   --> "
SampleOuputWithBackground 30
echo -n "(31) Red     --> "
SampleOuputWithBackground 31
echo -n "(32) Green   --> "
SampleOuputWithBackground 32
echo -n "(33) Yellow  --> "
SampleOuputWithBackground 33
echo -n "(34) Blue    --> "
SampleOuputWithBackground 34
echo -n "(35) Magenta --> "
SampleOuputWithBackground 35
echo -n "(36) Cyan    --> "
SampleOuputWithBackground 36
echo -n "(37) White   --> "
SampleOuputWithBackground 37
