using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abyari.Model
{
    public class ExcelDataType :IConvertible
    {
        public string Name
        {
            get;
            set;
        }
        public string CodeMeli
        {
            get;
            set;
        }
        public string Code
        {
            get;
            set;
        }
        public string Shahrestan
        {
            get;
            set;
        }
        public string Noe
        {
            get;
            set;
        }
        public double Sath
        {
            get;
            set;
        }
        public double SahmeDolat
        {
            get;
            set;
        }
        public double SahmeBank
        {
            get;
            set;
        }
        public double SahmeMotaghazi
        {
            get;
            set;
        }
        public string Tel
        {
            get;
            set;
        }
        public string TelCode
        {
            get;
            set;
        }
        public string Mobile
        {
            get;
            set;
        }
        public IEnumerable<ExcelDataType> CreateList(System.Data.DataTable dt)
        {
            List<ExcelDataType> retval = new List<ExcelDataType>();
            foreach (System.Data.DataRow dr in dt.Rows)
            {
                if (dt.Rows.IndexOf(dr) == 0)
                    continue;
                retval.Add(new ExcelDataType() { Name = dr[0] as string, CodeMeli = dr[1] as string, Code = dr[2] as string, Shahrestan = dr[3] as string, Noe = dr[4] as string, Sath = dr[5].GetType() == typeof(System.DBNull) ? 0 : (double)dr[5],
                    SahmeDolat = dr[6].GetType() == typeof(DBNull) ? 0 : (double)dr[6], SahmeBank = dr[7].GetType() ==  typeof(DBNull) ? 0 : (double)dr[7], SahmeMotaghazi = dr[8].GetType() == typeof(DBNull) ? 0 : (double)dr[8], Tel = dr[9] as string, TelCode = dr[10] as string, Mobile = dr[11] as string });
            }
            return retval;
        }



        public TypeCode GetTypeCode()
        {
            throw new NotImplementedException();
        }

        public bool ToBoolean(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public byte ToByte(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public char ToChar(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public DateTime ToDateTime(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public decimal ToDecimal(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public double ToDouble(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public short ToInt16(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public int ToInt32(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public long ToInt64(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public sbyte ToSByte(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public float ToSingle(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public string ToString(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public object ToType(Type conversionType, IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public ushort ToUInt16(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public uint ToUInt32(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }

        public ulong ToUInt64(IFormatProvider provider)
        {
            throw new NotImplementedException();
        }
    }
}