using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search_product : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    private int PageSize = 9;
    static DataTable dt;
    static int code = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        if (Session["addcart"] == null)
        {
            createtable();
        }
        else
        {
            dt = (DataTable)Session["addcart"];
        }
        if (Request.QueryString["id"] != null)
        {
            fill_feature_product();
        }
    }
    private void createtable()
    {
        try
        {
            dt = new DataTable();
            dt.Columns.Add("productimg");
            dt.Columns.Add("productname");
            dt.Columns.Add("actualprice");

            dt.Columns.Add("drpquantity");
            dt.Columns.Add("totalprice");
            dt.Columns.Add("productcode");
        }
        catch (Exception ex)
        {

        }
    }
    private void fill_feature_product()
    {
        try
        {
            var id = (from a in linq_obj.product_masters
                      where a.product_name == Request.QueryString["id"].ToString()
                      select new
                      {
                          code = a.intGlCode,
                          p_img = "./upload/" + a.main_images,
                          p_name = a.product_name,
                          p_price = a.actual_price

                      }).ToList();
            GridView1.DataSource = id;
            GridView1.DataBind();
            Label2.Text = Request.QueryString["id"].ToString();
            Label1.Text = Request.QueryString["id"].ToString();
        }
        catch (Exception ex)
        {
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton link = (LinkButton)sender;
            int code = Convert.ToInt32(link.CommandArgument.ToString());
            var id = (from a in linq_obj.product_masters
                      where a.intGlCode == code
                      select a).Single();
            string path = "~/upload/";
            decimal total = Convert.ToDecimal(id.actual_price);
            int total_qty = 1;
            int flag = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (id.intGlCode == Convert.ToInt32(dt.Rows[i][5].ToString()))
                {
                    total_qty = 1 + Convert.ToInt32(dt.Rows[i][3].ToString());
                    total = Convert.ToDecimal(id.actual_price) * Convert.ToDecimal(total_qty);
                    dt.Rows[i][3] = total_qty.ToString();
                    dt.Rows[i][4] = total.ToString();
                    flag = 1;
                    break;
                }
            }
            if (flag == 0)
            {
                dt.Rows.Add(path + id.main_images, id.product_name, id.actual_price, total_qty, total, id.intGlCode);
            }
            Session["addcart"] = dt;

            //if (Session["login"] == "yes")
            //{
            Response.Redirect("customer_basket.aspx", false);
            //}
            //else
            //{
            //    Response.Redirect("user_login.aspx?id=1");
            //}
        }
        catch (Exception)
        {
            
            
        }
    }
}