using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abyari.Helpers
{
    public class Config
    {
        private static string title = "سامانه کنترل محتوای مرورگران";
        public static string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }
        private static string keyboard = "cms,moroorgaran,viralme,مرورگران,مدیریت محتوا";
        public static string KeyBoard
        {
            get
            {
                return keyboard;
            }
            set
            {
                keyboard = value;
            }
        }
        private static string description = "سامانه کنترل محتوای  مرورگران به صورت کاملا بومی  توسط متخصصین شرکت مرورگران توسعه پیدا نموده است ";
        public static string Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }
    }
}