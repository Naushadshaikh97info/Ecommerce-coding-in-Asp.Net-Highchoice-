using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class checkout : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();                   
    static DataTable dt;
    static int count = 0;
    static int totalvalue;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        if (Session["login"] == "yes")
        {
            fill_account_detail();
            gridfill();
        }
        else
        {
            Response.Redirect("Login_Form.aspx?id=1");
        }

        fill_country();
        fill_country2();

    }
    private void fill_country()
    {
        try
        {
            var id = (from a in linq_obj.country_masters
                      select a).ToList();

            ddl_country_b.DataSource = id;
            ddl_country_b.DataBind();
        }
        catch (Exception)
        {


        }
    }

    private void fill_country2()
    {
        try
        {
            var id = (from a in linq_obj.country_masters
                      select a).ToList();


            ddl_country_s.DataSource = id;
            ddl_country_s.DataBind();
        }
        catch (Exception)
        {


        }
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

                DataTable dtMarks1 = dt.Clone();

                foreach (DataRow dr in dt.Rows)
                {
                    dtMarks1.ImportRow(dr);
                }
                dtMarks1.AcceptChanges();

                DataView dv = dtMarks1.DefaultView;


                grd_shoping.DataSource = dv;
                grd_shoping.DataBind();

                grd_shopingcart.DataSource = dv;
                grd_shopingcart.DataBind();

                
                int total_quantity = 0;
                decimal total_amt = 0;
                decimal finletotal = 0;
                for (int i = 0; i < grd_shoping.Rows.Count; i++)
                {
                    //DropDownList drp = (DropDownList)grd_shoping.Rows[i].FindControl("drpquantity");
                    //total_quantity += Convert.ToInt32(drp.SelectedValue.ToString());
                    total_amt = total_amt + Convert.ToDecimal(grd_shoping.Rows[i].Cells[3].Text.ToString());
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

                    total_amt = Convert.ToDecimal(Session["total_amt"]);

                    total_quantity =  Convert.ToInt32(Session["total_qty"]);
                }
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
    private void fill_account_detail()
    {

        try
        {
            var id = (from a in linq_obj.regist_details
                      where a.email == Session["username"].ToString()
                      select a).Single();
            txt_firstname.Text = id.frist_name;
            txt_lastname.Text = id.last_name;
            txt_emailid.Text = id.email;
            txt_phoneno.Text = id.phone_no;
            txt_nickname_b.Text = id.billing_nick_name;
            txt_firstname_b.Text = id.billing_first_name;
            txt_lastname_b.Text = id.billing_last_name;
            txt_phoneno_b.Text = id.billing_phone_no;
            txt_company_b.Text = id.billing_company;
            // ddl_address_type_b.SelectedItem.Text = id.billing_address_type;
            txt_adrress1_b.Text = id.billing_address1;
            txt_adrress2_b.Text = id.billing_address2;
            //  txt_suite_b.Text = id.billing_suite;
            txt_city_b.Text = id.billing_city;
            //ddl_country_b.SelectedValue = id.billing_country.ToString();
            // fill_billing_state();
            //  ddl_state_b.SelectedValue = id.billing_state.ToString();
            txt_zip_b.Text = id.billing_zip_code;
            txt_nickname_s.Text = id.shipping_nick_name;
            txt_firstname_s.Text = id.shipping_first_name;
            txt_lastname_s.Text = id.shipping_last_name;
            txt_phonene_s.Text = id.shipping_phone_no;
            txt_company_s.Text = id.shipping_company;
            // ddl_address_type_s.SelectedItem.Text = id.shipping_address_type;
            txt_adrress1_s.Text = id.shipping_address1;
            txt_adrress1_s.Text = id.shipping_address2;
            // txt_suite_s.Text = id.shipping_suite;
            txt_city_s.Text = id.shipping_city;
            //  ddl_country_s.SelectedValue = id.shipping_country.ToString();
            // fill_shiping_state();
            //  ddl_state_s.SelectedValue = id.shipping_state.ToString();
            txt_zip_s.Text = id.shipping_zip_code;
        }
        catch (Exception)
        {


        }
    }
    protected void chk_shipping_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_shipping.Checked == true)
        {
            txt_nickname_s.Text = txt_nickname_b.Text;
            txt_firstname_s.Text = txt_firstname_b.Text;
            txt_lastname_s.Text = txt_lastname_b.Text;
            txt_phonene_s.Text = txt_phoneno_b.Text;
            txt_company_s.Text = txt_company_b.Text;
            //ddl_shipping_add_type.SelectedValue = ddl_billing_addresstype.SelectedValue;
            txt_adrress1_s.Text = txt_adrress1_b.Text;
            txt_adrress1_s.Text = txt_adrress2_b.Text;
            //txt_sshipping_suite.Text = txt_billing_suite.Text;
            txt_city_s.Text = txt_city_b.Text;
            ddl_country_s.SelectedValue = ddl_country_b.SelectedValue;
            txt_state_s.Text = txt_state_b.Text;
            txt_zip_s.Text = txt_zip_b.Text;
        }
        else
        {
            txt_nickname_s.Text = "";
            txt_firstname_s.Text = "";
            txt_lastname_s.Text = "";
            txt_phonene_s.Text = "";
            txt_company_s.Text = "";
            //ddl_shipping_add_type.SelectedIndex = 0;
            txt_adrress1_s.Text = "";
            txt_adrress1_s.Text = "";
            //txt_shipping_suite.Text = "";
            txt_city_s.Text = "";
            ddl_country_s.SelectedIndex = 0;
            //ddl_shipping_state.SelectedIndex = 0;
            txt_zip_s.Text = "";
        }
    }

    protected void chk_billing_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_billing.Checked == true)
        {
            txt_firstname_b.Text = txt_firstname.Text;
            txt_lastname_b.Text = txt_lastname.Text;
            txt_phoneno_b.Text = txt_phoneno.Text;
        }
        else
        {
            txt_firstname_b.Text = "";
            txt_lastname_b.Text = "";
            txt_phoneno_b.Text = "";
        }
    }
    protected void btn_continue_checkout_Click(object sender, EventArgs e)
    {
        try
        {
            var id10 = (from a in linq_obj.regist_details
                        where a.email == Session["username"].ToString()
                        select a).Single();
            if (txt_password.Text != "")
            {
                linq_obj.update_regist_detail(id10.intglcode,
                                              txt_firstname.Text,
                                              txt_lastname.Text,
                                              txt_emailid.Text,
                                              txt_phoneno.Text,
                                              txt_password.Text,
                                              txt_nickname_b.Text,
                                              txt_firstname_b.Text,
                                              txt_lastname_b.Text,
                                              txt_phoneno_b.Text,
                                              txt_company_b.Text,
                                              txt_adrress1_b.Text,
                                              txt_adrress2_b.Text,
                                              txt_city_b.Text,
                                              Convert.ToInt32(ddl_country_b.SelectedValue),
                                              txt_state_b.Text,
                                              txt_zip_b.Text,
                                              txt_nickname_s.Text,
                                              txt_firstname_s.Text,
                                              txt_lastname_s.Text,
                                              txt_phonene_s.Text,
                                              txt_company_s.Text,

                                              txt_adrress1_s.Text,
                                              txt_adrress1_s.Text,

                                              txt_city_s.Text,
                                          Convert.ToInt32(ddl_country_b.SelectedValue),
                                            txt_state_s.Text,
                                              txt_zip_s.Text);
                linq_obj.SubmitChanges();
            }
            else
            {
                linq_obj.update_regist_detail(id10.intglcode,
                                           txt_firstname.Text,
                                              txt_lastname.Text,
                                              txt_emailid.Text,
                                              txt_phoneno.Text,
                                            id10.password,
                                              txt_nickname_b.Text,
                                              txt_firstname_b.Text,
                                              txt_lastname_b.Text,
                                              txt_phoneno_b.Text,
                                              txt_company_b.Text,

                                              txt_adrress1_b.Text,
                                              txt_adrress2_b.Text,

                                              txt_city_b.Text,
                                              Convert.ToInt32(ddl_country_b.SelectedValue),
                                             txt_state_b.Text,
                                              txt_zip_b.Text,
                                              txt_nickname_s.Text,
                                              txt_firstname_s.Text,
                                              txt_lastname_s.Text,
                                              txt_phonene_s.Text,
                                              txt_company_s.Text,

                                              txt_adrress1_s.Text,
                                              txt_adrress1_s.Text,

                                              txt_city_s.Text,
                                            Convert.ToInt32(ddl_country_b.SelectedValue),
                                           txt_state_s.Text,
                                              txt_zip_s.Text);
                linq_obj.SubmitChanges();
            }

            int total_quantity = 0;
            decimal total_amt = 0;
            for (int i = 0; i < grd_shoping.Rows.Count; i++)
            {
                total_quantity = total_quantity + Convert.ToInt32(grd_shoping.Rows[i].Cells[2].Text.ToString());
                total_amt = 15 + total_amt + Convert.ToDecimal(grd_shoping.Rows[i].Cells[3].Text.ToString());
                ViewState["total_amt"] = total_amt;
            }
            var id5 = (from a in linq_obj.regist_details
                       where a.email == Session["username"].ToString()
                       select a).ToList();

            Random rnd = new Random();
            int startNumber = rnd.Next(1, 9000);

            string rndno = "os" + startNumber.ToString();

            int y = linq_obj.Insert_order_detail(txt_firstname.Text, txt_adrress1_s.Text, ddl_country_b.SelectedItem.Text, txt_state_b.Text,
                txt_city_b.Text, txt_zip_b.Text, txt_phoneno_b.Text, txt_emailid.Text, Convert.ToDateTime(System.DateTime.Now.ToString()), total_quantity.ToString(), total_amt.ToString(), "PENDING", id5[0].intglcode, id5[0].intglcode, System.DateTime.Now.ToShortDateString(), System.DateTime.Now.Month.ToString(), System.DateTime.Now.Year.ToString(), rndno, "");
            linq_obj.SubmitChanges();

            for (int k = 0; k < dt.Rows.Count; k++)
            {
                linq_obj.Insert_shoping(Convert.ToInt32(dt.Rows[k][5].ToString()), dt.Rows[k][3].ToString(), dt.Rows[k][4].ToString(), Convert.ToInt32(y));
                linq_obj.SubmitChanges();
            }

            var id = (from a in linq_obj.product_masters
                      join b in linq_obj.shopingcarts on a.intGlCode equals b.fk_productcode
                      where b.fk_order == y
                      select new
                      {
                          code = b.fk_productcode,
                          qty = b.quantity,
                      }).ToList();

            for (int i = 0; i < id.Count(); i++)
            {
                var id6 = (from a in linq_obj.product_masters
                           where a.intGlCode == id[i].code
                           select a).Single();

                int totalqty;
                totalqty = Convert.ToInt32(id6.quantity) - Convert.ToInt32(id[i].qty);
                id6.quantity = totalqty.ToString();
                linq_obj.SubmitChanges();
            }

            Session["total_qty"] = null;
            Session["total_amt"] = null;
            dt.Clear();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    var id1 = (from a in linq_obj.emails
                               select a).Single();

                    string emailid = "pintu5881@gmail.com" + "," + txt_emailid.Text;

                    SmtpClient smtpclient;
                    MailMessage message;
                    string str = "<div><center><table><tr><td colspan=2 align='center'><img alt='Highchoices' src='http://highchoices.com/image/logo.png' runat='server'/><hr /> <br/><font size=\"3\">ORDER " + "PENDING" + "</font></td></tr><br/><tr><td width=50%>Hi " + txt_firstname.Text + txt_lastname.Text + "<br />your order no. : " + rndno + "</td><td width=50%>Delivery Address <br>" + txt_adrress1_s.Text + "</td></tr></table></center></div>";
                    smtpclient = new SmtpClient();
                    message = new MailMessage();
                    grd_shopingcart.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    message.From = new MailAddress(id1.email1);
                    message.To.Add(emailid);  //send email to yahoo
                    message.Subject = "Your Highchoices Order: " + rndno;
                    message.Body = str + "ORDER DETAILS:<hr />" + sw.ToString() + "<hr />" + "<div align='right' ><font size=\"3\">Total Amount (Include Delivery charge) : " + lbltotal_amt1.Text + "</font></div><br /><hr /><div>Thank you for shopping with <a href='http://redjinni.com/'>Highchoices.com</a><br />Highchoices Team <br />For any query or assistance, feel free to <a href='http://highchoices.com/contact_us.aspx'>Contact Us</a></div>";
                    message.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "mail.orbitholidays.in";
                    smtp.EnableSsl = false;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                    NetworkCred.UserName = id1.email1;
                    NetworkCred.Password = id1.password;
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 25;
                    smtp.Send(message);
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('**  Your Order has been Placed Successfully  **');window.location='default.aspx';</script>'");

            //Response.Redirect("paymentmethod.aspx?id=" + total_amt);
            //Response.Redirect("paypal.aspx?id=" + Request.QueryString["id"].ToString());
        }
        catch (Exception)
        {

        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void btn_countinu_acccount_Click(object sender, EventArgs e)
    {
        try
        {
            pnl_account.Visible = false;
            pnl_billing_details.Visible = true;
        }
        catch (Exception)
        {


        }
    }
    protected void btn_countinu_billing_Click(object sender, EventArgs e)
    {
        try
        {
            pnl_billing_details.Visible = false;
            pnl_shipping_.Visible = true;
        }
        catch (Exception)
        {

        }
    }
    protected void btn_continue_shipping_Click(object sender, EventArgs e)
    {
        try
        {
            pnl_shipping_.Visible = false;
            pnl_payment.Visible = true;
        }
        catch (Exception)
        {


        }
    }
    protected void btn_continue_payment_method_Click(object sender, EventArgs e)
    {
        try
        {
            pnl_payment.Visible = false;
            pnl_confromorder.Visible = true;
        }
        catch (Exception)
        {

        }
    }

}