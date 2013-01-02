<%@ Page Title="" Language="C#" MasterPageFile="~/geocache/1column-geocache.master" AutoEventWireup="true" CodeBehind="record.aspx.cs" Inherits="ASECPJ.geocache.record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $("#tabs").tabs();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header>
        <h1>DoTheNumber's Record</h1>
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">Geocache</a></li>
                <li><a href="#tabs-2">Finds</a></li>
            </ul>
            <div id="tabs-1">
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
            </div>
            <div id="tabs-2">
                <p>
                    No finds found!
                </p>
            </div>
        </div>
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
