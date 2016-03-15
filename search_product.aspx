<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search_product.aspx.cs" Inherits="search_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <!--Breadcrumb Part Start-->

        <!--Breadcrumb Part End-->
        <h1 class="page_title">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h1>
        <div class="product-filter">
            <div class="display">   
                <b>
                    <div class="breadcrumb" style="margin-bottom: 0;">
                        <a style="color: #333333; font-size: 12px;" href="Default.aspx">Online Store</a>  <a style="color: #333333; font-size: 12px;">»</a>  <a href="#" style="color: #333333; font-size: 12px;">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a> 
                    </div>
                </b>
            </div>
            <div class="limit">
                <b>Show:</b>
                <select>
                    <option selected="selected" value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                     <option value="25">25</option>
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
                </select>
            </div>
        </div>
        <!--Product Grid Start-->
        <div class="product-grid">
            <asp:Repeater ID="GridView1" runat="server">
                <ItemTemplate>
                    <div>
                        <div class="image">
                            <a href="Product_Discription.aspx?id=<%#Eval("code") %>">
                                <img src='<%#Eval("p_img") %>' height="135px" width="135px" alt="iPhone" /></a>
                        </div>
                        <div class="name"><a href="Product_Discription.aspx?id=<%#Eval("code") %>"><%#Eval("p_name") %></a></div>
                        <div class="price">र<%#Eval("p_price") %></div>
                       
                        <div class="cart">
                            <a class="button" href="Product_Discription.aspx?id=<%#Eval("code") %>">Add to Cart</a>
                        </div>
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

