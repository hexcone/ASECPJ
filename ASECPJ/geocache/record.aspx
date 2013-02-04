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
                <asp:SqlDataSource ID="SqlDataSource_Geocache" runat="server" ConnectionString="<%$ ConnectionStrings:asecpjConnectionString %>"
            ProviderName="<%$ ConnectionStrings:asecpjConnectionString.ProviderName %>"></asp:SqlDataSource>

                <asp:ListView ID="ListView_Geocache" runat="server" DataSourceID="SqlDataSource_Geocache" DataKeyNames="geocacheId">

                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
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
                                    <asp:Label ID="geocacheDateCreatedLabel" runat="server" Text='<%# Eval("geocacheDateCreated") %>' />
                                </p>
                            </td>
                        </tr>
                    </ItemTemplate>

                    <LayoutTemplate>
                        <table id="Table2" runat="server" style="border: 1px solid black; width: 100%;">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" style="width: 100%;">
                                        <tr id="Tr2" runat="server" style="">

                                            <th id="Th1" runat="server">
                                                <p>geocacheName</p>
                                            </th>
                                            <th id="Th2" runat="server">
                                                <p>geocacheDateCreated</p>
                                            </th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr3" runat="server">
                                <td id="Td2" runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
            <div id="tabs-2">
                <asp:SqlDataSource ID="SqlDataSource_Find" runat="server" ConnectionString="<%$ ConnectionStrings:asecpjConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:asecpjConnectionString.ProviderName %>"></asp:SqlDataSource>

                <asp:ListView ID="ListView_Find" runat="server" DataSourceID="SqlDataSource_Find" DataKeyNames="findId">

                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>

                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <p>
                                    <asp:HiddenField ID="geocacheIdHiddenField" runat="server" Value='<%# Eval("findId") %>' />
                                    <asp:HyperLink ID="geocacheIdHyperLink" runat="server" NavigateUrl='<%# getUrl(Eval("geocacheId")) %>'>
                                        <asp:Label ID="geocacheNameLabel" runat="server" Text='<%# Eval("findName") %>' />
                                    </asp:HyperLink>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:Label ID="geocacheDateCreatedLabel" runat="server" Text='<%# Eval("findDateCreated") %>' />
                                </p>
                            </td>
                        </tr>
                    </ItemTemplate>

                    <LayoutTemplate>
                        <table id="Table2" runat="server" style="border: 1px solid black; width: 100%;">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" style="width: 100%;">
                                        <tr id="Tr2" runat="server" style="">

                                            <th id="Th1" runat="server">
                                                <p>geocacheName</p>
                                            </th>
                                            <th id="Th2" runat="server">
                                                <p>geocacheDateCreated</p>
                                            </th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr3" runat="server">
                                <td id="Td2" runat="server" style=""></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
