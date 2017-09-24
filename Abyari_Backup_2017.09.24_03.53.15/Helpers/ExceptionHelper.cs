using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Abyari.Helpers
{
    public class ExceptionHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_page"></param>
        /// <param name="ex"></param>
        /// <returns>0 = not exception & 1 = some exceptions & other = comes from custom code exception</returns>
     public static Int64 HandelException(System.Web.UI.Page _page, Exception ex)
        {
            if (ex != null)
            {
                string ExecpttionMessage = string.Empty;

                int ExceptionNumber = GetsqlExceptionNumber(ex);

                ExecpttionMessage = GetExceptionMessageOfNumber(ExceptionNumber, ex);




                ExecpttionMessage += HandelCustomSqlException(ex);
                if (string.IsNullOrEmpty(ExecpttionMessage))                          //to handel all other exception
                    ExecpttionMessage += HandelOtherException(ex);

                if (!string.IsNullOrEmpty(ExecpttionMessage))
                {
                    Helpers.ContextHelpers.ShowMessage(_page, ExecpttionMessage.Trim());
                    if (ExceptionNumber == 600000)
                        return Convert.ToInt64(GetSplitNumber(ex));
                    else
                    {
                        LogHelpers.WriteLog(ex.Message, ex.Source);
                       if (ex.InnerException != null)
                            LogHelpers.WriteLog(ex.InnerException.Message, ex.InnerException.Source);
                   
                        
                        return 1;
                    }// exception
                }
                else
                {
                    Helpers.ContextHelpers.ShowSuccess(_page);
                    return 0;//not exception
                }
            } return 0;
        }

        public static string GetExceptionMessageOfNumber(int ExceptionNumber, Exception Ex)
        {
            if (Ex != null)
            {

                switch (ExceptionNumber)
                {
                    case 600000:
                        string message = GetSplitNumber(Ex);
                        message = string.Format("{0} {1} {2}", "اطلاعات با شماره ", message, "ثبت شد");
                        return message;
                   
                    
                    
                    case 50010:
                        return "مبلغ وارد شده برای صورت وضعیت ها از مبلغ قرارداد بیشتر شده است";
                    case 50011:
                        return "صورت وضعیت در محدوه تاریخ قرارداد نیست بررسی گردد";
                    case 50012:
                        return "صورت وضعیت برای این دوره ی تاریخی قبلا وارد شده است";
                    case 2627:
                        return "اطلاعات قبلا وارد شده است بررسی گردد";
                    case 50013:
                        return "درصد افزایش قرارداد نمیتواند از 25 درصد بیشتر باشد بررسی کنید ";

                    //dbo.GharardadPaymanRizSoratVaziat
                    case 50014:
                        return "مبلغ تائيد استان از مبلغ کل قرارداد بيشتر شده است";
                    case 50015:
                        return "مبلغ ارائه پيمانکار از مبلغ کل قرارداد بيشتر شده است";
                    case 50016:
                        return "مبلغ تائيد شهرستان از مبلغ کل قرارداد بيشتر شده است";
                    case 50017:
                        return "مبلغ تائيد مشاور از مبلغ کل قرارداد بيشتر شده است"; 

                }
            }
            return string.Empty;
        }

        public static int GetsqlExceptionNumber(Exception ex)
        {
            if (ex != null)
                if (ex.InnerException is SqlException)
                {
                    var sqlException = (SqlException)ex.InnerException;
                    return sqlException.Number;
                }
                else if (ex.InnerException != null && ex.InnerException.InnerException != null)
                {
                    if (ex.InnerException.InnerException is SqlException)
                    {
                        var sqlException = (SqlException)ex.InnerException.InnerException;
                        return sqlException.Number;
                    }
                }
            return 0;
        } 





        public static string GetExceptionMessage(Exception ex)
        {
            if (ex != null)
            {


                if (ex.InnerException != null)
                {
                    return ex.InnerException.Message;
                }
                else
                    return ex.Message;
            }
            return string.Empty;
        }

        public static string HandelOtherException(Exception ex)
        {
            if (ex != null)
            {
                string message = GetExceptionMessage(ex);

                if (string.IsNullOrEmpty(message))
                    return string.Empty;
                else
                    return "خطا در اجرای عملیات";
            }
            return string.Empty;

        }
        public static string HandelCustomSqlException(Exception ex)
        {
            if (ex != null)
            {
                string message = GetSplitNumber(ex);
                if (!string.IsNullOrEmpty(message))
                {
                    string show = new string(message.Where(x => (x >= 'ا' && x <= 'ی') || x == ' ').ToArray<char>());
                    return show;

                }
            }
            return string.Empty;

        }
        public static string GetSplitNumber(Exception ex)
        {
            if (ex != null)
            {
                string message = GetExceptionMessage(ex);
                if (!string.IsNullOrEmpty(message))
                {
                    string[] split = message.Split('\\');
                    if (split.Length > 0)
                    {
                        string name = split[split.Length - 1];
                        name = new string(name.Where(x => (x >= '0' && x <= '9')).ToArray<char>());
                        if (name.Length > 0)

                            return name;
                    }
                } return string.Empty;
            }

            return string.Empty;

        }
    }
}