using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Abyari.Helpers
{
    public class SMSHelpers
    {
        private const string api = "517A737A6D465A692F3569484E6C53545033426975513D3D";
        private const string sender = "10000400044000";
        string url = "http://abyari-isf.ir";

        public int SendSMS(Dictionary<string, string> MobileName)
        {

            WebUtility.Helpers.SendSMS sms = new WebUtility.Helpers.SendSMS(sender, api);
            int DeliverCount;
            List<WebUtility.Helpers.VerificationStatus> lsm;



            var result = sms.SendToMultiNumber(MobileName, "continue", url);
            DeliverCount = result.Value;
            lsm = result.Key;

            return DeliverCount;
        }

    }
}