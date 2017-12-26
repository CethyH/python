<%@ Page Language="VB" MasterPageFile="~/SuirPlus.master" AutoEventWireup="false" CodeFile="consFacturasISR.aspx.vb" Inherits="Empleador_consFacturasISR" title="Consulta de Notificaciones de Pago - ISR" %>

<%@ Register Src="../Controles/ucLiquidacionISRDetalle.ascx" TagName="ucLiquidacionISRDetalle"
    TagPrefix="uc3" %>

<%@ Register Src="../Controles/ucEncabezadoDGII.ascx" TagName="ucEncabezadoDGII"
    TagPrefix="uc1" %>
<%@ Register Src="../Controles/ucLiquidacionISREncabezado.ascx" TagName="ucLiquidacionISREncabezado"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br />
    <uc1:ucEncabezadoDGII ID="UcEncabezadoDGII1" runat="server" />
    <uc2:ucLiquidacionISREncabezado ID="ucLiqEncISR" runat="server" />
    <br />
    <uc3:ucLiquidacionISRDetalle ID="ucLiqDetalle" runat="server" Visible="false" />
</asp:Content>

