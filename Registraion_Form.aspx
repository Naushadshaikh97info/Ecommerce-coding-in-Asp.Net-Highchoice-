<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registraion_Form.aspx.cs" Inherits="Registraion_Form" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <!--Breadcrumb Part Start-->
        <div class="breadcrumb"><a style="color: #333333; font-size: 12px;" href="Default.aspx">Home</a> <a style="color: #333333; font-size: 12px;">»</a> <a style="color: #333333; font-size: 12px;" href="#">Account</a><a style="color: #333333; font-size: 12px;"> » </a><a style="color: #333333; font-size: 12px;" href="#">Register</a> </div>
        <!--Breadcrumb Part End-->
        <h1>Register Account</h1>
        <div enctype="multipart/form-data" method="post" action="">
            <h2>Your Personal Details</h2>
            <div class="content">
                <table class="form">
                    <tbody>
                        <tr>
                            <td><span class="required">*</span> First Name:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_firstname" class="large-field" runat="server"></asp:TextBox></td>
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter First Name"
                                    ControlToValidate="txt_firstname" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td><span class="required">*</span> Last Name:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_lastname" class="large-field" runat="server"></asp:TextBox></td>
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Last Name"
                                    ControlToValidate="txt_lastname" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td><span class="required">*</span> E-Mail:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_emailid" class="large-field" runat="server"></asp:TextBox></td>
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Email Address"
                                    ControlToValidate="txt_emailid" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="Enter Proper Email ID" ControlToValidate="txt_emailid" ValidationGroup="btnsubmit" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>

                            
                        </tr>
                        <tr>
                            <td><span class="required">*</span> Phoneno:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_phoneno" class="large-field" MaxLength="15" runat="server"></asp:TextBox></td>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txt_phoneno" FilterType="Numbers">
                            </cc1:FilteredTextBoxExtender>
                           
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Enter Phone No"
                                    ControlToValidate="txt_phoneno" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter 10 To 15 Digit Mobile No"
                                    ControlToValidate="txt_phoneno" ValidationGroup="btnsubmit" ValidationExpression="^[0-9]{10,15}$"></asp:RegularExpressionValidator>
                                
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <h2>Your Address</h2>
            <div class="content">
                <table class="form">
                    <tbody>

                        <tr>
                            <td><span class="required">*</span>Address 1:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_adrress1" class="large-field" runat="server"></asp:TextBox></td>

                            <td style="color: red">

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Address 1"
                                    ControlToValidate="txt_adrress1" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td><span class="required">*</span>Address 2:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_adrress2" class="large-field" runat="server"></asp:TextBox></td>
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Address 2"
                                    ControlToValidate="txt_adrress2" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td><span class="required">*</span> City:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_city" class="large-field" runat="server"></asp:TextBox></td>
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter City"
                                    ControlToValidate="txt_city" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                            </td>

                        </tr>
                        <tr>
                            <td><span class="required">*</span> Post Code:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_postcode" class="large-field" runat="server"></asp:TextBox></td>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txt_postcode" FilterType="Numbers">
                            </cc1:FilteredTextBoxExtender>
                             <td style="color: red">
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Enter Post Code"
                                    ControlToValidate="txt_postcode" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please Enter 6 Digit Post Code"
                                    ControlToValidate="txt_postcode" ValidationGroup="btnsubmit" ValidationExpression="^[0-9]{6}$"></asp:RegularExpressionValidator>
                            </td>

                        </tr>
                        <tr>
                            <td><span class="required">*</span> Country:</td>
                            <td style="width: 94px;">
                                <asp:DropDownList ID="ddl_country" class="large-field" DataTextField="country_name" DataValueField="intglcode" runat="server"></asp:DropDownList></td>
                            
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Select Country"
                                    ControlToValidate="ddl_country" InitialValue="----- Select -----" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <h2>Your Password</h2>
            <div class="content">
                <table class="form">
                    <tbody>
                        <tr>
                            <td><span class="required">*</span> Password:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_password" class="large-field" TextMode="Password" runat="server"></asp:TextBox></td>
                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Password"
                                    ControlToValidate="txt_password" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password length must be between 6 to 80 characters"
                                    ControlToValidate="txt_password" ValidationGroup="btnsubmit" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,80}$"></asp:RegularExpressionValidator>

                            </td>
                           
                        </tr>
                        <tr>
                            <td><span class="required">*</span> Confirm Password:</td>
                            <td style="width: 94px;">
                                <asp:TextBox ID="txt_confrompassword" class="large-field" TextMode="Password" runat="server"></asp:TextBox></td>

                            <td style="color: red">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Enter Confirm Password"
                                    ControlToValidate="txt_confrompassword" ValidationGroup="btnsubmit">*</asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" Text="Password does not match"
                                ControlToCompare="txt_password" ControlToValidate="txt_confrompassword" ValidationGroup="btnsubmit"></asp:CompareValidator>
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
            <%-- <h2>Newsletter</h2>
            <div class="content">
                <table class="form">
                    <tbody>
                        <tr>
                            <td><span class="required">*</span> Subscribe:</td>
                            <td>
                                <asp:RadioButtonList ID="rb_subscribe" runat="server">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:RadioButtonList></td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="None" runat="server" ErrorMessage="Please Select Subscribe"
                                ControlToValidate="rb_subscribe" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                        </tr>
                    </tbody>
                </table>
            </div>--%>
            <div class="buttons">
                <div class="left">
                    I agree with terms and condition & <a alt="Privacy Policy" class="colorbox cboxElement"><b>Privacy Policy</b></a>
                    <asp:CheckBox ID="chk_term" runat="server"></asp:CheckBox>
                    <asp:Button ID="btn_submit" class="button" runat="server" ValidationGroup="btnsubmit" OnClick="btn_submit_Click" Text="Submit"></asp:Button>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="btnsubmit" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

