
Partial Class Solicitudes_confirmacion
    Inherits BasePage
#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    'Protected WithEvents btnConsultar As System.Web.UI.HtmlControls.HtmlInputButton
    'Protected WithEvents lblAdios As System.Web.UI.WebControls.Label
    'Protected WithEvents lblAgente As System.Web.UI.WebControls.Label
    'Protected WithEvents lblSolicitud As System.Web.UI.WebControls.Label

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Dim idSolicitud As String = Request.QueryString("ID")
        'Me.lblSolicitud.Text = idSolicitud

        Dim idTipoSolicitud As Integer = Session("IdTipoSolicitud")


        Select Case idTipoSolicitud
            Case 8
                Me.lblSolicitud.Text = "Su Solicitud ha sido procesada, usted recibir� su factura de seguridad social por e-mail despu�s del dia 15 de cada mes, su n�mero de orden es " & idSolicitud
            Case 4
                Me.lblSolicitud.Text = "Su solicitud ha sido procesada, usted recibir� su estado de cuentas por e-mail en los pr�ximos 30 minutos, su n�mero de orden es " & idSolicitud
            Case 3
                Me.lblSolicitud.Text = "Su solicitud ha sido procesada, un representante nuestro se comunicar� con usted a mas tarder el pr�ximo d�a laborable, su n�mero de orden es " & idSolicitud
            Case 2
                Me.lblSolicitud.Text = "Su solicitud ha sido procesada, un representante nuestro se comunicar� con usted a mas tardar el pr�ximo d�a laborable, su n�mero de orden es " & idSolicitud
            Case 9
                Me.lblSolicitud.Text = "Su solicitud ha sido procesada, un representante nuestro se comunicar� con usted a mas tarder el pr�ximo d�a laborable, su n�mero de orden es " & idSolicitud
            Case 7
                Me.lblSolicitud.Text = "Su solicitud ha sido procesada, una persona de nuestra Oficina de Acceso a la Informaci�n P�blica se comunicar� con usted a mas tardar dentro de los pr�ximos tres d�as laborables, su n�mero de orden es " & idSolicitud
            Case Else
                Me.lblSolicitud.Text = "Su solicitud ha sido procesada, una persona de nuestra Oficina de Acceso a la Informaci�n P�blica se comunicar� con usted a mas tardar dentro de los pr�ximos tres d�as laborables, su n�mero de orden es " & idSolicitud

        End Select

        Dim NomCd As String = SuirPlus.Utilitarios.TSS.getNombreCiudadano("C", Session("CedulaRepresentate"))

        Me.lblAdios.Text = "�Sr./Sra. " & NomCd & "  algo m�s en lo que le pueda ayudar?"
        Me.lblAgente.Text = MyBase.UsrNombreCompleto & " le asisti� tenga un feliz resto del d�a!"

    End Sub

    Private Sub btnConsultar_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnConsultar.ServerClick
        Response.Redirect("ConsultaSolicitud.aspx?IdSolicitud=" & Request.QueryString("ID"))
    End Sub
End Class

