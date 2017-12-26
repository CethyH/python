﻿
Partial Class Oficina_Virtual_ConfirmacionUsuarioOFC
    Inherits RegistroEmpresaSeguridad

    Dim usuario As String = String.Empty
    Dim email As String = String.Empty
    Dim params_link As String = String.Empty
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Request.QueryString("params") <> String.Empty Then
                params_link = Request.QueryString("params")
                usuario = Request.QueryString("NroDocumento")
            Else
                lblMsgErr.Visible = True
                lblMsgErr.Text = "Los datos suministrados son incorrectos, favor iniciar el proceso de creación de usuario nuevamente."
                Exit Sub
            End If

            ' actualizar columna "actulizarEmail" en usuarios = "N" donde la accion es "C"
            'confirmamos la actualizacion del email del usuario.
            Try
                Dim resultado As String
                Dim valor As String
                resultado = SuirPlus.OficinaVirtual.OficinaVirtual.ConfirmarEmailOFC(usuario, email, params_link, "C")
                valor = Split(resultado, "|")(0)
                If valor = "0" Then
                    lblMsgOk.Visible = True
                    lblMsgOk.Text = "Su cuenta de usuario ha sido registrada satisfactoriamente, ya puede acceder a la oficina virtual de la Tesorería de la Seguridad Social (TSS)"
                    lbContinuar.Visible = True

                Else
                    lblMsgErr.Visible = True
                    lblMsgErr.Text = Split(resultado, "|")(1)
                End If

            Catch ex As Exception
                lblMsgErr.Visible = True
                lblMsgErr.Text = "Ha ocurrido un error activando su cuenta: " & ex.Message
            End Try
        End If
    End Sub

    Protected Sub lbContinuar_Click(sender As Object, e As System.EventArgs) Handles lbContinuar.Click
        System.Web.Security.FormsAuthentication.SignOut()
        Session.Abandon()
        Response.Redirect("LoginOficinaVirtual.aspx")
    
    End Sub
End Class
