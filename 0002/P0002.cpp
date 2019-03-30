#include <vector>
#include <iostream>

std::vector<uint64_t> fibs(uint64_t n) {
    std::vector<uint64_t> result{0, 1};
    uint64_t a = 0;
    uint64_t b = 1;
    
    while (a + b <= n) {
        uint64_t c = a + b;
        result.push_back(c);
        a = b;
        b = c;
    }

    return result;
}

uint64_t sumOfEvenFibonacci(uint64_t n) {
    uint64_t result = 0;

    for (const uint64_t i : fibs(n)) {
        if (i % 2 == 0) {
            result += i;
        }
    }

    return result;
}

int main() {
    int t = 0;
    std::cin >> t;

    for (int i = 0; i < t; ++i) {
        uint64_t n = 0;
        std::cin >> n;

        uint64_t result = sumOfEvenFibonacci(n);
        
        std::cout << result << std::endl;
    } 
    return 0;
}
