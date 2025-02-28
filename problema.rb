# Números perfectos
def es_numero_perfecto(n)
    (1...n).select { |i| n % i == 0 }.sum == n
  end
  
  def encontrar_numeros_perfectos(limite)
    (2...limite).each do |num|
      puts num if es_numero_perfecto(num)
    end
  end
  
  if __FILE__ == $0
    encontrar_numeros_perfectos(10_000)
  end
  