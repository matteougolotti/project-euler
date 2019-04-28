#!/bin/bash

build_cpp() {
  g++ -std=c++14 "$PROBLEM_NAME".cpp -O3 -o main
}

clean_cpp() {
  rm -f ./main
}

test_cpp() {
  echo ""
  echo "[C++]"
  echo ""
  build_cpp
  OUTPUT=$(echo "${INPUT}" | ./main)
  if [ "$OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo " - Test OK"
    time echo "$INPUT" | ./main > /dev/null
  else
    echo " - Test KO"
  fi
  clean_cpp
}

build_haskell() {
  cp "$PROBLEM_NAME".hs Main.hs
  ghc -O3 Main.hs > /dev/null
}

clean_haskell() {
  rm -f ./Main ./Main.hi ./Main.o ./Main.hs
}

test_haskell() {
  echo ""
  echo "[Haskell]"
  echo ""
  build_haskell
  OUTPUT=$(echo "${INPUT}" | ./Main)
  if [ "$OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo " - Test OK"
    time echo "$INPUT" | ./Main > /dev/null
  else
    echo " - Test KO"
  fi
  clean_haskell
}

test_python() {
  echo ""
  echo "[Python]"
  echo ""
  OUTPUT=$(echo "${INPUT}" | python "$PROBLEM_NAME".py)
  if [ "$OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo " - Test OK"
    time echo "$INPUT" | python "$PROBLEM_NAME".py > /dev/null
  else
    echo " - Test KO"
  fi
}
