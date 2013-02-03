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
                        <asp:TextBox ID="nameTextBox" runat="server" class="formstyle" title="Subject" Text="<%# getGeocacheName() %>"></asp:TextBox>
                    Description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" class="formstyle" title="Comment" Height="200px" TextMode="MultiLine" Text="<%# getGeocacheDescription() %>"></asp:TextBox>
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
                </p>
            </div>
        </div>
        <div class="accordion">
            <h2>Location</h2>
            <div>
                <p>
                    Latitude:
                    <asp:TextBox ID="latitudeTextBox" runat="server" class="formstyle width80" placeholder="Latitude" Text="<%# getGeocacheLatitude() %>" /><br />
                    Longitude:
                    <asp:TextBox ID="longitudeTextBox" runat="server" class="formstyle width80" placeholder="Longitude" Text="<%# getGeocacheLongitude() %>"/><br />
                </p>
                <div id="canvas"></div>
                <br />
                <script type="text/javascript">
                    // configuration
                    var myZoom = 12;
                    var myMarkerIsDraggable = true;
                    var myCoordsLenght = 6;
                    var defaultLat = "<%# getGeocacheLatitude() %>";
                    var defaultLng = "<%# getGeocacheLongitude() %>";

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
