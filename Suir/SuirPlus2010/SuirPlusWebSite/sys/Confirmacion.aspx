<%@ Page Language="VB" MasterPageFile="~/SuirPlain.master" AutoEventWireup="false" CodeFile="Confirmacion.aspx.vb" Inherits="sys_Confirmacion" title="Confirmaci�n" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
			<span class="header">Confirmaci�n</span><br/><br/>
			<table class="td-content" id="table1" cellspacing="0" cellpadding="0" width="420" border="0">
				<tr>
					<td style="width: 418px"><asp:panel id="pnlEstadoCuentaFax" Visible="False" Runat="server">
							<table cellspacing="2" cellpadding="1" width="550">
								<tr>
									<td align="center" colspan="2">
										<span><b>Datos de la Empresa</b></span><br/>
									</td>
								</tr>
								<tr>
									<td style="WIDTH: 18%" align="right">Rnc/C�dula:</td>
									<td>&nbsp;
										<asp:label cssclass="labelData" id="lblRnc" runat="server"></asp:label></td>
								</tr>
								<tr>
									<td align="right">Raz�n Social:</td>
									<td>&nbsp;
										<asp:label cssclass="labelData" id="lblRazonSocial" runat="server"></asp:label></td>
								</tr>
								<tr>
									<td align="right">Nombre Comercial:</td>
									<td>&nbsp;
										<asp:label cssclass="labelData" id="lblNombreComercial" runat="server"></asp:label></td>
								</tr>
								<tr>
									<td align="right">Representante:</td>
									<td>&nbsp;
										<asp:label cssclass="labelData" id="lblRepresentante" runat="server"></asp:label></td>
								</tr>
								<tr>
									<td align="right">N�mero de Fax:</td>
									<td>&nbsp;
										<asp:label cssclass="labelData" id="lblFax" runat="server"></asp:label></td>
								</tr>
								<tr align="center">
									<td align="center" colspan="2"></td>
								</tr>
								<tr align="center">
									<td align="center" colspan="2">
										<asp:button id="btnAceptar" runat="server" Text="Aceptar"></asp:button><input id="btnCancelar" onclick="javascript:history.back();" type="button" value="Cancelar"></td>
								</tr>
							</table>
						</asp:panel></td>
				</tr>
			</table>
			<asp:label id="lblMensaje" runat="server" CssClass="error"></asp:label>
</asp:Content>

