using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_Status : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    static int order_no;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        fillgrid();
    }
    protected void fillgrid()
    {
        try
        {
            var id = (from a in linq_obj.order_details
                      join b in linq_obj.regist_details on a.fk_memberid equals b.intglcode
                      where a.fk_memberid == Convert.ToInt32(Session["userid"].ToString())
                      select new
                      {
                          code = a.intglcode,
                          code1 = b.intglcode,
                          order_no = a.ord_no,
                          name = b.frist_name + " " + b.last_name,
                          country = b.billing_country,
                          state = a.state,
                          city = b.billing_city,
                          pincode = b.billing_zip_code,
                          mobile = b.phone_no,
                          email = b.email,
                          date = a.email,
                          quantity = a.total_qty,
                          amount = a.total_amt,
                          status = a.status,
                          pay = a.pincode,
                          datetime = a.to_shoert_date
                      }).ToList();
            grd_shoping.DataSource = id;
            grd_shoping.DataBind();
        }
        catch (Exception)
        {

        }
    }
    protected void onclick_order(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        try
        {
            Panel1.Visible = true;
            LinkButton lnk = (LinkButton)sender;
            int code = Convert.ToInt32(lnk.CommandArgument.ToString());
            order_no = Convert.ToInt32(lnk.CommandArgument.ToString());

            var id = (from a in linq_obj.shopingcarts
                      join b in linq_obj.product_masters on a.fk_productcode equals b.intGlCode
                      where a.fk_order == code
                      select new
                      {
                          code = a.intglcode,
                          productcode = b.sku,
                          product = b.product_name,
                          qty = a.quantity,
                          price = a.total_price,
                          img = "~/upload/" + b.main_images
                      }).ToList();
            grd_shopingcart.DataSource = id;
            grd_shopingcart.DataBind();


            var id5 = (from a in linq_obj.order_details
                       where a.intglcode == code
                       select a).ToList();
            lbl_orderno.Text = id5[0].ord_no;
        }
        catch (Exception)
        {


        }
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("order_history.aspx");
    }
    protected void lnk_order_cancel_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        int code = Convert.ToInt32(lnk.CommandArgument.ToString());

        var id = (from a in linq_obj.order_details
                  where a.intglcode == code
                  select a).ToList();
        if (id[0].status == "PENDING")
        {
            id[0].status = "CANCEL";
            linq_obj.SubmitChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Order Successfulyy Canceled **');window.location='Order_Status.aspx';</script>'");
        }
        else
        {
            Response.Write("<script laguage='javascript'>alert('** You cant cancel this order **')</Script>");
        }
    }
}