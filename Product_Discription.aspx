<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product_Discription.aspx.cs" Inherits="Product_Discription" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .ratingEmpty {
            background-image: url(./ratingStarEmpty.gif);
            width: 18px;
            height: 18px;
        }

        .ratingFilled {
            background-image: url(./ratingStarFilled.gif);
            width: 18px;
            height: 18px;
        }

        .ratingSaved {
            background-image: url(./ratingStarSaved.gif);
            width: 18px;
            height: 18px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">

        <!--Breadcrumb Part Start-->
        <div class="breadcrumb">
            <a href="Default.aspx" style="color: #333333; font-size: 12px;">Home</a> <a style="color: #333333; font-size: 12px;">»</a> <a href="#" style="color: #333333; font-size: 12px;">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></a> <a style="color: #333333; font-size: 12px;">»</a>  <a style="color: #333333; font-size: 12px;" href="#">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
        </div>
        <!--Breadcrumb Part End-->
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="product-info">
                    <div class="left">
                        <div class="image">
                            <a href='<%#Eval("mainimg1") %>' title="#" class="cloud-zoom colorbox" id='zoom1' rel="adjustX: 0, adjustY:0, tint:'#000000',tintOpacity:0.2, zoomWidth:360, position:'inside', showTitle:false">
                                <img src='<%#Eval("mainimg1") %>' title="#" alt="#" id="main_img" style="height: 350px; width: 350px" /><span id="zoom-image"><i class="zoom_bttn"></i> Zoom</span></a>
                        </div>
                        <div class="image-additional">

                            <a id="sub_a1" href='<%#Eval("subimg1") %>' title="#" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<%#Eval("subimg1") %>' ">
                                <img src='<%#Eval("subimg1") %>' width="62" title="#" alt="#" /></a>
                            <a id="A1" href='<%#Eval("subimg2") %>' title="#" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<%#Eval("subimg2") %>' ">
                                <img src='<%#Eval("subimg2") %>' width="62" title="#" alt="#" />
                            </a><a id="A2" href='<%#Eval("subimg3") %>' title="#" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<%#Eval("subimg3") %>' ">
                                <img src='<%#Eval("subimg3") %>' width="62" title="#" alt="#" /></a>
                            <a id="A3" href='<%#Eval("subimg4") %>' title="#" class="cloud-zoom-gallery" rel="useZoom: 'zoom1', smallImage: '<%#Eval("subimg4") %>' ">
                                <img src='<%#Eval("subimg4") %>' width="62" title="#" alt="#" /></a>
                        </div>
                    </div>
                    <div class="right">
                        <h1 class="page_title">
                            <asp:Label ID="lbl_p_name" runat="server" Text='<%#Eval("p_name") %>'></asp:Label></h1>
                        <div class="description">
                            <span>Brand:</span>  <a>
                                <asp:Label ID="lbl_brand" Font-Bold="false" runat="server" Text='<%#Eval("p_brand") %>'></asp:Label></a><br>
                            <span>Product Code:</span>
                            <asp:Label ID="lbl_sku" Font-Bold="false" runat="server" Text='<%#Eval("p_sku") %>'></asp:Label><br>
                            <span>Colors: </span>
                            <asp:Label ID="lbl_color" Font-Bold="false" runat="server" Text='<%#Eval("p_color") %>'></asp:Label><br>
                            <span>Model: </span>
                            <asp:Label ID="lbl_model" Font-Bold="false" runat="server" Text='<%#Eval("p_model") %>'></asp:Label><br>

                            <div id="instock" runat="server">
                                <span>Availability:</span><asp:Label ID="lbl_instock" Font-Bold="false" runat="server" Text="In Stock"></asp:Label>
                            </div>

                            <div id="outstock" runat="server">
                                <span>Availability:</span><asp:Label ID="lbl_outofstock" Font-Bold="false" runat="server" Text="In Stock"></asp:Label>
                            </div>
                        </div>
                        <div class="price">
                            Price: <span class="price-old">र     
                                <asp:Label ID="lbl_old" runat="server" Text='<%#Eval("p_price_old") %>'></asp:Label>
                            </span>
                            <div class="price-tag">
                                र
                        <asp:Label ID="lbl_price" runat="server" Text='<%#Eval("p_price") %>'></asp:Label>
                            </div>
                            <br>
                        </div>
                        <div class="cart">
                            <div>

                                <div class="qty" style="float: left;">
                                    <strong>Qty:</strong>
                                    <asp:TextBox ID="txt_qty" runat="server" type="text" value="1" size="2" name="quantity" class="w30"></asp:TextBox>
                                    &nbsp;&nbsp; 
                                    <div class="clear"></div>
                                </div>
                                <div class="qty" style="float: left;">
                                    <img src="image/autoship.png" width="30" height="30" />
                                </div>

                                <div style="color: #333333; float: none; font-size: 14px; font-weight: normal;">
                                    Standard Delivery:  Dispatched in 3-5 Business Days. Dispatch may take 5-7 days more due to high order volume.
                                </div>
                                <br />
                                <br />

                                <div style="color: #333333; float: none; font-size: 14px; font-weight: normal; margin-left: 28%;">
                                    * Cash On Delivery	* Pay By Credit/Debit Card  
                                </div>

                                <div style="color: #333333; float: none; font-size: 14px; font-weight: normal; margin-left: 28%;">
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("freedilivery") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lbl_free_Delivery" runat="server" ForeColor="#333333" Text="* Free Delivery"></asp:Label>
                                     <div id="deliverym" runat="server" visible="false">*  Delivery Charges &nbsp; र <%#Eval("Deliverym") %></div>
                                </div>

                                <br />
                                <br />


                                <asp:LinkButton ID="LinkButton1" Font-Size="17px" class="button" runat="server" OnClick="LinkButton2_Click">BUY</asp:LinkButton>
                                <br />
                                <br />

                                <div style="width: 100px; padding: 3px 0 0 3px; float: left; border: 1px solid #F15A23;">
                                    <asp:Image ID="ProgressImage" runat="server" ImageUrl="~/image/graph.jpg" Width="100px" Height="20px" />
                                </div>

                                <div style="float: inherit; margin-left: 12px">
                                    <asp:Label ID="lbl_per" runat="server" Font-Size="13px" Font-Bold="true" Text="" ForeColor="Black"></asp:Label>
                                </div>

                            </div>

                        </div>
                        <div class="review">
                            <div>
                                <cc2:Rating ID="Rating1" OnChanged="Rating1_Changed" runat="server" AutoPostBack="true" ReadOnly="true"
                                    StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="Star"
                                    FilledStarCssClass="ratingFilled" CurrentRating='<%# Eval("Rating") %>'>
                                </cc2:Rating>
                                &nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><%#Eval("review") %> reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');">Write a review</a>
                            </div>
                        </div>
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style "><a class="addthis_button_facebook_like"></a><a class="addthis_button_tweet"></a></div>
                        <script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-506f325f57fbfc95"></script>
                        <!-- AddThis Button END -->

                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Tabs Start -->
        <div id="tabs" class="htabs"><a href="#tab-description">Description</a> <a href="#tab-review">Reviews</a> </div>
        <div id="tab-description" class="tab-content">
            <p>
                <asp:Label ID="lbl_desc" runat="server" Text=""></asp:Label>
            </p>
        </div>
        <div class="tab-content" id="tab-review">
            <asp:Repeater ID="Repeater3" runat="server">
                <ItemTemplate>
                    <div class="review-list">
                        <div class="author"><b><%#Eval("name") %></b> <span class="date"><%# Convert.ToDateTime(Eval("date")).ToString("dd")%></span> <span class="month"><%# Convert.ToDateTime(Eval("date")).ToString("MMM")%></span> <span class="year"><%# Convert.ToDateTime(Eval("date")).ToString("yyyy")%></span></div>
                        <div class="rating">
                            <asp:Panel ID="Panel1" runat="server" Visible="true">
                                <div class="standard-form row-fluid">
                                    <table>
                                        <tr>
                                            <td>
                                                <cc2:Rating ID="Rating1" OnChanged="Rating1_Changed" runat="server" AutoPostBack="true" ReadOnly="true"
                                                    StarCssClass="ratingEmpty" WaitingStarCssClass="ratingSaved" EmptyStarCssClass="Star"
                                                    FilledStarCssClass="ratingFilled" CurrentRating='<%# Eval("Rating") %>'>
                                                </cc2:Rating>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>

                        </div>
                        <div class="text"><%#Eval("review") %></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <h2 id="review-title">Write a review</h2>
            <br>
            <b>Your Name:</b><br>
            <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="None" ErrorMessage="Please Enter Your Name"
                ControlToValidate="txt_name" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
            <br>
            <br>
            <b>Your Review:</b>
            <asp:TextBox ID="txt_review" Style="width: 98%;" Rows="8" cols="40" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ErrorMessage="Please Enter Your Review"
                ControlToValidate="txt_review" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
            <span style="font-size: 11px;"><span style="color: #FF0000;">Note:</span> HTML is not translated!</span><br>
            <br>
            <table>
                <tr>
                    <td>
                        <b>Rating:</b>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rb_rating" runat="server" DataTextField="star" RepeatDirection="Horizontal" DataValueField="intglcode">
                            <asp:ListItem></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="None" runat="server" ErrorMessage="Please Select Rating"
                            ControlToValidate="rb_rating" ValidationGroup="btnsubmit"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <div class="buttons">
                <div class="left" style="margin-bottom: -4px; margin-left: -62px; margin-top: 18px;">
                    <asp:Button ID="btn_submit" runat="server" ValidationGroup="btnsubmit" OnClick="btn_submit_Click" class="button" Text="Submit"></asp:Button>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="btnsubmit" />
                </div>
            </div>
        </div>
        <!-- Tabs End -->
        <!-- Related Products Start -->
        <div class="box">
            <div class="box-heading">Related Products</div>
            <div class="box-content">
                <div class="box-product">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <div>
                                <div class="image">
                                    <a href="Product_Discription.aspx?id=<%#Eval("code") %>">
                                        <img alt="iPad Classic" src='<%#Eval("p_img") %>' style="height: 152px; width: 152px;"></a>
                                </div>
                                <div class="name"><a href="Product_Discription.aspx?id=<%#Eval("code") %>"><%#Eval("p_name") %></a></div>
                                <div class="price"><span class="price-new">र<%#Eval("p_price") %></span></div>
                                <div class="cart">
                                    <a class="button" href="Product_Discription.aspx?id=<%#Eval("code") %>">Add to Cart</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <!-- Related Products End -->
    </div>
</asp:Content>

