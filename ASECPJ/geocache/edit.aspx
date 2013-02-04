<%@ Page Title="" Language="C#" MasterPageFile="1column-geocache.master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="ASECPJ.geocache.edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".accordion").accordion({
                collapsible: true,
                heightStyle: "content",
            })
        });
    </script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <style>
        #slider-range-max {
            width: 30%;
        }

        #canvas {
            width: 100%;
            height: 500px;
            overflow: visible;
        }

        .width80 {
            width: 80%;
        }
    </style>
    <link rel="stylesheet" href="assets/css/styles.css" />
    <!--[if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header>
        <h1>Edit Geocache
            <asp:Button ID="backButton" runat="server" class="button formstyle" Width="20%" Text="Back" OnClick="backButton_Click" />
        </h1>
        <div class="accordion">
            <h2>Information</h2>
            <div>
                <p>
                    Name:
                        <asp:TextBox ID="nameTextBox" runat="server" class="formstyle" title="Subject"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="nameTextBoxRequiredFieldValidator" CssClass="validator" ControlToValidate="nameTextBox" runat="server" ErrorMessage="*Required field"></asp:RequiredFieldValidator><br />
                    Description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" class="formstyle" title="Comment" Height="200px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="descriptionTextBoxRequiredFieldValidator" CssClass="validator" ControlToValidate="descriptionTextBox" runat="server" ErrorMessage="*Required field"></asp:RequiredFieldValidator><br />
                    Image:<br />
                    <asp:FileUpload ID="imageFileUpload" runat="server" />
                    <br />
                    <br />
                    Difficulty:
                    <asp:DropDownList ID="difficultyDropDownList" runat="server">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="difficultyRequiredFieldValidator" CssClass="validator" ControlToValidate="difficultyDropDownList" runat="server" ErrorMessage="*Required field"></asp:RequiredFieldValidator><br />
                </p>
            </div>
        </div>
        <div class="accordion">
            <h2>Location</h2>
            <div>
                <p>
                    Latitude:
                    <asp:TextBox ID="latitudeTextBox" runat="server" class="formstyle width80" placeholder="Latitude" />
                    <asp:RequiredFieldValidator ID="latitudeTextBoxRequiredFieldValidator" CssClass="validator" ControlToValidate="latitudeTextBox" runat="server" ErrorMessage="*Required field"></asp:RequiredFieldValidator><br />
                    Longitude:
                    <asp:TextBox ID="longitudeTextBox" runat="server" class="formstyle width80" placeholder="Longitude" />
                    <asp:RequiredFieldValidator ID="longitudeTextBoxRequiredFieldValidator" CssClass="validator" ControlToValidate="longitudeTextBox" runat="server" ErrorMessage="*Required field"></asp:RequiredFieldValidator><br />
                </p>
                <div id="canvas"></div>
                <br />
                <script type="text/javascript">
                    // configuration
                    var myZoom = 12;
                    var myMarkerIsDraggable = true;
                    var myCoordsLenght = 6;
                    var defaultLat = 1.379530;
                    var defaultLng = 103.849880;

                    // creates the map
                    // zooms
                    // centers the map
                    // sets the map's type 
                    var map = new google.maps.Map(document.getElementById('canvas'), {
                        zoom: myZoom,
                        center: new google.maps.LatLng(defaultLat, defaultLng),
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    });

                    // creates a draggable marker to the given coords
                    var myMarker = new google.maps.Marker({
                        position: new google.maps.LatLng(defaultLat, defaultLng),
                        draggable: myMarkerIsDraggable
                    });


                    // adds a listener to the marker
                    // gets the coords when drag event ends
                    // then updates the input with the new coords
                    google.maps.event.addListener(myMarker, 'dragend', function (evt) {
                        document.getElementById('<%= latitudeTextBox.ClientID %>').value = evt.latLng.lat().toFixed(myCoordsLenght);
                        document.getElementById('<%= longitudeTextBox.ClientID %>').value = evt.latLng.lng().toFixed(myCoordsLenght);
                    });

                    // centers the map on markers coords
                    map.setCenter(myMarker.position);

                    // adds the marker on the map
                    myMarker.setMap(map);
                </script>

            </div>
        </div>
        <div class="accordion">
            <h2>Verification Code</h2>
            <div>
                <p>
                    <asp:Label ID="verificationCodeLabel" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label><br /><br />
                    *Important* <br />
                    This is your unique verification code for your geocache<br />
                    Please hide this together with your geocache
                </p>
            </div>
        </div>
        <br />
        <asp:Button ID="updateButton" runat="server" class="button formstyle" Width="100%" Text="Update Geocache!" OnClick="updateButton_Click" />
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
