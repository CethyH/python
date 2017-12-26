﻿CREATE OR REPLACE PROCEDURE SUIRPLUS.NSS_GET_SOLICITUD_RNC
(
 P_RNC in VARCHAR2,
 P_ID_ESTATUS in VARCHAR2,   
 P_FECHA_DESDE in DATE,
 P_FECHA_HASTA in DATE,
 P_PAGENUM  in NUMBER,
 P_PAGESIZE in NUMBER,
 P_CURSOR out SYS_REFCURSOR,
 P_RESULTADO out VARCHAR2
) IS
  vDesde integer := (p_pagesize * (p_pagenum - 1)) + 1;
  vhasta integer := p_pagesize * p_pagenum;
BEGIN
  OPEN P_CURSOR FOR
    with pages as
     (Select rownum num, y.*
      from (SELECT S.ID_SOLICITUD AS SOLICITUD,
                   TS.DESCRIPCION AS TIPOSOLICITUD,
                   S.FECHA_SOLICITUD AS FECHASOLICITUD,
                   ST.DESCRIPCION AS ESTATUS,
                   ER.ERROR_DES AS MOTIVORECHAZO,
                   T.DESCRIPCION AS TIPODOC,
                   D.NO_DOCUMENTO_SOL AS EXPEDIENTE,
                   CASE WHEN C.ID_NSS IS NULL THEN D.NOMBRES ELSE C.NOMBRES END AS NOMBRES,
                   CASE WHEN C.ID_NSS IS NULL THEN TRIM(D.PRIMER_APELLIDO||' '||D.SEGUNDO_APELLIDO) ELSE TRIM(C.Primer_Apellido||' '||C.SEGUNDO_APELLIDO) END AS APELLIDOS,
                   CASE WHEN C.ID_NSS IS NULL THEN D.SEXO ELSE C.SEXO END SEXO,
                   CASE WHEN C.ID_NSS IS NULL THEN D.FECHA_NACIMIENTO ELSE C.FECHA_NACIMIENTO END AS FECHANACIMIENTO,
                   CASE WHEN C.ID_NSS IS NULL THEN D.ID_NSS ELSE C.ID_NSS END AS NSS,
                   CASE WHEN C.ID_NSS IS NULL THEN NULL ELSE C.NO_DOCUMENTO END AS NRODOC,
                   D.NUM_CONTROL AS LOTE,
                   D.ID_CONTROL AS REGISTRO 
            FROM suirplus.NSS_SOLICITUDES_T S
            JOIN suirplus.NSS_DET_SOLICITUDES_T D
              ON D.ID_SOLICITUD = S.ID_SOLICITUD
            JOIN suirplus.SRE_TIPO_DOCUMENTOS_T t
              ON T.ID_TIPO_DOCUMENTO = D.ID_TIPO_DOCUMENTO
            JOIN suirplus.Nss_Tipo_Solicitudes_t TS
              ON TS.ID_TIPO = S.ID_TIPO  
            JOIN suirplus.NSS_ESTATUS_T ST
              ON ST.ID_ESTATUS = D.ID_ESTATUS
            LEFT JOIN suirplus.SEG_ERROR_T ER
              ON ER.ID_ERROR = D.ID_ERROR
            LEFT JOIN suirplus.SRE_CIUDADANOS_T C
              ON C.ID_NSS = D.ID_NSS
            JOIN suirplus.SRE_EMPLEADORES_T E
              ON E.ID_REGISTRO_PATRONAL = S.ID_REGISTRO_PATRONAL
           WHERE NVL(E.RNC_O_CEDULA,'~') = CASE WHEN P_RNC IS NULL THEN NVL(E.RNC_O_CEDULA,'~') ELSE P_RNC END
             AND NVL(D.ID_ESTATUS,-1) = CASE WHEN P_ID_ESTATUS IS NULL THEN NVL(D.ID_ESTATUS,-1) ELSE TO_NUMBER(P_ID_ESTATUS) END 
             and trunc(s.fecha_solicitud) between
                 decode(p_fecha_desde,
                        null,
                        trunc(s.fecha_solicitud),
                        trunc(p_fecha_desde)) and
                 decode(P_Fecha_Hasta,
                        null,
                        trunc(s.fecha_solicitud),
                        trunc(P_Fecha_Hasta))  
            
           ORDER BY S.ID_SOLICITUD DESC) y
        )
    Select y.recordcount, pages.*
      from pages, (Select max(num) recordcount from pages) y
     where num between vDesde and vhasta
     order by num;
       
   p_resultado := 'OK';  
EXCEPTION 
  WHEN OTHERS THEN
    p_resultado := SQLERRM;
END;
