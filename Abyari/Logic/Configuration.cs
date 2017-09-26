using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Abyari.Enums;
using System.Xml.Serialization;
using tkv.Utility;
namespace Abyari.Logic
{
    [Serializable]
    public class ScoreSystem
    {
        [XmlIgnore()]
        public string ScoreTypeName
        {
            get
            {
                if (ScoreTypes != null)
                {
                    return ScoreTypes.GetAttributeOfType<System.ComponentModel.DescriptionAttribute>().Description;
                }
                return string.Empty;
            }
        }
        public ScoreType ScoreTypes
        {
            get;
            set;
        }
        public string Subject
        {
            get;
            set;
        }
        public double Score
        {
            get;
            set;
        }
    }
    [Serializable]
    public class Configuration
    {
        public Configuration()
        {
            ScoreConfigList = new List<ScoreSystem>();
            AllowedTime = 0;
        }
        public int AllowedTime
        {
            get;
            set;
        }
        
        public List<ScoreSystem> ScoreConfigList
        {
            get;
            set;
        }
        public string TimeUpStepID
        {
            get;
            set;
        }
        public string SerializeToXML()
        {
            var ser = new tkv.Utility.XmlHelper().SerializeEntity<Configuration>(this);
            return ser;
        }
        public Configuration Deserialize(string xml)
        {
            return  new tkv.Utility.XmlHelper().DeserializeEntity<Configuration>(xml,this);
        }
    }
}