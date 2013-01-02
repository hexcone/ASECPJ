<%@ Page Title="" Language="C#" MasterPageFile="1column-geocache.master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="ASECPJ.geocache.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".accordion").accordion({
                collapsible: true,
                heightStyle: "content",
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header>
        <h1>Edit Geocache</h1>
        <div class="accordion">
            <h2>Information</h2>
            <div>
                <p>
                    Name:
                        <asp:TextBox ID="subjectTextBox" runat="server" class="formstyle" title="Subject" Text="Gator Bait CITO"></asp:TextBox>
                    Description:
                        <asp:TextBox ID="commentTextBox" runat="server" class="formstyle" title="Comment" Height="200px" TextMode="MultiLine">In this event, we will be taking a different approach to a Cache In/Trash Out Event. This is a kayak/canoe event that will take place in the Saltwater Marsh of Gulf Shores and Gulf State Park. As a point of reference, we will be near The Original Oyster House for this event. We hope for the Geoweekend to consist of five event caches, as listed below.

ASPGC Event (Friday, March 8) – This one will probably be in our Classroom or Activities building, but the organizer (Amy Bannick Griffin) of it may opt for some other location.   This will be an evening event.

Hardcore Event (Saturday, March 9) - This event will take place Saturday morning and is where some of the more dedicated and "Hardcore" cachers will head out through the swamp to get our Hardcore series.  I may just have to hide another one or two out there to tempt some repeat visitors.

Picnicking with the Gators Event (Saturday, March 9)- This will be a lunch time event for the survivors of the Hardcore Event and those to scared to go "Hardcore". It will be held at Lake Shelby and hosted by Smarky (Sandy Harris).</asp:TextBox>
                    Image:
                    <section id="workbody">
                        <img src="../images/geocache/gator.jpg" alt="sky1">
                    </section>
                    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                </p>
            </div>
            <h2>Location</h2>
            <div>
                <p>
                    Coordinates:
                        <asp:TextBox ID="coordinateTextBox" runat="server" class="formstyle" title="Subject" Text="1.379339,103.849806"></asp:TextBox>
                    <img src="" width="100%" height="500" />
                </p>
            </div>
            <h2>Verification Code</h2>
            <div>
                <p>
                    <asp:Button ID="verificationCodeButton" runat="server" class="button formstyle" Width="30%" Text="Generate Verification Code!" /><br />
                    <asp:Label ID="Label1" runat="server" Text="TY6fh45"></asp:Label><br />
                    *Important* Hide this together with your Geocache!
                </p>
            </div>
        </div>
        <br />
        <asp:Button ID="createButton" runat="server" class="button formstyle" Width="100%" Text="Update Geocache!" />
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
