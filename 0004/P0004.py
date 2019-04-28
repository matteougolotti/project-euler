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

def count(n):
    result = 0
    for i in range(100, 1000):
        for j in range(i, 1000):
            p = i * j
            if p >= n:
                break
            elif is_palindrome(p) and has_six_digits(p):
                result = max(result, p)
    return result

if __name__ == "__main__":
    t = int(input())
    for i in range(t):
        n = int(input())
        r = count(n)
        print(r)