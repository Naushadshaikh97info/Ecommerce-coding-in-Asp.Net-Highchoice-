using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products_List : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    private int PageSize = 9;
    static DataTable dt;
    static int code = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            var id = (from a in linq_obj.third_sub_cetegories
                      join b in linq_obj.main_category_msts on a.main_category equals b.intglcode
                      join c in linq_obj.category_masters on a.sub_category equals c.intGlCode
                      where a.intglcode == Convert.ToInt32(Request.QueryString["id"].ToString())
                      select new
                      {
                          category_name = a.third_sub_category,
                          sub_category = c.category_name,
                          main_cate = b.main_cate
                      }).ToList();
            Label1.Text = id[0].main_cate;
            Label3.Text = id[0].category_name;
            Label2.Text = id[0].sub_category;
            //this.fill_product(0);
            fill_feature_product();
            //fill_baner_image();
        }
        if (Session["addcart"] == null)
        {
            createtable();
        }
        else
        {
            dt = (DataTable)Session["addcart"];
        }
        if (!IsPostBack)
        {

        }
    }
    private void fill_feature_product()
    {
        try
        {
            var id = (from a in linq_obj.product_masters
                      where a.fk_Third_sub_category_code == Convert.ToInt32(Request.QueryString["id"].ToString())
                      orderby a.intGlCode descending    
                      select new
                      {
                          code = a.intGlCode,
                          p_img = "./upload/" + a.main_images,
                          p_name = a.product_name,  
                          p_price = a.actual_price  
                      }).Take(25).ToList();
            GridView1.DataSource = id;
            GridView1.DataBind();

        }
        catch (Exception ex)
        {


        }
    }
    //private void fill_baner_image()
    //{
    //    try
    //    {
    //        var id = (from a in linq_obj.category_masters
    //                  where a.intGlCode == Convert.ToInt32(Request.QueryString["id"].ToString())
    //                  select new
    //                  {
    //                      code = a.intGlCode,
    //                      b_img = "./upload/" + a.banner_image
    //                  }).Single();

    //        Image1.ImageUrl = id.b_img;
    //    }
    //    catch (Exception)
    //    {
            
            
    //    }
    //}
    //private void fill_product(int pageIndex)
    //{
    //    try
    //    {
    //        var id = (from a in linq_obj.product_masters
    //                  where a.fk_category_code == Convert.ToInt32(Request.QueryString["id"].ToString())
    //                  select new
    //                  {
    //                      code = a.intGlCode,
    //                      p_img = "./upload/" + a.main_images,
    //                      p_name = a.product_name,
    //                      p_price = a.actual_price

    //                  }).ToList();


    //        int totalRecords = id.Count();
    //        int pageSize = 9;
    //        int startRow = pageIndex * pageSize;

    //        Repeater1.DataSource = id.Skip(startRow).Take(pageSize);
    //        Repeater1.DataBind();
    //        int recordCount = id.Count();
    //        this.PopulatePager(recordCount, pageIndex);
    //    }
    //    catch (Exception ex)
    //    {


    //    }
    //}
    //private void PopulatePager(int recordCount, int currentPage)
    //{
    //    double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(PageSize));
    //    int pageCount = (int)Math.Ceiling(dblPageCount);
    //    List<ListItem> pages = new List<ListItem>();
    //    if (pageCount > 0)
    //    {
    //        for (int i = 1; i <= pageCount; i++)
    //        {
    //            pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
    //        }
    //    }
    //    rptPager.DataSource = pages;
    //    rptPager.DataBind();
    //}

    //protected void Page_Changed(object sender, EventArgs e)
    //{

    //    int pageIndex = Convert.ToInt32(((sender as LinkButton).CommandArgument));
    //    fill_product(pageIndex - 1);

    //}
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
}