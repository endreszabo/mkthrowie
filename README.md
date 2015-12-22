# mkthrowie

## Introduction

mkthrowie.sh is simple bash script that lets you 'drag-n-drop' files simply copypasting between terminals.

It creates a gzipped and base64 encoded tar file to the stdout that you can copy to other hosts bash prompt to deploy the files given as arguments. I call this encoded tar as 'throwie'. mkthrowie makes a throwie of itself if no arguments are given.

## Usage

```
$ ./mkthrowie.sh  
mkthrowie.sh version 0.01
-------------------------
              vvvvvv--- copy throwie below ---vvvvvv
stty -echo;base64 -d<<_EOF|tar xzv;stty echo
H4sIAC9beVYCA+3STU/CQBAG4F7dXzFCQ9RkoXy0RoHExKAhUTASPUjQtHWVRuiStoB8/Xe3pRiMejHxQPI+l9nOTnc7k+YLw7eoH8ipJ/JhX/sXhnJsmipaRsUqb8VE0SiWtGLJKlsl06yYlqYyZtnQSNslaTO
fcUdk9wuO5xccO+wzdt+47TTbrbqRN4qMhSIiLsmXY18tGTtvX3Xq+kEYRTMKvbk4TDMLFe6uW51Tniw72ewRrVaMCbcvKbP9e9FEBKEnfdLTmzJpEf/NpoC+mCTUNrlyNKP0AnLEQE5Jpdf7m3eTD+bxuqraFF
aF+HOt9tRoXywjO6D3+aSalMQVGdbtkp4l/hqRQb0e5XK0YHuXD82bOj+huJ5zfzwUgedyOfVF/DySQWQ73sCL73HnL8RVkvQzWtLmwinp8WjYipbLPx9o/HRg2mTczs/Dekx8G5btyImIh7XezzANAAAAAAAAA
AAAAAAAAAAAAAB2zAfNJn0cACgAAA==
_EOF
              ^^^^^^--- copy throwie above ---^^^^^^
```
