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
                    $("#difficultyLabel").val("" + ui.values[0] + " - " + ui.values[1]);
                }
            });
            $("#difficultyLabel").val($("#slider-range").slider("values", 0) +
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
                        <p>
                            <asp:HiddenField ID="geocacheIdHiddenField" runat="server" Value='<%# Eval("geocacheId") %>' />
                            <asp:HyperLink ID="geocacheIdHyperLink" runat="server" NavigateUrl='<%# getUrl(Eval("geocacheId")) %>'>
                                <asp:Label ID="geocacheNameLabel" runat="server" Text='<%# Eval("geocacheName") %>' />
                            </asp:HyperLink>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="noOfFindLabel" runat="server" Text='<%# getNoOfFind(Eval("noOfFind")) %>' />
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="geocacheDateCreatedLabel" runat="server" Text='<%# Eval("geocacheDateCreated") %>' />
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                        </p>
                    </td>
                </tr>
            </ItemTemplate>

            <LayoutTemplate>
                <table runat="server" style="border: 1px solid black; width: 100%;">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" style="width: 100%;">
                                <tr runat="server" style="">

                                    <th runat="server">
                                        <p>Name</p>
                                    </th>
                                    <th runat="server">
                                        <p>Found</p>
                                    </th>
                                    <th runat="server">
                                        <p>Date Created</p>
                                    </th>
                                    <th runat="server">
                                        <p>Created By</p>
                                    </th>
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
            ProviderName="<%$ ConnectionStrings:asecpjConnectionString.ProviderName %>"></asp:SqlDataSource>
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
                    <asp:TextBox ID="difficultyLabel" runat="server" ClientIDMode="Static"></asp:TextBox>
                </p>
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
        </div>
        <br />
        <asp:Button ID="filterButton" runat="server" class="button formstyle" Width="100%" Text="Filter" OnClick="filterButton_Click" />
    </header>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
