<%@ Page Title="" Language="C#" MasterPageFile="2column-geocache.master" AutoEventWireup="True" CodeBehind="all.aspx.cs" Inherits="ASECPJ.geocache.view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".accordion").accordion({
                collapsible: true,
                heightStyle: "content",
            });
        });

        $(function () {
            $("#slider-range").slider({
                range: true,
                min: 1,
                max: 5,
                values: [1, 5],
                slide: function (event, ui) {
                    $("#amount").val("" + ui.values[0] + " - " + ui.values[1]);
                }
            });
            $("#amount").val($("#slider-range").slider("values", 0) +
                " - " + $("#slider-range").slider("values", 1));
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenttop" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentleft" runat="server">
    <header>
        <h1>Geocache 
            <asp:Button ID="createButton" runat="server" class="button formstyle" Width="20%" Text="Hide a geocache!" OnClick="createButton_Click" /></h1>
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
    <header>
        <div class="accordion">
            <h2>Owner</h2>
            <div>
                <p>
                    <asp:RadioButtonList ID="ownerRadioButtonList" GroupName="owner" runat="server"></asp:RadioButtonList>
                    <asp:RadioButton ID="allRadioButton1" Text=" All" GroupName="owner" runat="server" /><br />
                    <asp:RadioButton ID="meRadioButton" Text=" Me" GroupName="owner" runat="server" /><br />
                    <asp:RadioButton ID="userRadioButton" GroupName="owner" runat="server" /> <asp:TextBox ID="userTextBox" class="formstyle" style="width:80%" runat="server"></asp:TextBox>
                </p>
            </div>
        </div>
        <div class="accordion">
            <h2>Filter by keyword</h2>
            <div>
                <p>
                    <asp:TextBox ID="keywordTextBox" runat="server" class="formstyle center" title="Keyword"></asp:TextBox>
                </p>
            </div>
        </div>
        <div class="accordion">
            <h2>Difficulty</h2>
            <div>
                <p>
                    <input type="text" id="amount" class="center" />
                </p>
                <br />
                <div id="slider-range"></div>
            </div>
        </div>
        <div class="accordion">
            <h2>Sort by</h2>
            <div>
                <p>
                    <asp:DropDownList ID="sortDropDownList" runat="server" class="formstyle center">
                        <asp:ListItem Text="Newest First"></asp:ListItem>
                        <asp:ListItem Text="Oldest First"></asp:ListItem>
                        <asp:ListItem Text="Most Found First"></asp:ListItem>
                        <asp:ListItem Text="Least Found First"></asp:ListItem>
                    </asp:DropDownList>
                </p>
            </div>
        </div>
        <div class="accordion">
            <h2>Location</h2>
            <div>
                <h2>Block</h2>
                <p>
                    <asp:CheckBoxList ID="blockCheckBoxList" runat="server">
                        <asp:ListItem Value="anywhereBlockCheckBox" Text="Anywhere" Selected="True" runat="server" />
                        <asp:ListItem Value="aListItem" Text="Block A" runat="server" />
                        <asp:ListItem Value="bListItem" Text="Block B" runat="server" />
                        <asp:ListItem Value="cListItem" Text="Block C" runat="server" />
                        <asp:ListItem Value="dListItem" Text="Block D" runat="server" />
                        <asp:ListItem Value="eListItem" Text="Block E" runat="server" />
                        <asp:ListItem Value="fListItem" Text="Block F" runat="server" />
                        <asp:ListItem Value="gListItem" Text="Block G" runat="server" />
                        <asp:ListItem Value="hListItem" Text="Block H" runat="server" />
                        <asp:ListItem Value="jListItem" Text="Block J" runat="server" />
                        <asp:ListItem Value="kListItem" Text="Block K" runat="server" />
                        <asp:ListItem Value="lListItem" Text="Block L" runat="server" />
                        <asp:ListItem Value="mListItem" Text="Block M" runat="server" />
                        <asp:ListItem Value="nListItem" Text="Block N" runat="server" />
                        <asp:ListItem Value="pListItem" Text="Block P" runat="server" />
                        <asp:ListItem Value="qListItem" Text="Block Q" runat="server" />
                        <asp:ListItem Value="rListItem" Text="Block R" runat="server" />
                        <asp:ListItem Value="sListItem" Text="Block S" runat="server" />
                        <asp:ListItem Value="unBlockListItem" Text="Uncategorized" runat="server" />
                    </asp:CheckBoxList>
                </p>
                <h2>Level</h2>
                <p>
                    <asp:CheckBoxList ID="levelCheckBoxList1" runat="server">
                        <asp:ListItem Value="anywhereLevelCheckBox" Text="Anywhere" Selected="True" runat="server" />
                        <asp:ListItem Value="level1ListItem" Text="Level 1" runat="server" />
                        <asp:ListItem Value="level2ListItem" Text="Level 2" runat="server" />
                        <asp:ListItem Value="level3ListItem" Text="Level 3" runat="server" />
                        <asp:ListItem Value="level4ListItem" Text="Level 4" runat="server" />
                        <asp:ListItem Value="level5ListItem" Text="Level 5" runat="server" />
                        <asp:ListItem Value="level6ListItem" Text="Level 6" runat="server" />
                        <asp:ListItem Value="level7ListItem" Text="Level 7" runat="server" />
                        <asp:ListItem Value="unLevelListItem" Text="Uncategorized" runat="server" />
                    </asp:CheckBoxList>
                </p>
            </div>
        </div>
        <br />
        <asp:Button ID="filterButton" runat="server" class="button formstyle" Width="100%" Text="Filter" />
    </header>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
