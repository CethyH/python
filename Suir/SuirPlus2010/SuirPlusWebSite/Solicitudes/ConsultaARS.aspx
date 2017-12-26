<%@ Page Language="VB" MasterPageFile="~/SuirPlain.master" AutoEventWireup="false" CodeFile="~/Solicitudes/ConsultaARS.aspx.vb" Inherits="Solicitudes_ConsultaARS" Title="Consulta de ARS" %>

<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">

        if (top != self) top.location.replace(location.href);

    </script>
    <script language="javascript" type="text/javascript">
        function checkNum() {
            var carCode = event.keyCode;
            if ((carCode < 48) || (carCode > 57)) {
                event.cancelBubble = true
                event.returnValue = false;
            }
        }

    </script>
    <img alt="Tesoreria de la Seguridad Social"
        src="../images/logoTSShorizontal.gif" />
    <div class="header">Consulta de Afiliaci�n al Seguro Familiar de Salud</div>
    <br />
    <table border="0" cellpadding="1" cellspacing="1" class="consultaTabla" style="font-size: 13pt; color: #006699; font-family: Verdana"
        width="370">
        <tr>
            <td>
                <table id="Table1" cellpadding="0" cellspacing="0" class="td-content">
                    <tr>
                        <td style="width: 455px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top" style="text-align: center; width: 455px;">No de C�dula:
                            (sin guiones)</td>
                    </tr>
                    <tr>
                        <td style="height: 12px; text-align: center; width: 455px;" valign="top">
                            <asp:TextBox onKeyPress="checkNum()" ID="txtnodocumento" runat="server" MaxLength="11"></asp:TextBox><asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnodocumento"
                                Display="Dynamic" ErrorMessage="Debe ser num�rico el valor" ValidationExpression="\d*"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 18px;" align="center">
                            <recaptcha:RecaptchaControl
                                ID="recaptcha"
                                runat="server"
                                PublicKey="6Ld-od0SAAAAAL-7eV_JbD8brOewzWcL0AMig-ar"
                                PrivateKey="6Ld-od0SAAAAAPmNITxMyGFHybQxFmewdLICP0lF"
                                AllowMultipleInstances="True"
                                Theme="white" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 455px">
                            <asp:Button ID="btBuscarRef" runat="server" Enabled="True" EnableViewState="False"
                                Text="Buscar" />
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" /></td>
                    </tr>
                    <tr>
                        <td style="width: 455px"></td>
                    </tr>
                </table>
                <asp:Label ID="lblError" runat="server" CssClass="error" Font-Size="8pt" Visible="False"></asp:Label></td>
        </tr>
    </table>

    <br />
    <asp:Panel ID="pnlInfo" runat="server" Visible="False" Width="543px">
        <table border="0" cellpadding="0" cellspacing="0" id="TABLE2" runat="server" visible="true" width="370">
            <tr>
                <td colspan="2" id="TD1" runat="server">
                    <asp:Label ID="Label8" runat="server" Text="Datos de la Persona" CssClass="subHeader" Font-Size="Small"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 106px">
                    <asp:Label ID="Label5" runat="server" Text="Nombre:" Font-Size="Small"></asp:Label></td>
                <td style="width: 416px">
                    <asp:Label ID="lblNombre" runat="server" Font-Bold="True" Font-Size="Small" CssClass="subHeader"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 106px">
                    <asp:Label ID="Label6" runat="server" Text="ARS:" Font-Size="Small"></asp:Label></td>
                <td style="width: 416px">
                    <asp:Label ID="lblARS" runat="server" Font-Bold="True" Font-Size="Small" CssClass="subHeader"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 106px; height: 16px">
                    <asp:Label ID="Label7" runat="server" Text="Status:" Font-Size="Small"></asp:Label></td>
                <td style="width: 416px; height: 16px;">
                    <asp:Label ID="lblStatus" runat="server" Font-Bold="True" Font-Size="Small" CssClass="subHeader"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 106px; height: 16px">
                    <asp:Label ID="Label2" runat="server" Font-Size="Small" Text="Tipo Afiliaci�n:"></asp:Label></td>
                <td style="width: 416px; height: 16px">
                    <asp:Label ID="lblTipoAfiliacion" runat="server" Font-Bold="True" Font-Size="Small" CssClass="subHeader"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 106px; height: 16px">
                    <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Fecha Afiliaci�n:" Width="94px"></asp:Label></td>
                <td style="width: 416px; height: 16px">
                    <asp:Label ID="lblFechaAfiliacion" runat="server" Font-Bold="True" Font-Size="Small" CssClass="subHeader"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="pnlNucleo" runat="server" Visible="False" Width="543px">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" EnableViewState="False" Height="20px" Width="256px" CssClass="subHeader">Composici�n del N�cleo Familiar</asp:Label><br />
        <asp:GridView ID="gvNucleoFamiliar" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="NOMBRES" HeaderText="Nombres">
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="TIPO" HeaderText="Tipo">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PARENTESCO" HeaderText="Parentesco"></asp:BoundField>
                <asp:BoundField DataField="ESTATUS" HeaderText="Estatus" />
                <asp:BoundField DataField="Tipo_Documento" HeaderText="Tipo Documento">
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="No. Documento">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# formateaCedula(ValidarNull(eval("no_documento"))) %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NSS">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# formateaNSS(ValidarNull(eval("id_nss"))) %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <br />
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 578px">
                <span style="font-size: 9pt"><span style="color: #006699"><strong>Notas:
        <br />
                    <br />
                </strong>
                    1 � Si usted aparece afiliado en una ARS distinta a la de su elecci�n, entonces deber�
        contactar a la DIDA al tel�fono 809-472-1900 opci�n 6.
        <br />
                    <br />
                    2 � Si usted no aparece afiliado o aparece con afiliaci�n en estatus PENDIENTE <strong>
                        <span style="text-decoration: underline">y es un trabajador(a) asalariado(a)</span></strong>,
        se debe a que su empleador <span style="text-decoration: underline"><strong>NO le ha registrado
        </strong></span>en la Tesorer�a de la Seguridad Social, en este caso deber�
        contactar a la DIDA para informar sobre su situaci�n.<br />
                    <br />
                    3 � Si su n�cleo familiar est� incompleto, debe contactar directamente
        a su ARS para informarle de la situaci�n de sus dependientes que no aparecen registrados.
                        <br />
                </span>
                </span>
            </td>
        </tr>
    </table>
    <br />

    <br />

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

