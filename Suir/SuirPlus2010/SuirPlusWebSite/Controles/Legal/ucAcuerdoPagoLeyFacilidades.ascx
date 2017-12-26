<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ucAcuerdoPagoLeyFacilidades.ascx.vb" Inherits="Controles_Legal_ucAcuerdoPagoLeyFacilidades" %>

<asp:Panel ID="pnlInfo" runat="server">
<table border="0" cellpadding="0" cellspacing="0" width="850">
    <tr>
        <td style="text-align: justify;font-family:verdana;font-size:11px;">
            <strong>Nro:
                <asp:Label ID="lblNroAcuerdo" runat="server" Text="_______"></asp:Label><br />
                <br />
                ACUERDO PARA LA APLICACI�N DE LA LEY DE FACILIDADES DE PAGO DE LOS EMPLEADORES
                CON DEUDAS PENDIENTES CON EL SISTEMA DOMINICANO DE SEGURIDAD SOCIAL.
                <br />
            </strong>
            <br />
            <strong>ENTRE:</strong> De una parte, la <strong>TESORER�A DE LA SEGURIDAD SOCIAL, </strong>
            RNC 401517078,
            entidad p�blica constituida en virtud de la Ley No. 87-01 que crea el Sistema Dominicano
            de Seguridad Social<strong> </strong>(en lo adelante SDSS), con domicilio en la avenida Tiradentes No. 33, sector Naco,
            de esta ciudad de Santo Domingo, Distrito Nacional, debidamente representada por
            el se�or <strong>
                <asp:Label ID="lblFirmante1" runat="server"></asp:Label></strong>,
            <asp:Label ID="lblCargo1" runat="server"></asp:Label>
            , <asp:Label ID="lblDatosFirmante" runat="server" ></asp:Label>
            portador de la C�dula de Identidad y Electoral n�mero  <asp:Label ID="lblCedulaFirmante" runat="server"></asp:Label>, quien para
            los fines de este Contrato se denominar� <strong>LA TESORERIA</strong> O <strong>LA
                TSS</strong>;
            <br />
            <br />
            Y de la otra parte,
            <asp:Label ID="lblRazonSocial" runat="server" Font-Bold="True"></asp:Label>, RNC
            <asp:Label ID="lblRNC" runat="server"></asp:Label>, sociedad
            comercial constituida de conformidad con las leyes de la Rep�blica Dominicana y/o
            Empleador, con su domicilio social ubicado en la
            <asp:Label ID="lblDireccion" runat="server" Font-Bold="False"></asp:Label>, Rep�blica
            Dominicana, debidamente representada por su
            <asp:Label ID="lblCargoRepresentante" runat="server"></asp:Label><strong>, el (la) se�or (a) </strong><asp:Label
                ID="lblNombreRepresentante" runat="server" Font-Bold="True"></asp:Label><strong>, </strong>
            <asp:Label ID="lblNacionalidad" runat="server"></asp:Label><strong>, mayor de edad,
            </strong>
            <asp:Label ID="lblEstadoCivil" runat="server"></asp:Label><strong>, portador de&nbsp;
            </strong>
            <asp:Label ID="lblDescCedulaoPasaporte" runat="server" Text="la C�dula de Identidad y Electoral"></asp:Label><strong>
                No. </strong>
            <asp:Label ID="lblNroCedulaoPasaporte" runat="server"></asp:Label><strong>, quien en
                lo que sigue del presente Contrato se denominar� LA EMPRESA Y/O EMPLEADOR</strong>;
            cuando este contrato se refiera conjuntamente a ambas partes ser�n denominadas <strong>
                LAS PARTES.<br />
                <br />
                POR CUANTO: A que en fecha nueve (09) del mes mayo del a�o Dos Mil Uno (2001), el
                Poder Ejecutivo promulg� la Ley marcada con el n�mero 87-01, que crea el Sistema
                Dominicano de Seguridad Social, la cual en su Art�culo 28, otorga a la TESORERIA
                DE LA SEGURIDAD SOCIAL</strong>, la funci�n de �Administrar el Sistema �nico
            de Informaci�n, mantener los registros actualizados sobre los empleadores y sus
            afiliados y sobre los beneficiarios de los tres regimenes de financiamiento, recaudar
            distribuir y asignar los recursos del SDSS, ejecutar por cuenta del consejo Nacional
            de Seguridad Social (en lo adelante CNSS) el pago
            a todas las instituciones participantes, p�blicas, privadas y/o mixtas, garantizando regularidad,
            transparencia, seguridad, eficiencia e igualdad, detectar la mora, evasi�n y elusi�n
            combinando otras fuentes de informaci�n gubernamental o privada�.<br />
            <br />
            <strong>POR CUANTO: LA EMPRESA Y/O EMPLEADOR</strong>, se encuentra en atraso de los pagos de las
            Notificaciones de Pago resultantes de las cotizaciones y contribuciones de sus empleados
            al Sistema Dominicano de Seguridad Social, correspondientes a periodos
            comprendidos entre
            <asp:Label ID="lblPeriodoDesde" runat="server"></asp:Label>
            y
            <asp:Label ID="lblPeriodoHasta" runat="server"></asp:Label>.<br />
            <br />
            <strong>POR CUANTO: LA EMPRESA Y/O EMPLEADOR</strong>, ha solicitado de manera formal acogerse a
            la Ley No. 189-07, de fecha 9 de Agosto del 2007 sobre Facilidades de Pago
            de los Empleadores con Deudas Pendientes con el Sistema Dominicano de Seguridad
            Social (SDSS), la cual establece en su articulo 1ero. que los Empleadores podr�n
            saldar la totalidad de la indicada deuda pagando el monto principal derivado de
            la aplicaci�n de los porcentajes del Seguro de Vejez, Discapacidad y Sobrevivencia
            y del Seguro de Riesgos Laborales, m�s una compensaci�n&nbsp; equivalente a los porcentajes de rentabilidad mensual
            promedio que hayan pagado las AFP�s a las cuentas de capitalizaci�n individual en sustituci�n de los recargos e intereses
            acumulados hasta la fecha.
            <br />
            <br />
            POR TANTO y en el entendido de que el presente pre�mbulo forma parte integra del
            presente contrato, LAS PARTES, de manera libre y voluntaria:
            <br />
            <br />
            <strong>HAN CONVENIDO Y PACTADO LO SIGUIENTE:
                <br />
            </strong>
            <br />
            PRIMERO: OBJETO. Que LA EMPRESA Y/O EMPLEADOR, SE COMPROMETE a pagar, a m�s tardar
            el tercer d�a laborable de cada mes, las cotizaciones atrasadas asignadas en cada
            cuota, por lo que la misma saldar� en un plazo no mayor de
            <asp:Label ID="lblNroMeses" runat="server"></asp:Label><strong> meses, mediante la realizaci�n
                de los correspondientes pagos mensuales y consecutivos detallados como sigue:
                <br />
                <br />
            </strong>
            <asp:GridView ID="gvCuotas" runat="server" AutoGenerateColumns="False" CellPadding="3">
                <Columns>
                    <asp:BoundField DataField="Cuota" HeaderText="Cuota">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Referencias" HeaderText="Referencias" HtmlEncode="False">
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FechaLimite" HeaderText="Fecha Limite de Pago" HtmlEncode="False" DataFormatString="{0:dd-MM-yy}">
                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
                <br />
            <strong>
                SEGUNDO: RECARGOS E INTERESES. </strong>Queda entendido que todos los pagos incluir�n los
                porcentajes de rentabilidad mensual promedio que hayan pagado las AFP�s a las cuentas
                de capitalizaci�n individual, hasta la fecha efectiva de la realizaci�n de cada
                pago mensual.
                <br />
                <br />
            <strong>
                TERCERO: PAGO DE NOTIFICACION DE PAGO VIGENTE. Que el presente acuerdo se hace reconociendo que
                LA TESORERIA</strong> le permitir� a LA EMPRESA Y/O EMPLEADOR el pago de las notificacion(es) de pago
            que se generen en los meses que transcurran en el presente
            acuerdo, lo que significar� la cobertura mensual de sus empleados, 
            conjuntamente con los pagos a realizar por las deudas atrasadas;
            <br />
            <br />
            <strong>
            CUARTO: DETERMINACION DE DEUDA.</strong> Que LA EMPRESA Y/O EMPLEADOR reconoce que los valores
            incluidos en el presente acuerdo han sido calculados de conformidad con las n�minas
            de pago, por lo cual garantiza haber realizado todas las novedades correspondientes
            a dichas N�minas que aparecen en el Sistema �nico de Informaci�n y Recaudo (SUIR)
            de LA TESORERIA, por lo que se compromete a no realizar ninguna modificaci�n a los datos de
            las n�minas ni de las notificaciones de pago objeto del presente acuerdo;
            <br />
            <br />
            <strong>QUINTO: FUTURAS AUDITORIAS</strong>. Que no obstante, LA EMPRESA Y/O EMPLEADOR
            reconoce que <strong>LA TESORERIA </strong>tiene la facultad de realizar cualquier
            comprobaci�n, a fin de verificar si sus plantillas de n�mina que sirvieron de base para dichas notificaciones son verdaderas y correctas,
            pudiendo llegar a determinar diferencias a pagar mediante Auditoria que podr�a ser
            realizada posteriormente, en cuyo caso realizar�an las notificaciones correspondientes;
            incluyendo los recargos e intereses de la Ley 87-01.
            <br />
            <br />
            <strong>
            SEXTO: INCUMPLIMIENTO.</strong> Que <strong>LA EMPRESA Y/O EMPLEADOR </strong>se compromete
            a cumplir con los pagos mensuales, dentro de las fechas previamente establecidas,
            y en caso de no realizar el pago en dicha fecha, el presente acuerdo se considerar�
            <strong>INCUMPLIDO</strong>, por lo que se les reversar�n todos los recargos e intereses
            eliminados, de conformidad con lo establecido en el P�rrafo del art�culo 4 de la
            Ley No.189-07, de fecha 9 de Agosto del 2007 sobre Facilidades de Pago de los Empleadores
            con Deudas Pendientes con el Sistema Dominicano de Seguridad Social (SDSS), y reconoce
            que la <strong>LA TESORERIA</strong> podr� iniciar un proceso penal tendente al
            cobro mediante el apoderamiento de los tribunales penales competentes.
            <br />
            <br />
            <strong>P�rrafo:</strong> Si en el curso de la ejecuci�n del presente acuerdo <strong>
                LA TESORERIA</strong> determinare por las fuentes de informaci�n establecidas
            en la Ley 87-01, que las informaciones iniciales proporcionadas por <strong>LA EMPRESA
                Y/O EMPLEADOR</strong> son incorrectas o incompletas se proceder� a dejar sin
            efecto el presente acuerdo con las consecuencias establecidas en el presente articulo.
            <br />
            <br />
            En la ciudad de Santo Domingo, Distrito Nacional, Capital de la Rep�blica Dominicana,
            a los 
            <asp:Label ID="lblFechaDia" runat="server"></asp:Label>
            d�as del mes de
            <asp:Label ID="lblFechaMes" runat="server"></asp:Label>
            del a�o
            <asp:Label ID="lblFechaAno" runat="server"></asp:Label>.
            <br />
            <br />
            POR
            <br />
            <br />
            <br />
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="width: 850px">
                <tr>
                    <td style="text-align: center">
                        ______________________________________________
            <br />
            <asp:Label ID="lblNombreRep" runat="server" Font-Bold="True"></asp:Label><br />
            <asp:Label ID="lblCargo" runat="server" Font-Bold="True"></asp:Label><br />
            <asp:Label ID="lblRazonSocial2" runat="server" Font-Bold="True"></asp:Label></td>
                    <td style="text-align: center">
                        ______________________________________________<br />
            <strong><asp:Label ID="lblFirmante2" runat="server"></asp:Label> </strong>
            <br />
            <strong><asp:Label ID="lblCargoFirmante" runat="server"></asp:Label>
            </strong>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            YO, _______________________________________________, Notario P�blico de los del N�mero
            para el Distrito Nacional, con Colegiatura N�mero _______, portador de la c�dula
            de identidad y electoral n�mero _____________________________________, con Estudio ubicado en esta ciudad,
            CERTIFICO Y DOY FE: que las firmas que anteceden fueron puesta en mi presencia,
            libre y voluntariamente, por los se�ores 
            <asp:Label ID="lblNombreRep2" runat="server" Font-Bold="True"></asp:Label>
            y <strong><asp:Label ID="lblFirmante3" runat="server"></asp:Label></strong>, de generales que constan, quienes me han declarado que son las mismas que acostumbran
            a usar en todos sus actos p�blicos y privados.
            <br />
            <br />
            En la ciudad de Santo Domingo, Distrito Nacional, Capital de la Rep�blica Dominicana,
            a los 
            <asp:Label ID="lblFechaDia2" runat="server"></asp:Label>
            d�as del mes de
            <asp:Label ID="lblFechaMes2" runat="server"></asp:Label>
            del a�o
            <asp:Label ID="lblFechaAno2" runat="server"></asp:Label>.&nbsp;
            <br />
            <br />
            <br />
            <br />
            <div align="center">
            _________________________________________<br />
            <br />
            <strong>NOTARIO PUBLICO</strong></div></td>
    </tr>
</table>
</asp:Panel>
<br />
<asp:Label ID="lblMensaje" runat="server" CssClass="label-Resaltado" Visible="False"></asp:Label>
