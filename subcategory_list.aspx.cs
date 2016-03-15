using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class subcategory_list : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            //fill_baner_image();
            fill_feature_product();
            var id = (from a in linq_obj.category_masters
                      where a.intGlCode == Convert.ToInt32(Request.QueryString["id"].ToString())
                      select a).ToList();
            Label1.Text = id[0].category_name;
            Label2.Text = id[0].category_name;
        }
        else
        {
            Label1.Text = "Product";
            Label2.Text = "Product";
            //fill_feature_product_all();

        }
        if (!IsPostBack)
        {

        }
    }
    private void fill_feature_product()
    {
        try
        {
            var id = (from a in linq_obj.third_sub_cetegories
                      where a.sub_category == Convert.ToInt32(Request.QueryString["id"].ToString()) 
                      select new
                      {
                          code = a.intglcode,
                          p_img = "./upload/" + a.third_cat_img,
                          p_name = a.third_sub_category
                      }).Take(10).ToList();
            GridView1.DataSource = id;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {

        }
    }
    //private void fill_feature_product_all()
    //{
    //    try
    //    {
    //        var id = (from a in linq_obj.category_masters
    //                  select new
    //                  {
    //                      code = a.intGlCode,
    //                      p_img = "./upload/" + a.cat_img,

    //                      p_name = a.category_name
    //                  }).ToList();
    //        GridView1.DataSource = id;
    //        GridView1.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //    }
    //}
    //private void fill_baner_image()
    //{
    //    try
    //    {
    //        var id = (from a in linq_obj.main_category_msts
    //                  where a.intglcode == Convert.ToInt32(Request.QueryString["id"].ToString())
    //                  select new
    //                  {
    //                      code = a.intglcode,
    //                      b_img = "./upload/" + a.banner_image
    //                  }).Single();

    //        Image1.ImageUrl = id.b_img;
    //    }
    //    catch (Exception)
    //    {


    //    }
    //}
}