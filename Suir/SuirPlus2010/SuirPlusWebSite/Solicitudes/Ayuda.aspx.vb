
Partial Class Solicitudes_Ayuda
    Inherits BasePage


    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Select Case Request("H")

            Case "1"
                Me.lblInfo.Text = "El n�mero de RNC es el n�mero �nico que identifica una empresa o negocio y es otorgado por la Direcci�n General de Impuestos Internos, en el caso de los negocios de �nico due�o, el n�mero que identifica el negocio es el n�mero de c�dula del due�o."
            Case "2"
                Me.lblInfo.Text = "El representante es la persona que representa la empresa o negocio ante la TSS, es la persona encagada de reportar mensualmente los cambios en la n�mina (entradas, salidas o cambios de salario)."

        End Select
    End Sub
End Class
