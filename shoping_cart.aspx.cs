using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shoping_basket : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    static DataTable dt;
    static int count = 0;
    static int totalvalue;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        gridfill();
    }
    private void gridfill()
    {
        try
        {
            createtable();  
            count = 0;
            if (dt.Rows.Count != 0)
            {
                grd_shoping.Visible = true;
                grd_shoping.DataSource = dt;
                grd_shoping.DataBind();
                int total_quantity = 0;
                decimal total_amt = 0;
                decimal finletotal = 0;
                for (int i = 0; i < grd_shoping.Rows.Count; i++)
                {
                    DropDownList drp = (DropDownList)grd_shoping.Rows[i].FindControl("drpquantity");
                    total_quantity += Convert.ToInt32(drp.SelectedValue.ToString());
                    total_amt = total_amt + Convert.ToDecimal(grd_shoping.Rows[i].Cells[4].Text.ToString());
                    // lbltotal_qty.Text = total_quantity.ToString();

                    lbltotal_amt.Text = total_amt.ToString();
                    totalvalue = Convert.ToInt32(total_amt);

                    decimal km_price = Convert.ToDecimal(Session["kmprice"]);
                    lbl_delivery_fee.Text = km_price.ToString();

                    finletotal = Convert.ToDecimal(Session["finaltotal"]);
                    lbltotal_amt1.Text = finletotal.ToString();

                    km_price = 15;
                    lbl_delivery_fee.Text = km_price.ToString();

                    finletotal = total_amt + 15;
                    lbltotal_amt1.Text = finletotal.ToString();

                    finletotal = total_amt;
                }
                Session["total_qty"] = total_quantity;
                Session["total_amt"] = total_amt;
            }
            else
            {
                grd_shoping.Visible = false;
            }

        }
        catch (Exception ex)
        {
        }
    }
    private void createtable()
    {
        try
        {
            if (dt == null)
            {
                dt = new DataTable();
                dt.Columns.Add("productimg");
                dt.Columns.Add("productname");
                dt.Columns.Add("actualprice");

                dt.Columns.Add("drpquantity");
                dt.Columns.Add("totalprice");
                dt.Columns.Add("productcode");
                dt = (DataTable)Session["addcart"];
            }
            else
            {
                dt = (DataTable)Session["addcart"];
             
            }

        }
        catch (Exception ex)
        {
        }
    }

    protected void grd_shoping_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            if (dt.Rows.Count != 0)
            {
                dt.Rows.RemoveAt(e.RowIndex);
                Session["addcart"] = dt;
               
                if (dt.Rows.Count == 0)
                {
                    // panMain.Visible = false;
                    Session["total_qty"] = 0;
                    Session["total_amt"] = 0;
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    Response.Redirect("shoping_cart.aspx", false);
                    gridfill();

                }

            }
            if (dt.Rows.Count == 0)
            {
                createtable();
                grd_shoping.Visible = false;
            }
            else
            {
                gridfill();
                grd_shoping.Visible = true;
            }


            linq_obj.delete_shoping(Convert.ToInt32(grd_shoping.DataKeys[e.RowIndex].Value.ToString()));
            linq_obj.SubmitChanges();

        }
        catch (Exception ex)
        {

        }

    }
    protected void drpquantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < grd_shoping.Rows.Count; i++)
            {
                DropDownList drp = (DropDownList)grd_shoping.Rows[i].FindControl("drpquantity");
                int drp_t = Convert.ToInt32(drp.Text.ToString());
                decimal actual_price = Convert.ToDecimal(grd_shoping.Rows[i].Cells[2].Text.ToString());
                decimal total = Convert.ToDecimal(actual_price) * Convert.ToInt32(drp_t);
                total = Math.Round(total, 2);
                dt.Rows[i][4] = total.ToString();
                dt.Rows[i][3] = drp.Text.ToString();
            }
            count = 0;
            gridfill();
            Response.Redirect("shoping_cart.aspx");
        }
        catch (Exception ex)
        {

        }
    }
    protected void grd_shoping_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList drp = (DropDownList)e.Row.FindControl("drpquantity");
                drp.SelectedValue = dt.Rows[count][3].ToString();
                count++;

                // e.Row.Cells[6].Attributes.Add("onclientclick", "Are You Sure You Want to Delete This Record");
            }

        }
        catch (Exception ex)
        {
        }
    }
    protected void lnk_chekout_Click(object sender, EventArgs e)
    {
        decimal total_amt = 0;
        decimal total_quantity = 0;

        total_amt = Convert.ToInt32(Session["total_amt"]);

        total_quantity = Convert.ToInt32(Session["total_qty"]);

        Session["addcart"] = dt;

        Response.Redirect("checkout.aspx", false);
    }
}