﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEL.aspx.vb" Inherits="SEL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Solicitudes en Linea</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="0" style="width: 100%">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                        Text="Solicitudes abiertas a traves de www.tss.gov.do"></asp:Label><br />
                    <asp:GridView ID="gvSol1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                        ShowFooter="True" Width="380px">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" HtmlEncode="False"
                                NullDisplayText="0" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Left" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad" DataFormatString="{0:N0}" HeaderText="Cantidad"
                                ReadOnly="True" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Right" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                        Text="Solicitudes abiertas a traves de *GOB"></asp:Label><br />
                    <asp:GridView ID="gvSolCCG" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                        ShowFooter="True"  Width="380px">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" HtmlEncode="False"
                                NullDisplayText="0" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Left" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad" DataFormatString="{0:N0}" HeaderText="Cantidad"
                                ReadOnly="True" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Right" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td >
                    <br />
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                        Text="Solicitudes pendientes clasificadas por tipo"></asp:Label><br />
                    <asp:GridView ID="gvSolAbiTip" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                        ShowFooter="True" Width="380px">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" HtmlEncode="False"
                                NullDisplayText="0" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Left" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad" DataFormatString="{0:N0}" HeaderText="Cantidad"
                                ReadOnly="True" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Right" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
                <td rowspan="3" valign="top">
                    <br />
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                        Text="Solicitudes completadas hoy, clasificadas por usuario"></asp:Label><br />
                    <asp:GridView ID="gvSolCerUsu" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                        ShowFooter="True" Width="380px">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" HtmlEncode="False"
                                NullDisplayText="0" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Left" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad" DataFormatString="{0:N0}" HeaderText="Cantidad"
                                ReadOnly="True" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Right" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td >
                    <br />
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                        Text="Solicitudes pendientes clasificadas por estatus"></asp:Label>&nbsp;<asp:GridView ID="gvSolAbiSts" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                        ShowFooter="True" Width="380px">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" HtmlEncode="False"
                                NullDisplayText="0" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Left" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad" DataFormatString="{0:N0}" HeaderText="Cantidad"
                                ReadOnly="True" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Right" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td >
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Small"
                        Text="Solicitudes completadas hoy, clasificadas por tipo"></asp:Label>
                    <asp:GridView ID="gvSolCerTip" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                        ShowFooter="True" Width="380px">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripci&#243;n" HtmlEncode="False"
                                NullDisplayText="0" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Left" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cantidad" DataFormatString="{0:N0}" HeaderText="Cantidad"
                                ReadOnly="True" HtmlEncode="False">
                                <ItemStyle HorizontalAlign="Right" />
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
