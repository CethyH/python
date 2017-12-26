
Partial Class sys_SolicitudCreada
    Inherits BasePage

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Me.lblMensaje.Text = Request("msg")

        Dim id As String = Request("id")
        Dim tipo As String = Request("tipo")

        Try
            If Not (id = String.Empty) Then

                Me.lblMensaje.Text = "Gracias por su solicitud, un representante nuestro se comunicar� con usted. Su n�mero de solicitud es " & id

            ElseIf Not (tipo = String.Empty) Then
                Select Case tipo
                    Case "F"
                        Me.lblMensaje.Text = "Usted recibir� su estado de cuentas via fax en los pr�ximos 15 minutos al n�mero: " & Request("fax")

                    Case "Em"
                        Me.lblMensaje.Text = "Usted recibir� su estado de cuentas via email en los pr�ximos 15 minutos."

                    Case "E"
                        Me.lblMensaje.Text = "A partir del pr�ximo corte usted recibir� sus facturas al correo electr�nico " & Request("Email") & ", gracias por utilizar este servicio."
                End Select

            End If

        Catch ex As Exception
            Me.lblMensaje.Text = ex.Message

        End Try

    End Sub

End Class
