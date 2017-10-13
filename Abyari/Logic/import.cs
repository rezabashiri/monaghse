using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Data;

namespace Abyari.Model
{
    public class Import
    {
            [Display(Name = "ردیف")]
            public int ID { get; set; }
            [Display(Name = "نام شرکت")]
            public string CompanyName { get; set; }
            [Display(Name = "شهر")]
            public string City { get; set; }
            [Display(Name = "نام کشاورز")]
            public string FarmerName { get; set; }
            [Display(Name = "تاریخ قرارداد")]
            public Nullable<System.DateTime> ContractDate { get; set; }
            [Display(Name = "تاریخ ورود به دفتر انجمن")]
            public Nullable<System.DateTime> EntryDate { get; set; }
            [Display(Name = "موضعی")]
            public int Mozeie { get; set; }
            [Display(Name = "بارانی")]
            public int barani { get; set; }
            [Display(Name = "کم فشار")]
            public int kamfeshar { get; set; }
            [Display(Name = "بارانی تیپ")]
            public int baraniTip { get; set; }
            [Display(Name = "کم فشار تیپ")]
            public int kamFesharTip { get; set; }
            [Display(Name = "سطح پروژه")]
            public int ProjeLevel { get; set; }
            [Display(Name = "قابل پرداخت")]
            public long PaymentAll { get; set; }
            [Display(Name = "نقدی")]
            public long PaymentCash { get; set; }
            [Display(Name = "چک")]
            public long PaymentCheck { get; set; }
            [Display(Name = "مایه التفاوت")]
            public long PaymentDifferent { get; set; }
            [Display(Name = "رتبه")]
            public int Rating { get; set; }
            [Display(Name = "عقد قرارداد")]
            public bool Contract { get; set; }
            [Display(Name = "صورت جلسه تحویل موقت")]
            public int TemporaryDeliveryMinutes { get; set; }
            [Display(Name = "کسر ظرفیت")]
            public int CapacityDeduction { get; set; }
            [Display(Name = "ظرفیت باقی مانده")]
            public int RemainingCapacity { get; set; }


        public string ImportFromExcel(System.Data.DataSet ds, int roleid, int userid)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                    foreach (System.Data.DataTable table in ds.Tables)
                    {
                        var pList = new SqlParameter("@data", SqlDbType.Structured);
                        pList.TypeName = "dbo.ImportExcelFormat";
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
                                case 2:
                                case 3:
                                case 4:
                                case 9:
                                case 10:
                                case 11:
                                    _coltype = typeof(string);
                                    break;
                                case 5:
                                case 6:
                                case 7:
                                case 8:
                                    _coltype = typeof(double);
                                    break;
                            }
                            dt.Columns[c].DataType = _coltype;
                        }
                        dt.Merge(table, false, MissingSchemaAction.Ignore);
                        pList.Value = dt;
                        var ret = en.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, " dbo.Import @data,@UserID,@RoleID", pList, userid, roleid);
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