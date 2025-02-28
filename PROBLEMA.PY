def es_numero_perfecto(n):
    return sum(i for i in range(1, n) if n % i == 0) == n

def encontrar_numeros_perfectos(limite):
    for num in range(2, limite):
        if es_numero_perfecto(num):
            print(num)

if __name__ == "__main__":
    encontrar_numeros_perfectos(10000)
