Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports SuirPlus.Empresas
Imports SuirPlus


<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class INFOTEP
    Inherits System.Web.Services.WebService
    Public ReadOnly Property IP() As String
        Get
            Return HttpContext.Current.Request.ServerVariables("LOCAL_ADDR")
        End Get
    End Property

    Private myFact As Facturacion.LiquidacionInfotep

    <WebMethod(Description:="Metodo para autorizar una referencia de pago del INFOTEP. <br><br>" & _
    "Esta funci�n devuelve un String con el Numero de Autorizaci�n, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    "<br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "b) <b>13</b>|Esta Referencia no se encuentra en nuestras bases de datos <br>" & _
    "c) <b>14</b>|Esta Referencia ya fue autorizada o pagada <br>" & _
    "d) <b>33</b>|Estas liquidaciones no estan disponibles para pago <br>" & _
    "")> _
    Public Function AutorizarReferencia(ByVal UserName As String, ByVal Password As String, ByVal NroReferencia As String) As String

        If Seg.CheckUserPass(UserName, Password, IP) = False Then
            Return Err.UsuarioPass
        End If

        ' Verificar si existe la referencia
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.RNC.Length < 1 Then
                Return Err.RefNoValida
            End If

            Dim prueba As String = liqINF.Estatus()

            Dim algo As String = liqINF.TotalGeneralFormateadoC
        Catch ex As Exception
            Return Err.RefNoValida
        End Try

        ' Verificar si esta autorizada o pagada la factura
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.NroAutorizacion <> 0 Then
                Throw New Exception("Ya fue autorizada")
            End If

            If liqINF.Estatus.ToUpper = "PAGADA" Then
                Throw New Exception("Ya fue pagada")
            End If

            If liqINF.Estatus.ToUpper = "CANCELADA" Then
                Throw New Exception("Est� cancelada")
            End If

            If liqINF.Estatus.ToUpper = "INHABILITADO PARA PAGO" And liqINF.Tipo = "U" Then
                Throw New Exception("No disponible")
            End If


        Catch ex As Exception
            ''Throw ex
            If ex.Message = "No disponible" Then
                Return Err.NoDisponiblePago

            Else

                Return Err.RefYaPagada
            End If

        End Try


        Me.myFact = New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

        Dim resultado As String = Me.myFact.AutorizarFactura(UserName)

        If resultado = "0" Then
            Dim ref As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            Dim Devuelta As String
            Devuelta = ref.NroAutorizacion & "|" & Msg.FacturaAutorizada

            Try
                Bancos.TransaccionesIB.InsertarTransaccionIB(ref.NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Devuelta, "A")
            Catch ex12 As Exception
                SuirPlus.Exepciones.Log.LogToDB(ex12.ToString())
            End Try

            Return ref.NroAutorizacion & "|" & Msg.FacturaAutorizada
        Else
            Return resultado
        End If

    End Function

    <WebMethod(Description:="Metodo para autorizar una referencia de pago del INFOTEP. <br><br>" & _
    "Esta funci�n devuelve un String con el Numero de Autorizaci�n, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    "<br> Se utiliza el monto para validar el monto total de la factura. " & _
    "<br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "b) <b>13</b>|Esta Referencia no se encuentra en nuestras bases de datos <br>" & _
    "c) <b>14</b>|Esta Referencia ya fue autorizada o pagada <br>" & _
    "d) <b>22</b>|Monto de la referencia incorrecto <br>" & _
    "")> _
    Public Function AutorizarReferenciaMnt(ByVal UserName As String, ByVal Password As String, ByVal NroReferencia As String, ByVal Monto As String) As String
        If Seg.CheckUserPass(UserName, Password, IP) = False Then
            Return Err.UsuarioPass
        End If

        ' Verificar si existe la referencia
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.RNC.Length < 1 Then
                Return Err.RefNoValida
            End If

            Dim prueba As String = liqINF.Estatus()

            Dim algo As String = liqINF.TotalGeneralFormateadoC
        Catch ex As Exception
            Return Err.RefNoValida
        End Try

        ' Verificar si esta autorizada o pagada la factura
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.NroAutorizacion <> 0 Then
                Throw New Exception("Ya fue autorizada")
            End If

            If liqINF.Estatus.ToUpper = "PAGADA" Then
                Throw New Exception("Ya fue pagada")
            End If

            If liqINF.Estatus.ToUpper = "CANCELADA" Then
                Throw New Exception("Est� cancelada")
            End If

            If liqINF.Estatus.ToUpper = "INHABILITADO PARA PAGO" And liqINF.Tipo = "U" Then
                Throw New Exception("No disponible")
            End If

            Try
                If liqINF.TotalGeneral <> Convert.ToDecimal(Monto) Then
                    Throw New Exception("Monto Incorrecto")
                End If
            Catch ex As Exception
                Throw New Exception("Monto Incorrecto")
            End Try

        Catch ex As Exception

            If ex.Message = "Ya fue autorizada" Then
                Return Err.RefYaPagada
            ElseIf ex.Message = "Ya fue pagada" Then
                Return Err.RefYaPagada
            ElseIf ex.Message = "Monto Incorrecto" Then
                Return Err.MontoIncorrecto

            ElseIf ex.Message = "No disponible" Then
                Return Err.NoDisponiblePago

            Else
                Return Err.RefYaPagada
            End If

        End Try

        Me.myFact = New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

        Dim resultado As String = Me.myFact.AutorizarFactura(UserName)

        If resultado = "0" Then
            Dim ref As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            Dim Devuelta As String
            Devuelta = ref.NroAutorizacion & "|" & Msg.FacturaAutorizada

            Try
                Bancos.TransaccionesIB.InsertarTransaccionIB(ref.NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Devuelta, "A")
            Catch ex12 As Exception
                SuirPlus.Exepciones.Log.LogToDB(ex12.ToString())
            End Try

            Return Devuelta

        Else
            Return resultado
        End If

    End Function

    <WebMethod(Description:="Metodo para autorizar una referencia de pago del INFOTEP. <br><br>" & _
    "Esta funci�n devuelve un XML con el Numero de Autorizaci�n, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    "<br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "b) <b>13</b>|Esta Referencia no se encuentra en nuestras bases de datos <br>" & _
    "c) <b>14</b>|Esta Referencia ya fue autorizada o pagada <br>" & _
    "")> _
    Public Function AutorizarReferenciaExt(ByVal UserName As String, ByVal Password As String, ByVal NroReferencia As String) As System.Xml.XmlDocument

        Dim ds As New DataSet
        Dim doc As New System.Xml.XmlDocument
        Dim msgABC As String = ""

        If Seg.CheckUserPass(UserName, Password, msgABC, IP) = False Then
            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>10</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + Err.UsuarioPass.ToString() + " | " + Left(msgABC, 100) + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Retorno, "E")


            Return doc
            ''Return Err.UsuarioPass
        End If

        ' Verificar si existe la referencia
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.RNC.Length < 1 Then
                Dim Retorno As String = ""

                Retorno = Retorno + "<DetalleAutorizacion>"
                Retorno = Retorno + "<CodigoMensaje>13</CodigoMensaje>"
                Retorno = Retorno + "<DescripcionMensaje> " + Err.RefNoValida.ToString() + " </DescripcionMensaje>"
                Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
                Retorno = Retorno + "</DetalleAutorizacion>"

                doc.LoadXml(Retorno)

                Try
                    Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Retorno, "E")
                Catch ex As Exception

                End Try

                Return doc
            End If

            Dim prueba As String = liqINF.Estatus()

            Dim algo As String = liqINF.TotalGeneralFormateadoC
        Catch ex As Exception
            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>13</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + Err.RefNoValida.ToString() + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Try
                Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Retorno, "E")
            Catch ex3 As Exception

            End Try

            Return doc
        End Try

        ' Verificar si esta autorizada o pagada la factura
        Try
            Dim tssfac As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If tssfac.NroAutorizacion <> 0 Then
                Throw New Exception("Ya fue autorizada")
            End If

            If tssfac.Estatus.ToUpper = "PAGADA" Then
                Throw New Exception("Ya fue pagada")
            End If

            If tssfac.Estatus.ToUpper = "CANCELADA" Then
                Throw New Exception("Est� cancelada")
            End If

            If tssfac.Estatus.ToUpper = "INHABILITADO PARA PAGO" And tssfac.Tipo = "U" Then
                Throw New Exception("No disponible")
            End If

        Catch ex As Exception
            Dim Retorno As String = ""


            If ex.Message = "No disponible" Then
                Retorno = Retorno + "<DetalleAutorizacion>"
                Retorno = Retorno + "<CodigoMensaje>33</CodigoMensaje>"
                Retorno = Retorno + "<DescripcionMensaje> " + Err.NoDisponiblePago.ToString() + " </DescripcionMensaje>"
                Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
                Retorno = Retorno + "<ValorPagado>0</ValorPagado>"
                Retorno = Retorno + "</DetalleAutorizacion>"

            Else
                Retorno = Retorno + "<DetalleAutorizacion>"
                Retorno = Retorno + "<CodigoMensaje>14</CodigoMensaje>"
                Retorno = Retorno + "<DescripcionMensaje> " + Err.RefYaPagada.ToString() + " </DescripcionMensaje>"
                Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
                Retorno = Retorno + "<ValorPagado>0</ValorPagado>"
                Retorno = Retorno + "</DetalleAutorizacion>"


            End If



            doc.LoadXml(Retorno)

            Try
                Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Retorno, "E")
            Catch ex2 As Exception
            End Try

            Return doc
        End Try


        Me.myFact = New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

        Dim resultado As String = Me.myFact.AutorizarFactura(UserName)

        If resultado = "0" Then

            Dim ref As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)
            ''Return ref.NroAutorizacion & "|" & Msg.FacturaAutorizada

            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>0</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + Msg.FacturaAutorizada.ToString() + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion> " + ref.NroAutorizacion.ToString() + " </NumeroAutorizacion>"
            Retorno = Retorno + "<ValorPagado>" + ref.TotalGeneral.ToString() + "</ValorPagado>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Try
                Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Retorno, "A")
            Catch ex As Exception

            End Try

            Return doc
        Else

            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>1</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + resultado.ToString() + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
            Retorno = Retorno + "<ValorPagado>0</ValorPagado>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Try
                Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, Retorno, "E")
            Catch ex As Exception

            End Try

            Return doc
        End If

    End Function

    <WebMethod(Description:="Metodo para autorizar una referencia de pago del INFOTEP. <br><br>" & _
   "Esta funci�n devuelve un XML con el Numero de Autorizaci�n, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
   "<br><br> Los Errores que devuelve son: <br> " & _
   "a) <b>10</b>|Error en el Usuario o Password <br>" & _
   "b) <b>13</b>|Esta Referencia no se encuentra en nuestras bases de datos <br>" & _
   "c) <b>14</b>|Esta Referencia ya fue autorizada o pagada <br>" & _
   "d) <b>22</b>|Monto de la referencia incorrecto <br>" & _
   "")> _
    Public Function AutorizarReferenciaExtMnt(ByVal UserName As String, ByVal Password As String, ByVal NroReferencia As String, ByVal Monto As String) As System.Xml.XmlDocument

        Dim ds As New DataSet
        Dim doc As New System.Xml.XmlDocument

        If Seg.CheckUserPass(UserName, Password, IP) = False Then
            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>10</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + Err.UsuarioPass.ToString() + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Return doc
            ''Return Err.UsuarioPass
        End If

        ' Verificar si existe la referencia
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.RNC.Length < 1 Then
                Dim Retorno As String = ""

                Retorno = Retorno + "<DetalleAutorizacion>"
                Retorno = Retorno + "<CodigoMensaje>13</CodigoMensaje>"
                Retorno = Retorno + "<DescripcionMensaje> " + Err.RefNoValida.ToString() + " </DescripcionMensaje>"
                Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
                Retorno = Retorno + "</DetalleAutorizacion>"

                doc.LoadXml(Retorno)

                Return doc
            End If

            Dim prueba As String = liqINF.Estatus()

            Dim algo As String = liqINF.TotalGeneralFormateadoC
        Catch ex As Exception
            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>13</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + Err.RefNoValida.ToString() + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Return doc
        End Try

        ' Verificar si esta autorizada o pagada la factura
        Try
            Dim tssfac As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If tssfac.NroAutorizacion <> 0 Then
                Throw New Exception("Ya fue autorizada")
            End If

            If tssfac.Estatus.ToUpper = "PAGADA" Then
                Throw New Exception("Ya fue pagada")
            End If

            If tssfac.Estatus.ToUpper = "CANCELADA" Then
                Throw New Exception("Est� cancelada")
            End If

            If tssfac.Estatus.ToUpper = "INHABILITADO PARA PAGO" And tssfac.Tipo = "U" Then
                Throw New Exception("No disponible")
            End If


            Try
                If tssfac.TotalGeneral <> Convert.ToDecimal(Monto) Then
                    Throw New Exception("Monto Incorrecto")
                End If
            Catch ex As Exception
                Throw New Exception("Monto Incorrecto")
            End Try

        Catch ex As Exception
            Dim Retorno As String = ""

            If ex.Message = "Monto Incorrecto" Then
                Retorno = Retorno + "<DetalleAutorizacion>"
                Retorno = Retorno + "<CodigoMensaje>22</CodigoMensaje>"
                Retorno = Retorno + "<DescripcionMensaje> " + Err.MontoIncorrecto + " </DescripcionMensaje>"
                Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
                Retorno = Retorno + "<ValorPagado>0</ValorPagado>"
                Retorno = Retorno + "</DetalleAutorizacion>"

            ElseIf ex.Message = "No disponible" Then
                Retorno = Retorno + "<DetalleAutorizacion>"
                Retorno = Retorno + "<CodigoMensaje>33</CodigoMensaje>"
                Retorno = Retorno + "<DescripcionMensaje> " + Err.NoDisponiblePago.ToString() + " </DescripcionMensaje>"
                Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
                Retorno = Retorno + "<ValorPagado>0</ValorPagado>"
                Retorno = Retorno + "</DetalleAutorizacion>"

            Else


                Retorno = Retorno + "<DetalleAutorizacion>"
                Retorno = Retorno + "<CodigoMensaje>14</CodigoMensaje>"
                Retorno = Retorno + "<DescripcionMensaje> " + Err.RefYaPagada.ToString() + " </DescripcionMensaje>"
                Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
                Retorno = Retorno + "<ValorPagado>0</ValorPagado>"
                Retorno = Retorno + "</DetalleAutorizacion>"
            End If
            doc.LoadXml(Retorno)

            Return doc
        End Try


        Me.myFact = New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

        Dim resultado As String = Me.myFact.AutorizarFactura(UserName)

        If resultado = "0" Then

            Dim ref As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)
            ''Return ref.NroAutorizacion & "|" & Msg.FacturaAutorizada

            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>0</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + Msg.FacturaAutorizada.ToString() + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion> " + ref.NroAutorizacion.ToString() + " </NumeroAutorizacion>"
            Retorno = Retorno + "<ValorPagado>" + ref.TotalGeneral.ToString() + "</ValorPagado>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Return doc
        Else

            Dim Retorno As String = ""

            Retorno = Retorno + "<DetalleAutorizacion>"
            Retorno = Retorno + "<CodigoMensaje>1</CodigoMensaje>"
            Retorno = Retorno + "<DescripcionMensaje> " + resultado.ToString() + " </DescripcionMensaje>"
            Retorno = Retorno + "<NumeroAutorizacion></NumeroAutorizacion>"
            Retorno = Retorno + "<ValorPagado>0</ValorPagado>"
            Retorno = Retorno + "</DetalleAutorizacion>"

            doc.LoadXml(Retorno)

            Return doc
        End If

    End Function

    <WebMethod(Description:="Metodo para cancelar la autorizaci�n de una referencia de pago del INFOTEP. <br><br>" & _
    "Esta funci�n devuelve un 0 en caso de que la referencia haya sido cancelada satisfactoriamente, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    "<br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "b) <b>13</b>|Esta Referencia no se encuentra en nuestras bases de datos <br>" & _
    "c) <b>15</b>|Esta Referencia ya fue reportada como pagada <br>" & _
    "d) <b>16</b>|Debe cancelarla el usuario que la autoriz� <br>" & _
    "")> _
    Public Function CancelarAutorizacion(ByVal UserName As String, ByVal Password As String, ByVal NroReferencia As String) As String

        If Seg.CheckUserPass(UserName, Password, IP) = False Then
            Return Err.UsuarioPass
        End If

        ' Verificar si existe la referencia
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)
            Dim algo As String = liqINF.TotalGeneralFormateadoC
        Catch ex As Exception
            Return Err.RefNoValida
        End Try

        ' Verificar si esta pagada la factura
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.Estatus.ToUpper = "PAGADA" Then
                Throw New Exception("Ya fue pagada")
            End If

        Catch ex As Exception
            Return Err.RefYaRepPagada
        End Try
        ' Verifica si es el mismo usuario

        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)
            If Not SuirPlus.Seguridad.Autorizacion.isInRol(UserName, "58") Then
                If (CStr(UserName.ToString.ToUpper()) <> CStr(liqINF.UsuarioAutorizo.ToString.ToUpper())) Then
                    Throw New Exception("Usuario Diferente")
                End If
            End If

        Catch ex As Exception
            Return Err.UsuarioDiferente
        End Try

        Me.myFact = New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

        Dim resultado As String = Me.myFact.DesAutorizarFactura(UserName, Now())

        If resultado = "0" Then
            Return resultado
        Else
            Return resultado
        End If

    End Function

    <WebMethod(Description:="Consulta de liquidaciones pendiente de pago por numero de referencia.<br><br>" & _
    "Esta funci�n devuelve un dataset con el numero de referencia consultado, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    "<br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "b) <b>13</b>|Esta Referencia no se encuentra en nuestras bases de datos <br>" & _
    "c) <b>14</b>|Esta Referencia ya fue autorizada o pagada <br>" & _
    "d) <b>24</b>|Esta factura esta cancelada <br>" & _
    "")> _
    Public Function ConsultaPorReferencia(ByVal UserName As String, ByVal Password As String, ByVal NroReferencia As String) As DataSet
        Dim ds As New DataSet("ConsultaPorReferencia")
        Dim msgABC As String = ""

        'Verificar Usuario & Password
        If Seg.CheckUserPass(UserName, Password, msgABC, IP) = False Then
            Seg.AgregarMensajeDeError(ds, Err.UsuarioPass + " | " + msgABC)

            Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, "ConsultaPorReferencia: " + Err.UsuarioPass + msgABC, "E")

            Return ds
        End If

        ' Verificar si existe la referencia
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)
            Dim algo As String = liqINF.TotalGeneralFormateadoC
        Catch ex As Exception
            Seg.AgregarMensajeDeError(ds, Err.RefNoValida)
            Seg.AgregarErrorTecnico(ds, ex.ToString())
            Return ds
        End Try

        ' Verificar si esta autorizada o pagada la factura
        Try
            Dim liqINF As New Empresas.Facturacion.LiquidacionInfotep(NroReferencia)

            If liqINF.NroAutorizacion <> 0 Then
                Throw New Exception("Ya fue autorizada")
            End If

            If liqINF.Estatus.ToUpper = "PAGADA" Then
                Throw New Exception("Ya fue pagada")
            End If

            If liqINF.Estatus.ToUpper = "IN" And liqINF.Tipo = "U" Then
                Throw New Exception("No disponible")
            End If

            If liqINF.Estatus.ToUpper = "CANCELADA" Then
                Seg.AgregarMensajeDeError(ds, Err.FacturaCancelada)
                Return ds
            End If

        Catch ex As Exception

            If ex.Message = "No disponible" Then
                Seg.AgregarMensajeDeError(ds, Err.NoDisponiblePago)
            Else
                Seg.AgregarMensajeDeError(ds, Err.RefYaPagada)
            End If

            Return ds
        End Try

        '        Return ds

        ds.Tables.Add(SuirPlus.Empresas.Facturacion.Factura.getNotificacionesPendientePago(Empresas.Facturacion.Factura.eConcepto.INF, "", NroReferencia, "").Copy())

        Try
            Bancos.TransaccionesIB.InsertarTransaccionIB(NroReferencia, Empresas.Facturacion.Factura.eConcepto.INF, UserName, Password, ds.GetXml, "A")
        Catch ex As Exception

        End Try

        Return ds

    End Function

    <WebMethod(Description:="Consulta de las liquidaciones pendiente de pagos por RNC. <br>" & _
    "Esta funci�n devuelve un dataset con los numero de referencia que tiene pendiente este RNC, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    " <br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "b) <b>11</b>|Este RNC no se encuentra en nuestras bases de datos <br>" & _
    "c) En caso de que no tenga referencias pendiente de pago el datatable estara vacio. <br>" & _
    "")> _
    Public Function ConsultaPorRNC(ByVal UserName As String, ByVal Password As String, ByVal RNC As String) As DataSet

        Dim ds As New DataSet("ConsultasPorRNC")

        'Verificar Usuario & Password
        If Seg.CheckUserPass(UserName, Password, IP) = False Then
            Seg.AgregarMensajeDeError(ds, Err.UsuarioPass)
            Return ds
        End If

        ' Verificar si el RNC existe
        Try
            Dim emp As New Empresas.Empleador(RNC)
            Dim rz As String = emp.RazonSocial()
        Catch ex As Exception
            Seg.AgregarMensajeDeError(ds, Err.RNCNoValido)
            Return ds
        End Try

        Try
            ds.Tables.Add(SuirPlus.Empresas.Facturacion.Factura.getNotificacionesPendientePago(Empresas.Facturacion.Factura.eConcepto.INF, RNC).Copy())
        Catch ex As Exception
            Seg.AgregarMensajeDeError(ds, ex.ToString())
        End Try

        Return ds

    End Function


    <WebMethod(Description:="Consulta de todas las autorizaciones de pago no canceladas por el n�mero de referencia. <br><br>" & _
    "Esta funci�n devuelve un dataset con los numero de referencia que estan autorizados y no han sido reportados como pagados, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    "<br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "En caso de que no hayan referencias pendientes autorizadas y no reportadas como pagadas, el datatable estara vacio. " & _
    "", MessageName:="ConsultaAutorizadoNoPagadoRef")> _
    Public Function ConsultaAutorizadoNoPagadoRef(ByVal UserName As String, ByVal Referencia As String, ByVal Password As String) As DataSet
        Dim ds As New DataSet

        If Seg.CheckUserPass(UserName, Password, IP) = False Then
            Seg.AgregarMensajeDeError(ds, Err.UsuarioPass)
            Return ds
        End If


        ds.Tables.Add(Empresas.Facturacion.Factura.getAutorizaciones(UserName, Referencia, Empresas.Facturacion.Factura.eConcepto.INF).Copy)

        Return ds


    End Function


    <WebMethod(Description:="Consulta de todas las autorizaciones de pago no canceladas. <br><br>" & _
    "Esta funci�n devuelve un dataset con los numero de referencia que estan autorizados y no han sido reportados como pagados, en caso de que haya un error se devuelve el codigo mas la descripci�n." & _
    "<br><br> Los Errores que devuelve son: <br> " & _
    "a) <b>10</b>|Error en el Usuario o Password <br>" & _
    "En caso de que no hayan referencias pendientes autorizadas y no reportadas como pagadas, el datatable estara vacio. " & _
    "")> _
    Public Function ConsultaAutorizadoNoPagado(ByVal UserName As String, ByVal Password As String) As DataSet
        Dim ds As New DataSet

        If Seg.CheckUserPass(UserName, Password, IP) = False Then
            Seg.AgregarMensajeDeError(ds, Err.UsuarioPass)
        End If

        ds.Tables.Add(Empresas.Facturacion.Factura.getAutorizaciones(UserName, "", Empresas.Facturacion.Factura.eConcepto.INF).Copy)

        Return ds


    End Function


End Class
