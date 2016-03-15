using System;
using System.Data;
using System.Configuration;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using AjaxControlToolkit;

public partial class Product_Discription : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    static DataTable dt;
    static int code = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["addcart"] == null)
        {
            createtable();
        }
        else
        {
            dt = (DataTable)Session["addcart"];
        }
        if (IsPostBack)
            return;
        if (Request.QueryString["id"] != null)
        {
            fill_desc();
            fill_pro_desc();
        }
        if (Session["login"] == "yes")
        {
            fill_review();
        }

        fill_similar_product();
        fill_rating();
        fill_review();
    }
    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {

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
    private void fill_rating()
    {
        var id = (from a in linq_obj.star_msts
                  select a).ToList();
        rb_rating.DataSource = id;
        rb_rating.DataBind();
    }
    private void fill_desc()
    {
        try
        {
            var id = (from a in linq_obj.product_masters
                      join c in linq_obj.Brand_Masters on a.brand equals c.intGlCode
                      join d in linq_obj.color_masters on a.color equals d.intglcode
                      join f in linq_obj.category_masters on a.fk_category_code equals f.intGlCode
                      where a.intGlCode == Convert.ToInt32(Request.QueryString["id"].ToString())

                      select new
                      {
                          code = a.intGlCode,
                          p_name = a.product_name,
                          p_desc = a.description,
                          p_price = a.actual_price,
                          p_price_old = a.old_price,
                          p_sku = a.sku,
                          p_color = d.color_name,
                          p_brand = c.brand_name,
                          p_model = a.model,
                          mainimg1 = "./upload/" + a.main_images,
                          subimg1 = "./upload/" + a.additional_images1,
                          subimg2 = "./upload/" + a.additional_images2,
                          subimg3 = "./upload/" + a.additional_images3,
                          subimg4 = "./upload/" + a.additional_images4,
                          catname = f.category_name,
                          qty = a.quantity,
                          Rating = a.star,
                          review = a.review,
                          total_qty = a.total_qty,
                          freedilivery = a.Free_delivery,
                          Deliverym = a.delivery_charges
                      }).ToList();
            Repeater1.DataSource = id;
            Repeater1.DataBind();
            //lbl_p_name.Text = id[0].p_name;
            //lbl_brand.Text = id[0].p_brand;
            //lbl_color.Text = id[0].p_color;
            //lbl_desc.Text = id[0].p_desc;
            //lbl_model.Text = id[0].p_model;
            //lbl_price.Text = id[0].p_price.ToString();
            //lbl_sku.Text = id[0].p_sku;
            //main_img.Src = id[0].mainimg1;
            //sub_a1.HRef = id[0].subimg1;
            //sub_img1.ImageUrl = id[0].subimg1;
            //A1.HRef = id[0].subimg2;
            //Image1.ImageUrl = id[0].subimg2;
            //A2.HRef = id[0].subimg3;
            //Image2.ImageUrl = id[0].subimg3;
            //A3.HRef = id[0].subimg4;
            //Image3.ImageUrl = id[0].subimg4;
            Label1.Text = id[0].catname;
            Label2.Text = id[0].p_name;
            //zoom1.HRef = id[0].mainimg1;
            //main_img.Src = id[0].mainimg1;
            int total = 0, avg = 0;

            foreach (RepeaterItem item in Repeater1.Items)
            {


                Label instock = item.FindControl("lbl_instock") as Label;
                Label outstock = item.FindControl("lbl_outofstock") as Label;
                LinkButton LinkButton1 = item.FindControl("LinkButton1") as LinkButton;
                Image progressImage = item.FindControl("ProgressImage") as Image;
                Label lbl_p = item.FindControl("lbl_per") as Label;
                System.Web.UI.HtmlControls.HtmlContainerControl message12 = (System.Web.UI.HtmlControls.HtmlContainerControl)item.FindControl("instock");
                System.Web.UI.HtmlControls.HtmlContainerControl message13 = (System.Web.UI.HtmlControls.HtmlContainerControl)item.FindControl("outstock");
                System.Web.UI.WebControls.Label lbl = (System.Web.UI.WebControls.Label)item.FindControl("Label1");
                System.Web.UI.WebControls.Label lbl_free_Delivery = (System.Web.UI.WebControls.Label)item.FindControl("lbl_free_Delivery");
                System.Web.UI.HtmlControls.HtmlContainerControl deliverym = (System.Web.UI.HtmlControls.HtmlContainerControl)item.FindControl("deliverym");

                if (id[0].qty == "0")
                {
                    message12.Visible = false;
                    instock.Visible = false;
                    outstock.Visible = true;
                    LinkButton1.Visible = false;
                }
                else
                {
                    message13.Visible = false;
                    instock.Visible = true;
                    outstock.Visible = false;
                }

                if (lbl.Text == "True")
                {
                    lbl_free_Delivery.Visible = true;

                }
                else if (lbl.Text == "False")
                {
                    lbl_free_Delivery.Visible = false;
                    deliverym.Visible = true;

                }

                total = Convert.ToInt32(id[0].qty);

                avg = total * 100 / Convert.ToInt32(id[0].total_qty);

                int lengthOfProgress = avg;

                progressImage.Width = lengthOfProgress;
                lbl_p.Text = lengthOfProgress.ToString() + "% Sold";
            }
        }
        catch (Exception)
        {

        }
    }
    private void fill_pro_desc()
    {
        try
        {
            var id = (from a in linq_obj.product_masters
                      where a.intGlCode == Convert.ToInt32(Request.QueryString["id"].ToString())
                      select a).ToList();
            lbl_desc.Text = id[0].description;
        }
        catch (Exception)
        {


        }

    }
    private void fill_review()
    {
        try
        {
            var id = (from a in linq_obj.review_msts
                      where a.product_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                      select new
                      {
                          code = a.intglcode,
                          name = a.name,
                          date = a.datetime,
                          review = a.review,
                          Rating = a.rating1

                      }).ToList();
            Repeater3.DataSource = id;
            Repeater3.DataBind();
        }
        catch (Exception)
        {

        }

    }
    private void fill_similar_product()
    {
        try
        {
            var id2 = (from a in linq_obj.product_masters
                       where a.intGlCode == Convert.ToInt32(Request.QueryString["id"].ToString())
                       select a).ToList();

            var id = (from a in linq_obj.product_masters
                      join f in linq_obj.category_masters on a.fk_category_code equals f.intGlCode
                      orderby a.intGlCode descending
                      where a.fk_category_code == id2[0].fk_category_code
                      select new
                      {
                          code = a.intGlCode,
                          p_img = "./upload/" + a.main_images,
                          p_name = a.product_name,
                          p_price = a.actual_price

                      }).Take(10).ToList();

            Repeater2.DataSource = id;
            Repeater2.DataBind();

        }
        catch (Exception ex)
        {


        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {

        try
        {
            linq_obj.insert_review(txt_name.Text, txt_review.Text, Convert.ToInt16(rb_rating.SelectedValue), Convert.ToDateTime(System.DateTime.Now.ToString()), Convert.ToInt32(Request.QueryString["id"].ToString()));
            linq_obj.SubmitChanges();


            var id = (from a in linq_obj.review_msts
                      where a.product_id == Convert.ToInt32(Request.QueryString["id"].ToString())
                      select a).ToList();
            int raj = 0;
            for (int i = 0; i < id.Count(); i++)
            {
                raj = raj + Convert.ToInt32(id[i].rating1);
            }
            int padu = raj / id.Count();

            var id2 = (from a in linq_obj.product_masters
                       where a.intGlCode == Convert.ToInt32(Request.QueryString["id"].ToString())
                       select a).ToList();
            id2[0].review = id.Count();
            id2[0].star = padu;
            linq_obj.SubmitChanges();

            Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Submit Successfully **')</script>");
            txt_name.Text = "";
            txt_review.Text = "";
            rb_rating.SelectedIndex = 0;
        }
        catch (Exception)
        {

        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        try
        {
            string txt = null;

            foreach (RepeaterItem item in Repeater1.Items)
            {
                TextBox box = (TextBox)item.FindControl("txt_qty");
                txt = box.Text;
            }

            var id = (from a in linq_obj.product_masters
                      where a.intGlCode == Convert.ToInt32(Request.QueryString["id"])
                      select a).Single();

            string path = "~/upload/";
            decimal total = Convert.ToDecimal(id.actual_price) * Convert.ToDecimal(txt);
            int total_qty = Convert.ToInt32(txt);
            int flag = 0;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (id.intGlCode == Convert.ToInt32(dt.Rows[i][5].ToString()))
                {
                    total_qty = Convert.ToInt32(txt) + Convert.ToInt32(dt.Rows[i][3].ToString());
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

            Response.Redirect("shoping_cart.aspx", false);

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