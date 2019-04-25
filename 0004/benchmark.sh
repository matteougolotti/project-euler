echo "[C++]"
g++ -std=c++14 P0004.cpp -O3 -o main
time echo 2$'\n'101110$'\n'800000 | ./main > /dev/null
rm -f ./main

echo "[Python]"
time echo 2$'\n'101110$'\n'800000 | python P0004.py > /dev/null