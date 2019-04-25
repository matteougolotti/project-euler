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

echo "[Python]"
OUTPUT="$(echo 2$'\n'101110$'\n'800000 | python P0004.py)"
EXPECTED=101101$'\n'793397
if [ "$OUTPUT" = "$EXPECTED" ]; then
  echo " - [OK]"
else
  echo " - [KO]"
fi