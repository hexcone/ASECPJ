<%@ Page Title="" Language="C#" MasterPageFile="~/geocache/2column-geocache.master" AutoEventWireup="true" CodeBehind="find.aspx.cs" Inherits="ASECPJ.geocache.find" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenttop" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentleft" runat="server">
    <header>
        <h1>Geocache</h1>
        <table style="border: 1px solid black; width: 100%;">
            <tr>
                <th>
                    <p>Description</p>
                </th>
                <th>
                    <p>Placed</p>
                </th>
                <th>
                    <p>Found</p>
                </th>
            </tr>
            <tr>
                <td>
                    <p>
                        <a href="view.aspx">Gator Bait CITO</a><br />
                        by <a href="#">DoTheNumbers</a> | Block L
                    </p>
                </td>
                <td>
                    <p>9 Mar 13</p>
                </td>
                <td>
                    <p>0 times</p>
                </td>
            </tr>
        </table>
    </header>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentright" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
