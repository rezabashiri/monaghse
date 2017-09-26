using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Abyari.Logic;
using tkv.Utility;
namespace Abyari.ScoringSystem
{
    public partial class uscConfig : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (ViewState["__scorelist"] == null)
                {
                    ViewState["__scorelist"] = new Configuration();
                }
                BindData();
                BindDropDown();
            }
        }
        private void BindData()
        {
            Model.Config _con = new Model.Config();
            _con = _con.GetConfiguration();
            if (_con != null)
            {
                ViewState["__confid"] = _con.ID;
                var config = ViewState["__scorelist"] as Configuration;
                config = config.Deserialize(_con.Scoring);
                txtTime.Text = config.AllowedTime.ToString();
                txtWfName.Text = config.TimeUpStepID;
                ViewState["__scorelist"] = config;
                grdConfig.DataBind();
            }
        }
        private void BindDropDown()
        {
            foreach (var item in Enum.GetValues(typeof(Enums.ScoreType)))
            {
                Enums.ScoreType _item = (Enums.ScoreType)item;
                var desc = _item.GetAttributeOfType<System.ComponentModel.DescriptionAttribute>();
                drpType.Items.Add(new ListItem() { Text = desc.Description, Value = _item.ToString() });
            }
        }
        protected void btkAdd_Click(object sender, EventArgs e)
        {
            var config = ViewState["__scorelist"] as Configuration;
            var sco = (Enums.ScoreType)Enum.Parse(typeof(Enums.ScoreType), drpType.SelectedValue);
            if (!config.ScoreConfigList.Any(x => x.ScoreTypes == sco))
            {
                config.ScoreConfigList.Add(new ScoreSystem() { Score = double.Parse(txtScore.Text), Subject = txtSubject.Text, ScoreTypes = sco });
                grdConfig.Rebind();
            }
        }
        public List<ScoreSystem> GetData()
        {
            var config = ViewState["__scorelist"] as Configuration;
            return config.ScoreConfigList;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Model.Config _entity = new Model.Config();
            var conf = ViewState["__scorelist"] as Configuration;
            conf.AllowedTime = txtTime.Text.ToInt32();
            conf.TimeUpStepID = txtWfName.Text;
            _entity.Scoring = conf.SerializeToXML();
            _entity.ID = ViewState["__confid"] != null ? ViewState["__confid"].ToInt32() : -1;
            _entity.AddUpdate();
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public object frmConfig_GetItem(int id)
        {
            return null;
        }

    }
}