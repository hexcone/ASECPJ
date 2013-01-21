<%@ Page Title="" Language="C#" MasterPageFile="1column-geocache.master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="ASECPJ.geocache.create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".accordion").accordion({
                collapsible: true,
                heightStyle: "content",
            })
        });
        $(function () {
            $("#slider-range-max").slider({
                range: "max",
                min: 1,
                max: 5,
                value: 2,
                slide: function (event, ui) {
                    $("#difficultyLabel").val(ui.value);
                }
            });
            $("#difficultyLabel").val($("#slider-range-max").slider("value"));
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
        <h1>Hide A Geocache</h1>
        <div class="accordion">
            <h2>Information</h2>
            <div>
                <p>
                    Name:
                        <asp:TextBox ID="nameTextBox" runat="server" class="formstyle" placeholder="Name"></asp:TextBox>
                    Description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" class="formstyle" placeholder="Description" Height="200px" TextMode="MultiLine"></asp:TextBox><br />
                    Image:
                        <div id="dropbox">
                            <span class="message">Drop images here to upload.</span>
                        </div>

                    <!-- Including the HTML5 Uploader plugin -->
                    <script src="assets/js/jquery.filedrop.js"></script>
                    <!-- The main script file -->
                    <script src="assets/js/script.js"></script>
                    <br />
                    Difficulty:
                    <asp:TextBox ID="difficultyLabel" runat="server" ClientIDMode="Static"></asp:TextBox>
                    <%--<input type="text" id="amount" />--%>
                </p>
                <div id="slider-range-max"></div>

            </div>
        </div>
        <div class="accordion">
            <h2>Location</h2>
            <div>
                <p>
                    Block: 
                    <asp:DropDownList ID="blockDropDownList" runat="server" class="formstyle center">
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
                    </asp:DropDownList><br />
                    Level: 
                        <asp:DropDownList ID="levelDropDownList" runat="server" class="formstyle center">
                            <asp:ListItem Value="1" Text="Level 1" runat="server" />
                            <asp:ListItem Value="2" Text="Level 2" runat="server" />
                            <asp:ListItem Value="3" Text="Level 3" runat="server" />
                            <asp:ListItem Value="4" Text="Level 4" runat="server" />
                            <asp:ListItem Value="5" Text="Level 5" runat="server" />
                            <asp:ListItem Value="6" Text="Level 6" runat="server" />
                            <asp:ListItem Value="7" Text="Level 7" runat="server" />
                            <asp:ListItem Value="u" Text="Uncategorized" runat="server" />
                        </asp:DropDownList><br />
                    <br />

                    Latitude:
                    <asp:TextBox ID="latitudeTextBox" runat="server" class="formstyle width80" placeholder="Latitude" /><br />
                    Longitude:
                    <asp:TextBox ID="longitudeTextBox" runat="server" class="formstyle width80" placeholder="Longitude" /><br />
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
                    <asp:Button ID="verificationCodeButton" runat="server" class="button formstyle" Width="30%" Text="Generate Verification Code!" /><br />
                    <asp:Label ID="Label1" runat="server" Text="TY6fh45"></asp:Label><br />
                    *Important* Hide this together with your Geocache!
                </p>
            </div>
        </div>
        <br />
        <asp:Button ID="createButton" runat="server" class="button formstyle" Width="100%" Text="Create Geocache!" OnClick="createButton_Click" />
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
