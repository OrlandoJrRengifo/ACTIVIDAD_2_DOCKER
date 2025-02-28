Module NumerosPerfectos
    Function EsNumeroPerfecto(n As Integer) As Boolean
        Dim suma As Integer = 0
        For i As Integer = 1 To n - 1
            If n Mod i = 0 Then
                suma += i
            End If
        Next
        Return suma = n
    End Function

    Sub EncontrarNumerosPerfectos(limite As Integer)
        For num As Integer = 2 To limite - 1
            If EsNumeroPerfecto(num) Then
                Console.WriteLine(num)
            End If
        Next
    End Sub

    Sub Main()
        EncontrarNumerosPerfectos(10000)
    End Sub
End Module
