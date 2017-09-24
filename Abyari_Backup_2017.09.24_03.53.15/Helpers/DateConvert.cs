using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using tkv.Utility;
namespace Abyari.Helpers
{
    public class DateConvert
    {
        /// <summary>
        /// determine whether this year is leep in persian
        /// </summary>
        /// <param name="JesusDate"></param>
        /// <returns></returns>
        

        public static bool IsLeepYear(DateTime JesusDate)
        {
            tkv.Utility.DateConversion dc = new DateConversion();
            return dc.IsLeepYear(JesusDate);
        }
        public static DateTime GetPersian_InDateTime(object JesusDate)
        {
            DateConversion dc = new DateConversion();
            if (JesusDate != null)
            {
                DateTime dt;
                if (DateTime.TryParse(JesusDate.ToString(), out dt))
                {
                    return dc.dateconversiontosolar(dt).Date;
                }
                return dc.Today();
            }
            return dc.Today();
        }
        public static DateTime GetPersian_Today()
        {
            return GetPersian_InDateTime((object)DateTime.Now);
        }
        public static string GetPersian(object JesusDate)
        {
            DateConversion dc = new DateConversion();
            if (JesusDate != null)
            {
                DateTime dt;
                if (DateTime.TryParse(JesusDate.ToString(), out dt))
                {
                    return string.Format("{0}", dc.ConvertoSolar(dt)).Split(' ')[0];
                }
                return string.Empty;
            }
            return string.Empty;
        }

        public static int GetEndDayOFMonth(object Date)
        {
            if (Date == null)
                return 0;
            DateTime dt = GetPersian_InDateTime(Date);
            switch (dt.Month)
            {
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                    return 31;
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                    return 30;
                case 12:
                    if (IsLeepYear((DateTime)Date))
                        return 29;
                    else
                        return 30;
                default:
                    return 0;

            }
        }
        public static string GetMah(object Date)
        {
            if (Date == null)
                return string.Empty;
            DateTime dt = GetPersian_InDateTime(Date);
            switch (dt.Month)
            {
                case 1:
                    return "فروردین";
                case 2:
                    return "اردیبهشت";
                case 3:
                    return "خرداد";
                case 4:
                    return "تیر";
                case 5:
                    return "مرداد";
                case 6:
                    return "شهریور";
                case 7:
                    return "مهر";
                case 8:
                    return "آبان";
                case 9:
                    return "آذر";
                case 10:
                    return "دی";
                case 11:
                    return "بهمن";
                case 12:
                    return "اسفند";
                default:
                    return string.Empty;
            }
        }
    }
}