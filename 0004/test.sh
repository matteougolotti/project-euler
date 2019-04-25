echo "[C++]"
g++ -std=c++14 P0004.cpp -O3 -o main
OUTPUT="$(echo 2$'\n'101110$'\n'800000 | ./main)"
EXPECTED=101101$'\n'793397
rm -f ./main
if [ "$OUTPUT" = "$EXPECTED" ]; then
  echo " - [OK]"
else
  echo " - [KO]"
fi

echo ""
echo "[Python]"
OUTPUT="$(echo 2$'\n'101110$'\n'800000 | python P0004.py)"
EXPECTED=101101$'\n'793397
if [ "$OUTPUT" = "$EXPECTED" ]; then
  echo " - [OK]"
else
  echo " - [KO]"
fi

echo ""
echo "[Haskell]"
cp P0004.hs Main.hs
ghc -O3 Main.hs > /dev/null
OUTPUT="$(echo 2$'\n'101110$'\n'800000 | ./Main)"
EXPECTED=101101$'\n'793397
rm -f ./Main ./Main.hi ./Main.o ./Main.hs
if [ "$OUTPUT" = "$EXPECTED" ]; then
  echo " - [OK]"
else
  echo " - [KO]"
fi