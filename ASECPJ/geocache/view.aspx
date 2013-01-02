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
        <h1>Gator Bait CITO
            <asp:Button ID="reportButton" runat="server" class="button formstyle" Width="20%" Text="Report geocache" OnClientClick="javascript: $('#ReportGeocachePanel').dialog('open'); return false;" />
            <asp:Button ID="editButton" runat="server" class="button formstyle" Width="20%" Text="Edit geocache" OnClick="editButton_Click" />
        </h1>
        <h2><a href="#">DoTheNumbers</a> | School of Information Technology | 9 Mar 13</h2>

        <section id="workbody">
            <img src="../images/geocache/gator.jpg" alt="sky1">
        </section>

        <p>
            In this event, we will be taking a different approach to a Cache In/Trash Out Event. This is a kayak/canoe event that will take place in the Saltwater
            Marsh of Gulf Shores and Gulf State Park. As a point of reference, we will be near The Original Oyster House for this event.<br />
            We hope for the Geoweekend to consist of five event caches, as listed below.<br />
        </p>
        <ul>
            <li>ASPGC Event (Friday, March 8) – This one will probably be in our Classroom or Activities building, but the organizer (Amy Bannick Griffin) of it 
                may opt for some other location.   This will be an evening event.</li>

            <li>Hardcore Event (Saturday, March 9) - This event will take place Saturday morning and is where some of the more dedicated and "Hardcore" cachers 
                will head out through the swamp to get our Hardcore series.  I may just have to hide another one or two out there to tempt some repeat visitors. </li>

            <li>Picnicking with the Gators Event (Saturday, March 9)- This will be a lunch time event for the survivors of the Hardcore Event and those to scared 
                to go "Hardcore". It will be held at Lake Shelby and hosted by Smarky (Sandy Harris).</li>
        </ul>

        <hr />

        <h1>Finds</h1>
        <div class="accordion">
            <h2>Add your find!</h2>
            <div>
                <p>
                    Subject:
                        <asp:TextBox ID="subjectTextBox" runat="server" class="formstyle" placeholder="Subject"></asp:TextBox>
                    Comment:
                        <asp:TextBox ID="commentTextBox" runat="server" class="formstyle" placeholder="Comment" Height="200px" TextMode="MultiLine"></asp:TextBox>
                    Image:
                        <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                    <br />
                    Verification Code: (Found with your geocache!)
                        <asp:TextBox ID="verificationCodeTextBox" runat="server" class="formstyle" title="Verification Code"></asp:TextBox>
                    <asp:Button ID="submitButton" runat="server" class="button formstyle" Width="30%" Text="I've found a geocache!" />
                </p>
            </div>
        </div>

        <br />
        <br />

        <div class="commentBox">
            <aside class="comment">
                <h3>Second find</h3>
                <h2>Found 15th December 2012</h2>
                <p>Short comment.</p>
            </aside>
            <aside class="item">
                <a href="#">
                    <img src="../images/geocache/user-image.png" alt="Dashocat" /></a><!-- Image must be 400px by 300px -->
                <h3>Dashocat 2</h3>
                <p>SIT Year 2</p>
            </aside>
            <asp:Button ID="Button1" runat="server" Width="20%" class="button formstyle floatright" OnClientClick="javascript: $('#ReportFindPanel').dialog('open'); return false;" Text="Report" />
        </div>

        <div class="commentBox">
            <aside class="comment">
                <h3>OMG WASTED 3 HOURS OF MY LIFE</h3>
                <h2>Found 14th December 2012</h2>
                <p>I’m the kind of person who likes to be by himself. To put a finer point on it, I’m the type of person who doesn’t find it painful to be alone. I find spending an hour or two every day running alone, not speaking to anyone, as well as four or five hours alone at my desk, to be neither difficult nor boring. I’ve had this tendency ever since I was young, when, given a choice, I much preferred reading books on my own or concentrating on listening to music over being with someone else. I could always think of things to do by myself.</p>
            </aside>
            <aside class="item">
                <a href="#">
                    <img src="../images/geocache/user-image.png" alt="Dashocat" /></a><!-- Image must be 400px by 300px -->
                <h3>Dashocat</h3>
                <p>SIT Year 2</p>
            </aside>
            <asp:Button ID="Button2" runat="server" Width="20%" class="button formstyle floatright" OnClientClick="javascript: $('#ReportFindPanel').dialog('open'); return false;" Text="Report" />
        </div>

        <div id="ReportGeocachePanel" title="Report Geocache!">
            <p>
                Reason:<br />
                <asp:RadioButtonList ID="geocacheReasonRadioButtonList" GroupName="geocacheReason" runat="server"></asp:RadioButtonList>
                <asp:RadioButton ID="gViolentRadioButton" Text=" Violent Content" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gHatefulRadioButton" Text=" Hateful Content" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gSpamRadioButton" Text=" Spam" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gCopyrightedRadioButton" Text=" Copyrighted Content" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gLostRadioButton" Text=" Lost Geocache" GroupName="geocacheReason" runat="server" /><br />
                <asp:RadioButton ID="gOtherRadioButton" GroupName="geocacheReason" runat="server" /> <asp:TextBox ID="TextBox1" class="formstyle" style="width:80%" runat="server"></asp:TextBox>


                Additional Information:<br />
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
                <asp:RadioButton ID="fOtherRadioButton" GroupName="findReason" runat="server" /> <asp:TextBox ID="userTextBox" class="formstyle" style="width:80%" runat="server"></asp:TextBox>


                Additional Information:<br />
                <asp:TextBox ID="infoTextBox" runat="server" class="formstyle" title="Comment" Height="150px" TextMode="MultiLine"></asp:TextBox><br />

                <asp:Button ID="filterButton" runat="server" class="button formstyle" OnClientClick="javascript: $(#ReportFindPanel).dialog('close');" Width="100%" Text="Submit!" />
            </p>
        </div>
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
