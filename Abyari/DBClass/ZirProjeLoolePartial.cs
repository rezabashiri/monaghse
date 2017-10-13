using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Abyari.Model
{
    public partial class ZirProjeLoole
    {



        public string ImportFromExcelLoloehProject(System.Data.DataSet ds)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                    foreach (System.Data.DataTable table in ds.Tables)
                    {
                        var pList = new SqlParameter("@data", SqlDbType.Structured);
                        pList.TypeName = "dbo.importLolehExcelformat";

                        int i = table.Columns.Count;
                        Type _coltype = typeof(string);
                        DataTable dt = table.Clone();
                        for (int c = 0; c < i; c++)
                        {
                            if (table.Columns[c].ColumnName.Contains("F"))
                            {
                                table.Columns.Remove(table.Columns[c].ColumnName);
                                dt.Columns.Remove(table.Columns[c].ColumnName);
                                i--;
                            }
                            switch (c)
                            {
                                case 0:
                                case 1:
                                case 3:
                                case 6:
                                    _coltype = typeof(string);
                                    break;
                                case 2:
                                case 4:
                                case 5:
                                    _coltype = typeof(int);
                                    break;
                            }
                            dt.Columns[c].DataType = _coltype;
                        }
                        dt.Merge(table, false, MissingSchemaAction.Ignore);
                        pList.Value = dt;
                        var ret = en.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, "dbo.importLolehExcelformat @data", pList);
                    }

                }
                catch (Exception ex)
                {
                    var ex1 = tkv.Utility.ExceptionHandel.HandelSqlException(ex);
                    string mes = string.Empty;
                    switch (ex1.StatusType)
                    {
                        case tkv.Utility.MessageType.UserException:
                            mes = string.Format("موارد روبرو در هنگام ورود با خطا مواجه شده اند،لطفا برسی گردد: {0}", ex1.MessaeContent);
                            break;
                        default:
                            mes = string.Format("خطا رخ داده است : {0}", ex1.MessaeContent);
                            break;
                    }
                    return mes;
                }
            }
            return "اطلاعات با موفقیت وارد شد";
        }
    }
}