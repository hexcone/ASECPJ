<%@ Page Title="" Language="C#" MasterPageFile="1column-geocache.master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="ASECPJ.geocache.view1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".accordion").accordion({
                active: false,
                collapsible: true,
                heightStyle: "content",
            });
        });
        $().ready(function () {
            $("#ReportFindPanel").dialog({
                autoOpen: false,
                modal: true,
                bgiframe: true,
                width: 400,
                height: 500,
                buttons: {
                    <%--'Youbetcha': function () {
                        <%=this.Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this.Button1))%>;
                    },
                    'Cancel': function () {
                        $(this).dialog('close');
                    }--%>
                }
            })
            $('#ReportFindPanel').parent().appendTo($("form:first"));
        });
        $().ready(function () {
            $("#ReportGeocachePanel").dialog({
                autoOpen: false,
                modal: true,
                bgiframe: true,
                width: 400,
                height: 500,
                buttons: {
                    <%--'Youbetcha': function () {
                        <%=this.Page.ClientScript.GetPostBackEventReference(new PostBackOptions(this.Button1))%>;
                    },
                    'Cancel': function () {
                        $(this).dialog('close');
                    }--%>
                }
            })
            $('#ReportGeocachePanel').parent().appendTo($("form:first"));
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header>
        <h1>
            <asp:Label ID="geocacheNameLabel" runat="server" Text="<%# getGeocacheName() %>"></asp:Label>
            <asp:Button ID="reportButton" runat="server" class="button formstyle" Width="20%" Text="Report geocache" OnClientClick="javascript: $('#ReportGeocachePanel').dialog('open'); return false;" />
            <asp:Button ID="editButton" runat="server" class="button formstyle" Width="20%" Text="Edit geocache" OnClick="editButton_Click" />
        </h1>
        <h2>Created by <a href="#">
            <asp:Label ID="usernameLabel" runat="server" Text="<%# getUsername() %>"></asp:Label></a> on
            <asp:Label ID="geocacheDateCreatedLabel" runat="server" Text="<%# getGeocacheDateCreated() %>"></asp:Label></h2>
        <section id="workbody">
            <asp:Image ID="geocacheImage" runat="server" ImageUrl="<%# getGeocacheImage() %>" />
        </section>
        <p>
            <asp:TextBox ID="geocacheDescriptionTextBox" runat="server" TextMode="MultiLine" Text="<%# getGeocacheDescription() %>" ReadOnly="True" BorderStyle="None"></asp:TextBox>
            <br />
        </p>
        <hr />

        <h1>Finds</h1>
        <div class="accordion">
            <h2>Add your find!</h2>
            <div>
                <p>
                    Subject:<br />
                    <asp:TextBox ID="findNameTextBox" runat="server" class="formstyle" placeholder="Subject"></asp:TextBox><br />
                    Comment:<br />
                    <asp:TextBox ID="findDescriptionTextBox" runat="server" class="formstyle" placeholder="Comment" Height="200px" TextMode="MultiLine"></asp:TextBox><br />
                    <br />
                    Image:<asp:FileUpload ID="findImageFileUpload" runat="server" /><br />
                    <br />
                    Verification Code: (Found with your geocache!)<br />
                    <asp:TextBox ID="verificationCodeTextBox" runat="server" class="formstyle" title="Verification Code"></asp:TextBox><br />
                    <asp:Button ID="submitButton" runat="server" class="button formstyle" Width="30%" Text="I've found a geocache!" OnClick="submitButton_Click" />
                </p>
            </div>
        </div>

        <br />
        <br />

        <asp:SqlDataSource ID="SqlDataSource_Find" runat="server" ConnectionString="<%$ ConnectionStrings:asecpjConnectionString %>" ProviderName="<%$ ConnectionStrings:asecpjConnectionString.ProviderName %>"></asp:SqlDataSource>

        <asp:ListView ID="ListView_Find" runat="server" DataSourceID="SqlDataSource_Find">
            <EmptyDataTemplate>
                <span>Geocache have not been found yet.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div class="commentBox">
                    <aside class="comment">
                        <h3><asp:Label ID="findNameLabel" runat="server" Text='<%# Eval("findName") %>' /></h3>
                        
                        <h2>Found on <asp:Label ID="findDateCreatedLabel" runat="server" Text='<%# getFindDateCreated(Eval("findDateCreated").ToString()) %>' /></h2>

                        <section class="workbodyfind">
                            <asp:Image ID="findImage" class="width90" runat="server" ImageUrl='<%# getFindImage(Eval("findImage").ToString()) %>' />
                        </section>
                        <p><asp:TextBox ID="findDescriptionTextBox" runat="server" class="formstyle" Text='<%# Encoding.UTF8.GetString((byte[])(Eval("findDescription"))) %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox></p>
                    </aside>
                    <aside class="item">
                        <a href="#">
                            <img src="../images/geocache/user-image.png" alt="Dashocat" /></a><!-- Image must be 400px by 300px -->
                        <h3><asp:Label ID="userNameLabel1" runat="server" Text='<%# Eval("username") %>' /></h3>
                    </aside>
                    <asp:Button ID="Button1" runat="server" Width="20%" class="button formstyle floatright" OnClientClick="javascript: $('#ReportFindPanel').dialog('open'); return false;" Text="Report" />
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>

        <div id="ReportGeocachePanel" title="Report Geocache!">
            <p>
                Reason:<br />
                <asp:RadioButtonList ID="geocacheReasonRadioButtonList" GroupName="geocacheReason" runat="server"></asp:RadioButtonList>
                <asp:RadioButton ID="gViolentRadioButton" Text=" Violent Content" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gHatefulRadioButton" Text=" Hateful Content" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gSpamRadioButton" Text=" Spam" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gCopyrightedRadioButton" Text=" Copyrighted Content" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gLostRadioButton" Text=" Lost Geocache" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gOtherRadioButton" GroupName="geocacheReason" runat="server" />
                <asp:TextBox ID="TextBox1" class="formstyle" Style="width: 80%" runat="server"></asp:TextBox>Additional Information:<br />
                <asp:TextBox ID="TextBox2" runat="server" class="formstyle" title="Comment" Height="150px" TextMode="MultiLine"></asp:TextBox><br />

                <asp:Button ID="Button3" runat="server" class="button formstyle" OnClientClick="javascript: $(#ReportGeocachePanel).dialog('close');" Width="100%" Text="Submit!" />
            </p>
        </div>

        <div id="ReportFindPanel" title="Report Find!">
            <p>
                Reason:<br />
                <asp:RadioButtonList ID="findReasonRadioButtonList" GroupName="findReason" runat="server"></asp:RadioButtonList>
                <asp:RadioButton ID="fViolentRadioButton" Text=" Violent Content" GroupName="findReason" runat="server" /><br />
                <asp:RadioButton ID="fHatefulRadioButton" Text=" Hateful Content" GroupName="findReason" runat="server" /><br />
                <asp:RadioButton ID="fSpamRadioButton" Text=" Spam" GroupName="findReason" runat="server" /><br />
                <asp:RadioButton ID="fCopyrightedRadioButton" Text=" Copyrighted Content" GroupName="findReason" runat="server" /><br />
                <asp:RadioButton ID="fOtherRadioButton" GroupName="findReason" runat="server" />
                <asp:TextBox ID="userTextBox" class="formstyle" Style="width: 80%" runat="server"></asp:TextBox>Additional Information:<br />
                <asp:TextBox ID="infoTextBox" runat="server" class="formstyle" title="Comment" Height="150px" TextMode="MultiLine"></asp:TextBox><br />

                <asp:Button ID="filterButton" runat="server" class="button formstyle" OnClientClick="javascript: $(#ReportFindPanel).dialog('close');" Width="100%" Text="Submit!" />
            </p>
        </div>
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
