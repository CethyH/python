﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuirPlusEF.Models
{
    [Table("SEG_USUARIO_PERMISOS_T")]
    public class UsuarioPermiso
    {
        [Key, Column("ID_PERMISO", Order = 0)]
        public Int32 ? IdPermiso { get; set; }

        [Key, Column("ID_ROLE", Order = 1)]
        public Int32 ? IdRole { get; set; }

        [Key, Column("ID_USUARIO", Order = 2)]
        public string IdUsuario { get; set; }

        [Column("ULT_USUARIO_ACT")]
        public string UltimoUsuarioActualizo { get; set; }

        [Column("ULT_FECHA_ACT")]
        public DateTime ? UltimaFechaActualizacion { get; set; }
    }
}
