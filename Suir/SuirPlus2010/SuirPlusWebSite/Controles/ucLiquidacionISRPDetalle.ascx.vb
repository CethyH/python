Imports System.Data

Partial Class Controles_ucLiquidacionISRPDetalle
    Inherits BaseCtrlFacturaDetalle
    Protected Liquidacion As SuirPlus.Empresas.Facturacion.LiquidacionISRPRE

#Region "Miembros y Propiedades"

    Public Property pageNum() As Integer
        Get
            If (String.IsNullOrEmpty(Me.lblPageNum.Text)) Then
                Return 1
            End If
            Return Convert.ToInt32(Me.lblPageNum.Text)
        End Get
        Set(ByVal value As Integer)
            Me.lblPageNum.Text = value
        End Set
    End Property

    Public Property PageSize() As Int16
        Get
            If String.IsNullOrEmpty(Me.lblPageSize.Text) Then
                Return BasePage.PageSize
            End If
            Return Int16.Parse(Me.lblPageSize.Text)
        End Get
        Set(ByVal value As Int16)
            Me.lblPageSize.Text = value
        End Set
    End Property

#End Region

    Public Overrides Sub DataBind()
        bindGrid()
    End Sub

    Protected Sub bindGrid()

        Dim dtDetalle As DataTable = Nothing


        Try
            dtDetalle = SuirPlus.Empresas.Facturacion.LiquidacionISRPRE.CargarDetalle(Me.RNC, Me.Periodo, Me.Tipo, Me.pageNum, Me.PageSize)
            If dtDetalle.Rows.Count > 0 Then
                Me.lblTotalRegistros.Text = dtDetalle.Rows(0)("RECORDCOUNT")
                Me.gvDetalle.DataSource = dtDetalle
                Me.gvDetalle.DataBind()
            End If

            If Not Page.IsPostBack Then
                fillLabels()
            End If

        Catch ex As Exception
            Me.lblMensaje.Text = ex.ToString
            'Response.Write(ex.ToString)
        End Try

        dtDetalle = Nothing
        setNavigation()

    End Sub

    Private Sub setNavigation()

        Dim totalRecords As Integer = 0

        If IsNumeric(Me.lblTotalRegistros.Text) Then
            totalRecords = CInt(Me.lblTotalRegistros.Text)
        End If

        Dim totalPages As Double = Math.Ceiling(Convert.ToDouble(totalRecords) / PageSize)

        If totalRecords = 1 Or totalPages = 0 Then
            totalPages = 1
        End If

        If PageSize > totalRecords Then
            PageSize = Int16.Parse(totalPages)
        End If

        Me.lblCurrentPage.Text = pageNum
        Me.lblTotalPages.Text = totalPages

        If pageNum = 1 Then
            Me.btnLnkFirstPage.Enabled = False
            Me.btnLnkPreviousPage.Enabled = False
        Else
            Me.btnLnkFirstPage.Enabled = True
            Me.btnLnkPreviousPage.Enabled = True
        End If

        If pageNum = totalPages Then
            Me.btnLnkNextPage.Enabled = False
            Me.btnLnkLastPage.Enabled = False
        Else
            Me.btnLnkNextPage.Enabled = True
            Me.btnLnkLastPage.Enabled = True
        End If

    End Sub

    Protected Sub NavigationLink_Click(ByVal s As Object, ByVal e As CommandEventArgs)
        Select Case e.CommandName
            Case "First"
                pageNum = 1
            Case "Last"
                pageNum = Convert.ToInt32(lblTotalPages.Text)
            Case "Next"
                pageNum = Convert.ToInt32(lblCurrentPage.Text) + 1
            Case "Prev"
                pageNum = Convert.ToInt32(lblCurrentPage.Text) - 1
        End Select

        bindGrid()

    End Sub

    Protected Function formateaNSS(ByVal NSS As Integer) As String

        Return SuirPlus.Utilitarios.Utils.FormatearNSS(NSS.ToString)

    End Function

    Protected Function formateaDocumento(ByVal documento As String) As String

        'Si el documento que se envia no tiene 11 digitos asumimos que es un pasaporte.
        If documento.Length <> 11 Then
            Return documento
        End If

        Return SuirPlus.Utilitarios.Utils.FormatearCedula(documento)

    End Function

    Protected Sub gvDetalle_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDetalle.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then
            e.Row.Cells(0).Text = Me.formateaDocumento(e.Row.Cells(0).Text)
            ''e.Row.Cells(1).Text = Me.formateaNSS(e.Row.Cells(1).Text)
        End If

    End Sub

    Protected Sub fillLabels()

        Me.lblPeriodo.Text = Me.Periodo

        ''If Notificacion.TipoFactura = "U" Then
        ''Me.gvDetalle.Columns(3).Visible = True
        ''End If

    End Sub

    Protected Sub ucExpExcel_ExportaExcel(ByVal sender As Object, ByVal e As System.EventArgs) Handles ucExpExcel.ExportaExcel

        Me.ucExpExcel.FileName = Me.NroReferencia & ".xls"
        Me.ucExpExcel.DataSource = SuirPlus.Empresas.Facturacion.LiquidacionISRPRE.CargarDetalle(Me.RNC, Me.Periodo, Me.Tipo, 1, 999999)

    End Sub
End Class
