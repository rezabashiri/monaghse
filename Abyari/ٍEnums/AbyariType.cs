using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
namespace Abyari.Enums
{
   
        public enum AbyariTypes
        {
            [Description("قطره ای")]
            ghatrei,
            [Description("بارانی")]
            barani,
            [Description("کم فشار")]
            kamfeshar,
            [Description("")]
            None
        }
        public enum ScoreType
        {
            [Description("خودیاری")]
            SelfPayment,
            [Description("هیچ کار همزمان")]
            ZeroWork,
            [Description("یک کار همزمان")]
            OneWork,
            [Description("دو کار همزمان")]
            TwoWork,
            [Description("بدهی")]
            Due,
            [Description("سقف امتیاز پروژه های کوچک")]
            SmallHighScore,
            [Description("امتیاز پروژه های کوچک")]
            SmallScore
        }
    
}