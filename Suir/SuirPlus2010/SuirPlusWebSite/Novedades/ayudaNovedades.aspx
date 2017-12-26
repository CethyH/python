<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="ayudaNovedades.aspx.vb" Inherits="Novedades_ayudaNovedades" title="Ayuda Novedades" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Ayuda Novedades</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="350">
				<tr>
					<td class="Header">
                        <strong><span style="font-size: 8pt">
						Ayuda de novedades </span></strong>
					</td>
				</tr>
				<tr>
					<td class="subHeader" style="height: 30px"><BR>
						Sobre los salarios y otros ingresos reportados
					</td><br />
				</tr>
				<tr>
					<td style="height: 237px">
						<p> 
							El monto del salario cotizable para la Seguridad Social y para el ISR, as� como 
							los otros ingresos ser�n utilizados para el c�lculo de las retenciones y 
							aportes del SDSS y del ISR para el per�odo en que est� reportando.
						</P>
						<p>
						    El monto del salario reportado para Infotep solo ser� tomado en cuenta para 
						    las liquidaciones por este concepto. Si se deja en 0.00 se tomar� por defecto 
						    el mismo salario reportado para el SDSS.
						</p>						
						<p>
                            <span style="font-size: 8pt"><strong>Ejemplo </strong></span>
							
							Si est� dando ingreso a un trabajador, debe reportar <STRONG>�nicamente la 
							proporci�n de lo percibido</STRONG> por el trabajador en el per�odo que 
							reporta y actualizar los datos del mismo nuevamente el mes siguiente.
						</p>						
						<p> 
						    Si est� dando salida a un trabajador, debe reportar <STRONG>�nicamente la proporci�n 
							de lo percibido</STRONG> por el trabajador en el per�odo que reporta. No 
							deber� reportar nuevamente al trabajador ya que quedar� dado de baja para el 
							siguiente per�odo.							
						</p>
					</td>
				</tr>
				<TR>
					<TD align="center">
						<p><br />
							<input type="button" onclick="window.close();" value="Cerrar Ventana" />
						</p>
					</TD>
				</TR>
			</table>
    </div>
    </form>
</body>
</html>
