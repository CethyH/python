<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ucNotificacionTSSDetalleAuditoria.ascx.vb" Inherits="Controles_ucNotificacionTSSDetalleAuditoria" %>
<%@ Register Src="ucExportarExcel.ascx" TagName="ucExportarExcel" TagPrefix="uc1" %>

<asp:UpdatePanel runat="server" ID="upDetalle" UpdateMode="Conditional">
    <ContentTemplate>
        <table id="Table3" cellpadding="0" cellspacing="0" style="width: 90%">
    <tr>
        <td style="height: 48px">
            <div class="header2">
                Detalle Notificaci�n Seguridad Social Nro.
                <asp:Label ID="lblNoReferencia" runat="server" CssClass="subHeaderContrast"></asp:Label></div>
            <div class="header2">
                Total de la Notificaci�n:
                <asp:Label ID="lblTotalFactura" runat="server" CssClass="subHeaderContrast"></asp:Label></div>
            <div class="header2">
                Periodo de la Notificaci�n:
                <asp:Label ID="lblPeriodoFactura" runat="server" CssClass="subHeaderContrast"></asp:Label></div><br />
                <asp:Label ID="lblMensaje" runat="server" CssClass="label-Resaltado" EnableViewState="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvDetalle" runat="server" EnableViewState="False" AutoGenerateColumns="False" Width="100%">
				<Columns>
					<asp:BoundField DataField="no_documento" HeaderText="C&#233;dula"></asp:BoundField>
					<asp:BoundField DataField="id_nss" HeaderText="NSS"></asp:BoundField>
					<asp:BoundField DataField="nombres" HeaderText="Nombres"></asp:BoundField>
					<asp:BoundField DataField="periodo_aplicacion" HeaderText="Per&#237;odo"></asp:BoundField>
					<asp:BoundField DataField="SALARIO_ORIGINAL" HeaderText="S.O" DataFormatString="{0:n}" HtmlEncode="False">
						<ItemStyle HorizontalAlign="Right"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Right" />
					</asp:BoundField>
                    <asp:BoundField DataField="SALARIO_REPORTADO" DataFormatString="{0:n}" HeaderText="S.R"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DIF_SALARIO" DataFormatString="{0:n}" HeaderText="S.D"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APORTE_AFILIADOS_SFS" DataFormatString="{0:n}" HeaderText="R.S.F.S"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APORTE_EMPLEADOR_SFS" DataFormatString="{0:n}" HeaderText="C.S.F.S"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APORTE_AFILIADOS_SVDS" DataFormatString="{0:n}" HeaderText="R.P"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APORTE_EMPLEADOR_SVDS" DataFormatString="{0:n}" HeaderText="C.P">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APORTE_SRL" DataFormatString="{0:n}" HeaderText="S.R.L"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APORTE_ORIGINAL" DataFormatString="{0:n}" HeaderText="A.V.O"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APORTE_REPORTADO" DataFormatString="{0:n}" HeaderText="A.V.R">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DIF_APORTE" DataFormatString="{0:n}" HeaderText="A.V.D"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PER_CAPITA_ADICIONAL" DataFormatString="{0:n}" HeaderText="P.C.A">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NUEVO_IMPORTE" DataFormatString="{0:n}" HeaderText="N.I"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TOTAL_RECARGOS" DataFormatString="{0:n}" HeaderText="Recargos"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TOTAL_INTERES" DataFormatString="{0:n}" HeaderText="Intereses"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TOTAL_GENERAL_DET_FACTURA" DataFormatString="{0:n}" HeaderText="Total"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="Right" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
				</Columns>
				   
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton ID="btnLnkFirstPage" runat="server" CommandName="First" CssClass="linkPaginacion"
                OnCommand="NavigationLink_Click" Text="<< Primera"></asp:LinkButton>&nbsp;|
            <asp:LinkButton ID="btnLnkPreviousPage" runat="server" CommandName="Prev" CssClass="linkPaginacion"
                OnCommand="NavigationLink_Click" Text="< Anterior"></asp:LinkButton>&nbsp; P�gina
            [<asp:Label ID="lblCurrentPage" runat="server"></asp:Label>] de
            <asp:Label ID="lblTotalPages" runat="server"></asp:Label>&nbsp;
            <asp:LinkButton ID="btnLnkNextPage" runat="server" CommandName="Next" CssClass="linkPaginacion"
                OnCommand="NavigationLink_Click" Text="Pr�xima >"></asp:LinkButton>&nbsp;|
            <asp:LinkButton ID="btnLnkLastPage" runat="server" CommandName="Last" CssClass="linkPaginacion"
                OnCommand="NavigationLink_Click" Text="�ltima >>"></asp:LinkButton>&nbsp;
            <asp:Label ID="lblPageSize" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblPageNum" runat="server" Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td style="height: 12px">
            Total de Empleados
            <asp:Label ID="lblTotalRegistros" runat="server" CssClass="error"></asp:Label>
        </td>
    </tr>
</table>
    </ContentTemplate>
</asp:UpdatePanel>

 <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="Indicator">
                <img alt="indicator.gif" src="../images/ajaxIndicator.gif" />
                Buscando ...
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    
<div style="height:15px;"></div>
<table cellpadding="0" cellspacing="0" style="width:550px;">
<tr>
    <td style="width:70%;">
        <table id="Table2" cellpadding="0" cellspacing="0" class="td-note" style="width:100%;">
            <tr>
                <td>
                    <div class="centered"><span class="LabelDataGreen">Leyenda</span></div>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="20%">
                                S.O</td>
                            <td>
                                Salario Original</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                S.R</td>
                            <td>
                                Salario Reportado</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                S.D</td>
                            <td>
                                Salario Diferencia</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                R.S.F.S</td>
                            <td>
                                Retenci�n Seguro Familiar de Salud</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                C.S.F.S</td>
                            <td>
                                Contribuci�n Seguro Familiar de Salud</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                R.P</td>
                            <td>
                                Retenci�n Pensi�n</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                C.P</td>
                            <td>
                                Contribuci�n Pensi�n</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                S.R.L</td>
                            <td>
                                Seguro de Riesgo Laboral</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                A.V.O</td>
                            <td>
                                Aporte Voluntarios Original</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                A.V.R</td>
                            <td>
                                Aporte Voluntarios Reportado</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                A.V.D</td>
                            <td>
                                Aporte Voluntarios Diferencia</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                P.C.A</td>
                            <td>
                                Per C�pita Adicional</td>
                        </tr>
                        <tr>
                            <td width="20%" style="height: 12px">
                                N.I</td>
                            <td style="height: 12px">
                                Nuevo Importe</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                Total</td>
                            <td>
                                Total General</td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </td>
    <td>
        <div>
            <img alt="detalle.gif" border="0" src="../images/detalle.gif">&nbsp;<a href="javascript:history.back()">Encabezado</a>
        </div>
        <div>
            <uc1:ucExportarExcel ID="ucExpExcel" runat="server" />
            <br />
        </div>     
    </td>
</tr>
</table>