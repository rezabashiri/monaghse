using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using Abyari.Helpers;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Data;
namespace Abyari.Model
{
    [MetadataType(typeof(Metadata))]
    [System.ComponentModel.DataAnnotations.ScaffoldTable(false)]
    public partial class ZirProje
    {
        private class Metadata
        {

            public int ID { get; set; }
            [Display(Name = "نام طرح")]
            public string Name { get; set; }

            [Display(Name = "سطح")]
            public string Sath { get; set; }


            [Display(Name = "تعداد دستگاه آبیاری")]
            public Nullable<int> TedadDastgahAbyari { get; set; }
            [Display(Name = "نوع پمپ")]
            public string NoePomp { get; set; }
            [Display(Name = "دبی")]

            public Nullable<long> Debi { get; set; }
            [Display(Name = "منبع تامین آب")]

            public string ManbaeTaminAb { get; set; }
            [Display(Name = "کد ملی مشتری")]
            public string CodeMeliMoshtary { get; set; }
            public Nullable<int> IDPaymankar { get; set; }
            public Nullable<int> IDSherkatTarah { get; set; }
            [Display(AutoGenerateField = false)]
            public Nullable<int> IDRoosta { get; set; }
            [Display(Name = "سهم دولت")]
            public Nullable<double> SahmeDolat { get; set; }
            [Display(Name = "سهم بانک")]
            public Nullable<double> SahmeBank { get; set; }
            [Display(Name = "سهم متقاضی")]
            public Nullable<double> SahmeMotaghazi { get; set; }
            [Display(Name = "کد", Order = 0)]
            public string Code { get; set; }
            [Display(Name = "تاریخ عقد قرارداد")]
            public Nullable<System.DateTime> ContractDate { get; set; }
            [Display(Name = "تاریخ ورود به دفتر")]
            public Nullable<System.DateTime> EntryDate { get; set; }

            public virtual Paymankar Paymankar { get; set; }
            public virtual Sherkat Sherkat { get; set; }

            public virtual ZirProjeTahvilMovaghat ZirProjeTahvilMovaghat { get; set; }
        }
        public string ContractDate_Persian
        {
            get
            {
                if (ContractDate == null)
                    return string.Empty;
                return new tkv.Utility.DateConversion().ConvertoSolar(ContractDate ?? DateTime.Now);
            }
        }
        public string EntryDate_Persian
        {
            get
            {
                if (EntryDate == null)
                    return string.Empty;
                return new tkv.Utility.DateConversion().ConvertoSolar(EntryDate ?? DateTime.Now);
            }
        }
        //public string RoostaName
        //{
        //    get
        //    {
        //        if (this.Roosta != null)
        //            return this.Roosta.Sharh;
        //        return string.Empty;
        //    }
        //}
        public string PaymankarName
        {
            get
            {
                if (this.Paymankar != null)
                    return this.Paymankar.NameKamel;
                return string.Empty;
            }
        }
        public string TarahName
        {
            get
            {
                if (this.Sherkat != null)
                    return this.Sherkat.Name;
                return string.Empty;
            }
        }
        //public  Abyari.Enums.AbyariTypes Type
        //{
        //    get
        //    {
        //        Abyari.Enums.AbyariTypes _type = Abyari.Enums.AbyariTypes.None;
        //        Enum.TryParse(this.Noe, out _type);
        //        return _type;
        //    }
        //}
        [Display(Name = "نوع پروژه", AutoGenerateField = true, Order = 0)]
        public string TypeString
        {
            get
            {
                return this.NoeProje != null ? this.NoeProje.Sharh : string.Empty;
            }
        }
        public ZirProje GetZirProjeByCodeIncludes(int id, string[] includes)
        {
            using (var myen = new AbyariEntities())
            {
                var zirproje = myen.ZirProjes.AsQueryable();
                if (includes != null)
                {
                    foreach (string inc in includes)
                    {
                        zirproje = zirproje.Include(inc);
                    }
                }
                return zirproje.AsNoTracking().Where(x => x.ID == id).FirstOrDefault() ?? new ZirProje() { ID = -1 };
            }
        }
        public List<ViewZirProjeMoshtary> SearchZirProjeByConditions(string condition)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                return en.SearchZirProje_Get(condition).ToList<ViewZirProjeMoshtary>();
            }
        }

        public string ImportFromExcel(System.Data.DataSet ds, int roleid, int userid)
        {
            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                    foreach (System.Data.DataTable table in ds.Tables)
                    {
                        var pList = new SqlParameter("@data", SqlDbType.Structured);
                        var uid = new SqlParameter("@UserID", userid);
                        var rid = new SqlParameter("@RoleID", roleid);
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
                        var ret = en.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, " dbo.Import @data,@UserID,@RoleID", pList, uid, rid);
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

        public string ImportFromExcelProject(System.Data.DataSet ds)
        {
            string cc = string.Empty;

            using (var en = Helpers.ContextHelpers.GetContext())
            {
                try
                {
                    foreach (System.Data.DataTable table in ds.Tables)
                    {
                        var pList = new SqlParameter("@data", SqlDbType.Structured);
                        pList.TypeName = "dbo.ImportGeneralFormat";

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
                                    _coltype = typeof(string);
                                    break;
                                case 3:
                                    _coltype = typeof(int);
                                    break;
                            }
                            dt.Columns[c].DataType = _coltype;
                        }
                        dt.Merge(table, false, MissingSchemaAction.Ignore);
                        pList.Value = dt;
                        SqlParameter sqp = new SqlParameter();
                        sqp.Direction = ParameterDirection.Output;
                        sqp.ParameterName = "@count";
                        sqp.DbType = DbType.Int32;
                        
                        var ret = en.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, "dbo.ImportFromExcelGeneral @data , @count OUTPUT", pList, sqp);
                        cc = sqp.Value.ToString();
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
                            WebUtility.Helpers.LogHelpers.TakeALogWithTime(ex1.MessaeContent);
                            break;
                    }
                    return string.Empty;
                }
            }

            //return string.Format("تعداد {0} با موفقیت وارد شد", cc);
            return cc;

        }
    }
}
