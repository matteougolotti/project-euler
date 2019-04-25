echo "[C++]"
g++ -std=c++14 P0004.cpp -O3 -o main
time echo 2$'\n'101110$'\n'800000 | ./main > /dev/null
rm -f ./main

echo ""
echo "[Python]"
time echo 2$'\n'101110$'\n'800000 | python P0004.py > /dev/null

echo ""
echo "[Haskell]"
cp P0004.hs Main.hs
ghc -O3 Main.hs > /dev/null
time echo 2$'\n'101110$'\n'800000 | ./Main > /dev/null
rm -f ./Main ./Main.hi ./Main.o ./Main.hs