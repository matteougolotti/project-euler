def reverse(n):
    s = str(n)
    return s[::-1]

def is_palindrome(n):
    s = str(n)
    rev = reverse(s)
    return rev == s

def has_six_digits(n):
    s = str(n)
    return len(s) == 6

def palindromes():
    result = set()
    for i in range(100, 1000):
        for j in range(i, 1000):
            p = i * j
            if is_palindrome(p) and has_six_digits(p):
                result.add(p)
    return result

def find(n, palindromes):
    result = 0
    for p in palindromes:
        if p < n:
            result = max(result, p)
    return result

if __name__ == "__main__":
    t = int(input())
    palindromes_set = palindromes()
    for i in range(t):
        n = int(input())
        r = find(n, palindromes_set)
        print(r)