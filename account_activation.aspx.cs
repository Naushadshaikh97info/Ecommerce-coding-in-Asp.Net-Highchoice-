using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class account_activation : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        if (Request.QueryString["id"] != null)
        {
            var id = (from a in linq_obj.regist_details
                      where a.intglcode == Convert.ToInt32(Request.QueryString["id"].ToString())
                      select a).Single();
            if (id.status == "Deactive")
            {
                id.status = "Active";
                linq_obj.SubmitChanges();
            }
        }
    }
}