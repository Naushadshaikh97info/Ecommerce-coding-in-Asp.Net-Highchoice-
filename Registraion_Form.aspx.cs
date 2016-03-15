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

public partial class Registraion_Form : System.Web.UI.Page
{
    onlineshopingDataContext linq_obj = new onlineshopingDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
            return;
        fill_country();

    }
    private void fill_country()
    {
        try
        {
            var id = (from a in linq_obj.country_masters
                      select a).ToList();
            ddl_country.DataSource = id;
            ddl_country.DataBind();
            ddl_country.Items.Insert(0, "----- Select -----");
        }
        catch (Exception)
        {

        }
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (chk_term.Checked == true)
            {
                var id = (from a in linq_obj.regist_details
                          where a.email == txt_emailid.Text
                          select a).ToList();

                if (id.Count() == 0)
                {
                    linq_obj.insert_regist_detail(txt_firstname.Text, txt_lastname.Text, txt_emailid.Text, txt_phoneno.Text, txt_adrress1.Text, txt_adrress2.Text, txt_city.Text, txt_postcode.Text, Convert.ToInt32(ddl_country.SelectedValue), txt_password.Text, "Yes", chk_term.Checked.ToString(), "Deactive", Convert.ToDateTime(System.DateTime.Now.ToString()), System.DateTime.Now.ToShortDateString());
                    linq_obj.SubmitChanges();

                    using (StringWriter sw = new StringWriter())
                    {
                        using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                        {
                            var id2 = (from a in linq_obj.regist_details
                                       orderby a.intglcode descending
                                       select a).ToList();

                            var id1 = (from a in linq_obj.emails
                                       select a).Single();

                            string emailid = id2[0].email;

                            SmtpClient smtpclient;
                            MailMessage message;
                            string str = "<html><head><title>HighChoices</title></head><body><div><center><table><tr><td align='center'><img alt='HighChoices' src='http://highchoices.com/image/logo.png' runat='server'/></td></tr><tr><td>Welcome To HighChoices! <br /> <br /> URL:http://highchoices.com/ <br /><br>Activation Link" + "&nbsp;" + "http://highchoices.com/Login_Form.aspx?activation=" + id2[0].intglcode + " <br /><br /> Thanks <br />HighChoices</td></tr></table></center></div></form></body></html>";
                            smtpclient = new SmtpClient();
                            message = new MailMessage();
                            StringReader sr = new StringReader(sw.ToString());
                            message.From = new MailAddress(id1.email1);
                            message.To.Add(emailid);  //send email to yahoo
                            message.Subject = "Account Activation";
                            message.Body = str;
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
                    
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('** Please Kindly Check You Junk/Spam Mail Folder To Activate Your Account **');window.location='Default.aspx';</script>'");
                }
                else
                {
                    Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** User Name Alredy Exist Please Enter diffrent Userid **')</script> ");
                }


                //Session["username"] = txt_emailid.Text;
                //Session["login"] = "yes";


                //if (Request.QueryString["id"] != null)
                //{

                //    Response.Redirect("checkout.aspx");

                //}


            }
            else
            {
                Page.RegisterStartupScript("onload", "<script language='javascript'>alert('** Please checked Terms and Conditions **')</script> ");
            }
        }
        catch (Exception)
        {


        }

    }

}