
def multiply_matrices(n):
    A = [[1] * n for _ in range(n)]
    B = [[1] * n for _ in range(n)]
    C = [[0] * n for _ in range(n)]

    for i in range(n):
        for j in range(n):
            for k in range(n):
                C[i][j] += A[i][k] * B[k][j]
    return C

n = 100
R = multiply_matrices(n)
print(R)
