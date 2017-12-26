﻿using FluentMigrator;

namespace DatabaseMigrations.Migrations
{
    [Migration(201611010348)]
    public class _201611010348_nss_validar_solicitud_nui_2: FluentMigrator.Migration
    {
        public override void Up()
        {
            Execute.Script(Framework.Configuration.ScriptDirectory() + "nss_validar_solicitud_nui_2.sql");
        }

        public override void Down()
        {
            Execute.Sql("DROP PROCEDURE NSS_VALIDAR_SOLICITUD_NUI_2");
        }
    }
}
