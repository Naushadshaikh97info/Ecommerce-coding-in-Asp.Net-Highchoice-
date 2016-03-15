<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <!--Breadcrumb Part Start-->
        <div class="breadcrumb"><a style="color: #333333; font-size: 12px;" href="Default.aspx">Home</a><a style="color: #333333; font-size: 12px;"> » </a><a style="color: #333333; font-size: 12px;" href="">Shopping Cart</a></div>
        <!--Breadcrumb Part End-->
        <h1>Checkout</h1>
        <%--<div class="checkout">
            <div class="checkout-heading">Step 1: Checkout Options</div>
            <div class="checkout-content" style="display: block;">
                <div class="left">
                    <h2>New Customer</h2>
                    <p>Checkout Options:</p>
                    <label for="register">
                        <input type="radio" checked="checked" id="register" value="register" name="account">
                        <b>Register Account</b></label>
                    <br>
                    <label for="guest">
                        <input type="radio" id="guest" value="guest" name="account">
                        <b>Guest Checkout</b></label>
                    <br>
                    <br>
                    <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
                    <input type="button" class="button" id="button-account" value="Continue">
                    <br>
                    <br>
                </div>
                <div class="right" id="login">
                    <h2>Returning Customer</h2>
                    <p>I am a returning customer</p>
                    <b>E-Mail:</b><br>
                    <input type="text" value="" name="email">
                    <br>
                    <br>
                    <b>Password:</b><br>
                    <input type="password" value="" name="password">
                    <br>
                    <a href="#">Forgotten Password</a><br>
                    <br>
                    <input type="button" class="button" id="button-login" value="Login">
                    <br>
                    <br>
                </div>
            </div>
        </div>--%>

        <div class="checkout">

            <div id="account" class="checkout-heading">Step 1: ACCOUNT & CONTACT DETAILS</div>

            <asp:Panel ID="pnl_account" runat="server">
                <div class="checkout-content" style="display: block;">

                    <table class="form">
                        <tbody>
                            <tr>
                                <td><span class="required">*</span> First Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_firstname" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Last Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_lastname" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Email ID:</td>
                                <td>
                                    <asp:TextBox ID="txt_emailid" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Password:</td>
                                <td>
                                    <asp:TextBox ID="txt_password" TextMode="Password" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Confirm Password:</td>
                                <td>
                                    <asp:TextBox ID="txt_confrompassword" TextMode="Password" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> PhoneNo:</td>
                                <td>
                                    <asp:TextBox ID="txt_phoneno" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>


                        </tbody>
                    </table>

                    <div class="buttons">
                        <div class="right">


                            <asp:Button ID="btn_countinu_acccount" runat="server" OnClick="btn_countinu_acccount_Click" class="button" Text="Continue"></asp:Button>


                        </div>
                    </div>

                </div>
            </asp:Panel>



        </div>

        <div class="checkout">
            <div class="checkout-heading">
                Step 2: BILLING DETAILS  &nbsp;&nbsp;&nbsp;  <a style="margin-left: 549px; font-size: 15px;">
                    <asp:CheckBox ID="chk_billing" Text=" Same as Above " runat="server" AutoPostBack="True" OnCheckedChanged="chk_billing_CheckedChanged" />
                </a>
            </div>
            <asp:Panel ID="pnl_billing_details" Visible="false" runat="server">
                <div class="checkout-content" style="display: block;">

                    <table class="form">
                        <tbody>
                            <tr>
                                <td><span class="required">*</span> Nick Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_nickname_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> First Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_firstname_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Last Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_lastname_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Phone:</td>
                                <td>
                                    <asp:TextBox ID="txt_phoneno_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td><span class="required">*</span> Company:</td>
                                <td>
                                    <asp:TextBox ID="txt_company_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <%--<tr>
                                <td><span class="required">*</span> Address Type:</td>
                                <td>
                                    <asp:DropDownList ID="ddl_address_type_b" class="large-field" runat="server">
                                        <asp:ListItem>Residential</asp:ListItem>
                                        <asp:ListItem>Light Bill</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>--%>
                            <tr>
                                <td><span class="required">*</span> Address 1:</td>
                                <td>
                                    <asp:TextBox ID="txt_adrress1_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Address 2:</td>
                                <td>
                                    <asp:TextBox ID="txt_adrress2_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <%--<tr>
                                <td><span class="required" id="Span1">*</span> Suite :</td>
                                <td>
                                    <asp:TextBox ID="txt_suite_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>--%>
                            <tr>
                                <td><span class="required" id="Span2">*</span> City :</td>
                                <td>
                                    <asp:TextBox ID="txt_city_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required" id="Span3">*</span> Country  :</td>
                                <td>
                                    <asp:DropDownList ID="ddl_country_b" runat="server" class="large-field" DataTextField="country_name" DataValueField="intglcode"></asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td><span class="required" id="Span4">*</span> State/Province  :</td>
                                <td>

                                    <asp:TextBox ID="txt_state_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required" id="Span5">*</span> Zip :</td>
                                <td>
                                    <asp:TextBox ID="txt_zip_b" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="buttons">
                        <div class="right">
                            <asp:Button ID="btn_countinu_billing" runat="server" OnClick="btn_countinu_billing_Click" class="button" Text="Continue"></asp:Button>
                        </div>
                    </div>

                </div>
            </asp:Panel>
        </div>
        <div class="checkout">
            <div class="checkout-heading">
                Step 3: SHIPPING DETAILS  <a style="margin-left: 549px; font-size: 15px;">
                    <asp:CheckBox ID="chk_shipping" Text=" Same as Billing " runat="server" AutoPostBack="True" OnCheckedChanged="chk_shipping_CheckedChanged" />
                </a>
            </div>
            <asp:Panel ID="pnl_shipping_" Visible="false" runat="server">
                <div class="checkout-content" style="display: block;">

                    <table class="form">
                        <tbody>
                            <tr>
                                <td><span class="required">*</span> Nick Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_nickname_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> First Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_firstname_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Last Name:</td>
                                <td>
                                    <asp:TextBox ID="txt_lastname_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required">*</span> Phoneno:</td>
                                <td>
                                    <asp:TextBox ID="txt_phonene_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>

                            <tr>
                                <td><span class="required">*</span> Company:</td>
                                <td>
                                    <asp:TextBox ID="txt_company_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <%--<tr>
                                <td><span class="required">*</span> Address Type:</td>
                                <td>
                                    <asp:DropDownList ID="ddl_address_type_s" class="large-field" runat="server">
                                        <asp:ListItem>Residential</asp:ListItem>
                                        <asp:ListItem>Light Bill</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>--%>
                            <tr>
                                <td><span class="required">*</span> Address 1:</td>
                                <td>
                                    <asp:TextBox ID="txt_adrress1_s" class="large-field" runat="server"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Shipping Address" ControlToValidate="txt_adrress1_s" ValidationGroup="contact" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </tr>
                            <%-- <tr>
                                <td><span class="required">*</span> Address 2:</td>
                                <td>
                                    <asp:TextBox ID="txt_adrress2_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>--%>
                            <%--   <tr>
                                <td><span class="required" id="Span10">*</span> Suite :</td>
                                <td>
                                    <asp:TextBox ID="txt_suite_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>--%>
                            <tr>
                                <td><span class="required" id="Span6">*</span> City :</td>
                                <td>
                                    <asp:TextBox ID="txt_city_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required" id="Span7">*</span> Country  :</td>
                                <td>
                                    <asp:DropDownList ID="ddl_country_s" runat="server" class="large-field" DataTextField="country_name" DataValueField="intglcode"></asp:DropDownList></td>

                            </tr>
                            <tr>
                                <td><span class="required" id="Span8">*</span> State/Province  :</td>
                                <td>
                                    <asp:TextBox ID="txt_state_s" class="large-field" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><span class="required" id="Span9">*</span> Zip :</td>
                                <td>
                                    <asp:TextBox ID="txt_zip_s" class="large-field" runat="server"></asp:TextBox></td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Zip Code" ControlToValidate="txt_zip_s" ValidationGroup="contact" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </tr>
                        </tbody>
                    </table>

                    <div class="buttons">
                        <div class="right">
                            <asp:Button ID="btn_continue_shipping" runat="server" OnClick="btn_continue_shipping_Click" class="button" ValidationGroup="contact" Text="Continue"></asp:Button>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="contact" ShowMessageBox="true" ShowSummary="false" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>

        <div class="checkout">
            <div class="checkout-heading">Step 4: Payment Method</div>
            <asp:Panel ID="pnl_payment" Visible="false" runat="server">
                <div class="checkout-content" style="display: block;">

                    <p>Please select the preferred payment method to use on this order.</p>

                    <table class="radio">
                        <tbody>
                            <tr class="highlight">
                                <td>
                                    <label>
                                        <input type="radio" checked="checked" id="Radio2" value="" name="payment_method">
                                        Cash On Delivery</label></td>
                            </tr>
                            <tr class="highlight">
                                <td>
                                    <label>
                                        <input type="radio" checked="checked" id="Radio3" value="" name="payment_method">
                                        PayPal</label></td>
                            </tr>
                        </tbody>
                    </table>


                    <br>
                    <div class="buttons">
                        <div class="right">
                            I have read and agree to the <a alt="Terms &amp; Conditions" href="#"><b>Terms &amp; Conditions</b></a>
                            <asp:CheckBox ID="chk_term_condition" runat="server"></asp:CheckBox>
                            <asp:Button ID="btn_continue_payment_method" OnClick="btn_continue_payment_method_Click" class="button" runat="server" Text="Continue"></asp:Button>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div class="checkout">
            <div class="checkout-heading">Step 5: Confirm Order</div>
            <asp:Panel ID="pnl_confromorder" Visible="false" runat="server">
                <div class="checkout-content" style="display: block;">
                    <div class="checkout-product">
                        <asp:GridView ID="grd_shoping" runat="server" DataKeyNames="productcode" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="10" Width="100%" OnRowDataBound="grd_shoping_RowDataBound"
                            GridLines="None" ShowHeader="false">
                            <Columns>
                                <asp:BoundField DataField="productname" ItemStyle-CssClass="name" HeaderText="Product Name" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="28%" />
                                <asp:BoundField DataField="actualprice" ItemStyle-CssClass="model" HeaderText="Actual Price" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="27%" />
                                <asp:BoundField DataField="drpquantity" ItemStyle-CssClass="quantity" HeaderText="Actual Price" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="15%" />
                                <asp:BoundField DataField="totalprice" HeaderText="Total Price" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="total" />
                            </Columns>
                        </asp:GridView>
                        <table>


                            <tfoot>
                                <%-- <tr>
                                    <td class="price" colspan="4"><b>Sub-Total:</b></td>
                                    <td class="total">£51.11</td>
                                </tr>
                                <tr>
                                    <td class="price" colspan="4"><b>Flat Shipping Rate:</b></td>
                                    <td class="total">£3.19</td>
                                </tr>--%>
                                <tr>
                                    <td class="total">Sub Total : र<asp:Label ID="lbltotal_amt" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="total">Delivery  Charge : र<asp:Label ID="lbl_delivery_fee" runat="server" Text=""></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="total">Total : र<asp:Label ID="lbltotal_amt1" runat="server" Text=""></asp:Label></td>
                                </tr>
                            </tfoot>
                        </table>

                    </div>
                    <div class="buttons">
                        <div class="right">
                            <asp:Button ID="Button1" runat="server" OnClick="btn_continue_checkout_Click" class="button" Text="Confirm Order"></asp:Button>
                        </div>
                    </div>
                    <asp:Panel ID="pnl_shoping_cart" runat="server" Visible="false">
                        <asp:GridView ID="grd_shopingcart" AllowPaging="true" AutoGenerateColumns="false"
                            DataKeyNames="productcode" runat="server" Width="100%" GridLines="None">
                            <Columns>
                                <asp:BoundField HeaderText="Product Name" DataField="productname" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Font-Bold="false" />
                                <asp:BoundField HeaderText="Actual Price" DataField="actualprice" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Font-Bold="false" />
                                <asp:BoundField HeaderText="Quantity" DataField="drpquantity" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Font-Bold="false" />
                                <asp:BoundField HeaderText="Price" DataField="totalprice" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Font-Bold="false" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

