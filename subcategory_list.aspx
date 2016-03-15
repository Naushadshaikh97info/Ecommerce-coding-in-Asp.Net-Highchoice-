<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="subcategory_list.aspx.cs" Inherits="subcategory_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">
        <%--   <p class="welcome">" The clean and modern look allows you to&nbsp; use the theme for every kind of eCommerce online shop. Great Looks on Desktops, Tablets and Mobiles."</p>--%>
        <%--   <!--Slideshow Part Start-->
                    <div class="slider-wrapper">
                        <div id="slideshow" class="nivoSlider">--%>
        <%--  <a href="#">
        --%>



        <%--      <div class="product">
               
        <asp:Image ID="Image1" runat="server"></asp:Image>
                 
                </div>
        --%>

        <%--</a>--%>

        <!--Breadcrumb Part Start-->

        <!--Breadcrumb Part End-->

        <h1 class="page_title">
            <asp:Label ID="Label3" runat="server" Text='<%#Eval("b_img") %>'></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
        <div class="product-filter" style="padding: 0px 4px 0px 6px;">
            <div class="display">
                <b>
                    <div class="breadcrumb" style="margin-bottom: 3px;">
                        <a style="color: #333333; font-size: 12px;" href="Default.aspx">Home</a> <a style="color: #333333; font-size: 12px;">»</a>  <a href="#" style="color: #333333; font-size: 12px;">
                            <asp:Label ID="Label2" runat="server" Text="" /></a>
                    </div>
                </b>
            </div>
            <%-- <div class="limit">
                <b>Show:</b>
                <select >    
                    <option selected="selected" value="15">15</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="75">75</option>
                    <option value="100">100</option>
                </select>
            </div>
            <div class="sort">
                <b>Sort By:</b>
                <select>
                    <option selected="selected" value="">Default</option>
                    <option value="">Name (A - Z)</option>
                    <option value="">Name (Z - A)</option>
                    <option value="">Price (Low &gt; High)</option>
                    <option value="">Price (High &gt; Low)</option>
                    <option value="">Rating (Highest)</option>
                    <option value="">Rating (Lowest)</option>
                    <option value="">Model (A - Z)</option>
                    <option value="">Model (Z - A)</option>
                </select>
            </div>--%>
        </div>
        <!--Product Grid Start-->

        <div class="product-grid">
            <asp:Repeater ID="GridView1" runat="server">
                <ItemTemplate>
                    <div>
                        <div class="image">
                            <a href="Products_List.aspx?id=<%#Eval("code") %>">
                                <img src='<%#Eval("p_img") %>' alt="iPhone" height="135px" width="135px" /></a>
                        </div>
                        <div class="name"><a href="Products_List.aspx?id=<%#Eval("code") %>"><%#Eval("p_name") %></a></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!--Product Grid End-->
        <!--Pagination Part Start-->
        <div class="pagination">
            <div class="links"><b>1</b> <a href="#">2</a> <a href="#">&gt;</a> <a href="#">&gt;|</a></div>
            <div class="results">Showing 1 to 15 of 16 (2 Pages)</div>
        </div>
        <!--Pagination Part End-->
    </div>
</asp:Content>

