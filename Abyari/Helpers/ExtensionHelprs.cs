using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abyari.Helpers
{
    public static  class ExtensionHelprs
    {
 
        public static int ToInt32(this object s)
        {
            int i;
            if (s != null)
            {
                if (Int32.TryParse(s.ToString(), out i))
                {
                    return i;
                }
            }
                return int.MinValue;
        }
        public static Int64 ToInt64(this object s)
        {
            Int64 i;
            if (s != null)
            {
                if (Int64.TryParse(s.ToString(), out i))
                {
                    return i;
                }
            }
            return int.MinValue;
        }
        //public static DateTime ToPersianDateTime(this DateTime dt)
        //{
        //    return DateConvert.GetPersian_InDateTime((object)dt);
        //}
        /// <summary>
        /// Gets an attribute on an enum field value
        /// </summary>
        /// <typeparam name="T">The type of the attribute you want to retrieve</typeparam>
        /// <param name="enumVal">The enum value</param>
        /// <returns>The attribute of type T that exists on the enum value</returns>
        public static T GetAttributeOfType<T>(this Enum enumVal) where T : System.Attribute
        {
            var type = enumVal.GetType();
            var memInfo = type.GetMember(enumVal.ToString());
            var attributes = memInfo[0].GetCustomAttributes(typeof(T), false);
            return (attributes.Length > 0) ? (T)attributes[0] : null;
        }
    }
}