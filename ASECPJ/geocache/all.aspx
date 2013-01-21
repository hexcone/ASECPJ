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



        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource_All" DataKeyNames="geocacheId">
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <tr style="">
                    <td>
                       <p><asp:HiddenField ID="geocacheIdHiddenField" runat="server" Value='<%# Eval("geocacheId") %>' />
                           <asp:HyperLink ID="geocacheIdHyperLink" runat="server" NavigateUrl='<%# getUrl(Eval("geocacheId")) %>'>
                           <asp:Label ID="geocacheNameLabel" runat="server" Text='<%# Eval("geocacheName") %>' />
                           </asp:HyperLink></p>
                    </td>
                    <td>
                        <p><asp:Label ID="geocacheDateCreatedLabel" runat="server" Text='<%# Eval("geocacheDateCreated") %>' /></p>
                    </td>
                    <td>
                        <p><asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' /></p>
                    </td>
                </tr>
            </ItemTemplate>

            <LayoutTemplate>
                <table runat="server" style="border: 1px solid black; width: 100%;">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" style="width: 100%;">
                                <tr runat="server" style="">

                                    <th runat="server"><p>geocacheName</p></th>
                                    <th runat="server"><p>geocacheDateCreated</p></th>
                                    <th runat="server"><p>username</p></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource_All" runat="server" ConnectionString="<%$ ConnectionStrings:asecpjConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:asecpjConnectionString.ProviderName %>" SelectCommand="SELECT geocache.geocacheId, geocache.geocacheName, 
            DATE_FORMAT(geocache.geocacheDateCreated, '%e %M %Y') AS geocacheDateCreated, `user`.username FROM geocache INNER JOIN `user` ON geocache.iduser = `user`.iduser"></asp:SqlDataSource>




        <%--<table style="border: 1px solid black; width: 100%;">
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
        </table>--%>
    </header>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentright" runat="server">
    <header>
        <div class="accordion">
            <h2>Filter by keyword</h2>
            <div>
                <p>
                    <asp:TextBox ID="keywordTextBox" runat="server" class="formstyle center" placeholder="Keyword"></asp:TextBox>
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
                        <asp:ListItem Value="*" Text="Anywhere" Selected="True" runat="server" />
                        <asp:ListItem Value="a" Text="Block A" runat="server" />
                        <asp:ListItem Value="b" Text="Block B" runat="server" />
                        <asp:ListItem Value="c" Text="Block C" runat="server" />
                        <asp:ListItem Value="d" Text="Block D" runat="server" />
                        <asp:ListItem Value="e" Text="Block E" runat="server" />
                        <asp:ListItem Value="f" Text="Block F" runat="server" />
                        <asp:ListItem Value="g" Text="Block G" runat="server" />
                        <asp:ListItem Value="h" Text="Block H" runat="server" />
                        <asp:ListItem Value="j" Text="Block J" runat="server" />
                        <asp:ListItem Value="k" Text="Block K" runat="server" />
                        <asp:ListItem Value="l" Text="Block L" runat="server" />
                        <asp:ListItem Value="m" Text="Block M" runat="server" />
                        <asp:ListItem Value="n" Text="Block N" runat="server" />
                        <asp:ListItem Value="p" Text="Block P" runat="server" />
                        <asp:ListItem Value="q" Text="Block Q" runat="server" />
                        <asp:ListItem Value="r" Text="Block R" runat="server" />
                        <asp:ListItem Value="s" Text="Block S" runat="server" />
                        <asp:ListItem Value="u" Text="Uncategorized" runat="server" />
                    </asp:CheckBoxList>
                </p>
                <h2>Level</h2>
                <p>
                    <asp:CheckBoxList ID="levelCheckBoxList1" runat="server">
                        <asp:ListItem Value="*" Text="Anywhere" Selected="True" runat="server" />
                        <asp:ListItem Value="1" Text="Level 1" runat="server" />
                        <asp:ListItem Value="2" Text="Level 2" runat="server" />
                        <asp:ListItem Value="3" Text="Level 3" runat="server" />
                        <asp:ListItem Value="4" Text="Level 4" runat="server" />
                        <asp:ListItem Value="5" Text="Level 5" runat="server" />
                        <asp:ListItem Value="6" Text="Level 6" runat="server" />
                        <asp:ListItem Value="7" Text="Level 7" runat="server" />
                        <asp:ListItem Value="u" Text="Uncategorized" runat="server" />
                    </asp:CheckBoxList>
                </p>
            </div>
        </div>
        <br />
        <asp:Button ID="filterButton" runat="server" class="button formstyle" Width="100%" Text="Filter" OnClick="filterButton_Click" />
    </header>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
