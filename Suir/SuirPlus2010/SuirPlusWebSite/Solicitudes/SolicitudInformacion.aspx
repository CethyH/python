<%@ Page Language="VB" MasterPageFile="~/SuirPlus.master" AutoEventWireup="false" CodeFile="SolicitudInformacion.aspx.vb" Inherits="Solicitudes_SolicitudInformacion" Title="Solicitud de informaci�n" %>

<%@ Register TagPrefix="uc1" TagName="UCTelefono" Src="../Controles/UCTelefono.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <table align="center" class="td-content" id="table1" width="600px" cellspacing="2" cellpadding="1" border="0">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="lblMensaje" runat="server" CssClass="error" Visible="False" style="font-size: xx-small"></asp:Label>
                <asp:ValidationSummary ID="errorSumary" runat="server" CssClass="error" style="font-size: xx-small"></asp:ValidationSummary>
            </td>
        </tr>
         
        <tr>
            <td align="right" width="30%">
                <asp:Label ID="lblNroFormulario" runat="server" Font-Bold="True" Text="OAI-FO-001"></asp:Label>
                <br /><asp:Label ID="lblVersion" runat="server" Font-Bold="True" Text="Versi�n 2.0"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
         
        <tr>
            <td align="right" class="labelData" width="30%">Solicitud:</td>
            <td>
                <asp:Label CssClass="labelData" ID="lblSolicitud" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td align="right" class="labelData">Nombre Completo:
            </td>
            <td>
                <asp:TextBox ID="txtNombreCompleto" runat="server" Width="300px"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ControlToValidate="txtNombreCompleto" Display="Dynamic" ErrorMessage="El nombre del solicitante es requerido.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">C�dula o Pasaporte:</td>
            <td>
                <asp:TextBox ID="txtNroDocumento" runat="server" MaxLength="25" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Direcci�n:
            </td>
            <td>
                <asp:TextBox ID="txtDireccion" runat="server" BorderStyle="Groove" Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Tel�fono:
            </td>
            <td>
                <uc1:UCTelefono ID="ctrlTelefono" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Celular:
            </td>
            <td>
                <uc1:UCTelefono ID="ctrlCelular" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Fax:
            </td>
            <td>
                <uc1:UCTelefono ID="ctrlFax" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Correo Electr�nico:
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                    Display="Dynamic" ErrorMessage="Correo Electr�nico Inv�lido" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator><br />
            </td>
        </tr>

        <tr>
            <td align="right" class="labelData">Nombre de la Persona F�sica o Jur�dica:</td>
            <td>
                <asp:TextBox ID="txtInstitucion" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Cargo:
            </td>
            <td>
                <asp:TextBox ID="txtCargo" runat="server" Width="300px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Informaci�n Solicitada:
            </td>
            <td>
                <asp:TextBox ID="txtinfosolicitada" runat="server" BorderStyle="Groove" Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ControlToValidate="txtInfoSolicitada" Display="Dynamic" ErrorMessage="La informaci�n solicitada es requerida.">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Motivo Solicitud:
            </td>
            <td>
                <asp:TextBox ID="txtMotivo" runat="server" BorderStyle="Groove" Height="70px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Requiredfieldvalidator6" runat="server" ControlToValidate="txtMotivo" Display="Dynamic" ErrorMessage="El motivo de la solicitud es requerido.">*</asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td align="right" class="labelData">Autoridad p�blica que posee la informaci�n:
            </td>
            <td>
                <asp:TextBox ID="txtAutoridad" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Medio para recibir la informaci�n:
            </td>
            <td>
                <asp:CheckBoxList ID="cblMedio" runat="server" RepeatColumns="3">
                    <asp:ListItem Text="Personal" Value="Personal"></asp:ListItem>
                    <asp:ListItem Text="Tel�fono" Value="Tel�fono"></asp:ListItem>
                    <asp:ListItem Text="Fascimil" Value="Fascimil"></asp:ListItem>
                    <asp:ListItem Text="Correo Certificado" Value="Correo Certificado"></asp:ListItem>
                    <asp:ListItem Text="Correo Electr�nico" Value="Correo Electr�nico"></asp:ListItem>
                    <asp:ListItem Text="Correo Ordinario" Value="Correo Ordinario"></asp:ListItem>
                    <asp:ListItem Text="P�ginas de Internet" Value="P�ginas de Internet"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Lugar para recibir la informaci�n:
            </td>
            <td>
                <asp:TextBox ID="txtLugar" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="labelData">Comentario:</td>
            <td>
                <asp:TextBox ID="txtComentario" runat="server" Width="300px" TextMode="MultiLine" Height="50px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr align="center">
            <td align="center" colspan="2">
                <asp:Button ID="btnEnviar" runat="server" Text="Aceptar"></asp:Button>
                <input id="btnCancelar" onclick="javascript: location.href = 'Solicitudes.aspx'" type="button"
                    value="Cancelar" name="btnCancelar" class="Button">
            </td>
        </tr>
    </table>

</asp:Content>

