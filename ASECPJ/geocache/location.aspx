<%@ Page Title="" Language="C#" MasterPageFile="~/geocache/1column-geocache.master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="ASECPJ.geocache.location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function pageLoad(sender, args) {
            $('#tabs').tabs({
                collapsible: true,
                fx: { opacity: 'toggle', duration: 500 },
                show: function (event, ui) {
                    google.maps.event.trigger(map, 'resize');
                }
            });
        };

    </script>

    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <style>
        #canvas {
            width: 100%;
            height: 500px;
            overflow: visible;
        }

        .width80 {
            width: 80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <header>
                <h1>Geocaches Nearby</h1>

                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Locate me!</a></li>
                        <li><a href="#tabs-2">Manual lookup</a></li>
                    </ul>
                    <div id="tabs-1">
                        <p id="demo"></p>
                        <asp:Button ID="Button" runat="server" Text="Locate me!" class="button formstyle" Width="100%" OnClientClick="javascript: getLocation(); return false;" />
                        <div id="mapholder"></div>
                        <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
                        <script>
                            var x = document.getElementById("demo");
                            function getLocation() {
                                if (navigator.geolocation) {
                                    navigator.geolocation.getCurrentPosition(showPosition, showError);
                                }
                                else { x.innerHTML = "Geolocation is not supported by this browser."; }
                            }

                            function showPosition(position) {
                                lat = position.coords.latitude;
                                lon = position.coords.longitude;
                                latlon = new google.maps.LatLng(lat, lon)
                                mapholder = document.getElementById('mapholder')
                                mapholder.style.height = '500px';
                                mapholder.style.width = '100%';

                                var myOptions = {
                                    center: latlon, zoom: 14,
                                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                                    mapTypeControl: false,
                                    navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
                                };
                                var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
                                var marker = new google.maps.Marker({ position: latlon, map: map, title: "You are here!" });

                                document.getElementById('<%= latitudeTextBox.ClientID %>').value = lat;
                                document.getElementById('<%= longitudeTextBox.ClientID %>').value = lon;
                            }

                            function showError(error) {
                                switch (error.code) {
                                    case error.PERMISSION_DENIED:
                                        x.innerHTML = "User denied the request for Geolocation."
                                        break;
                                    case error.POSITION_UNAVAILABLE:
                                        x.innerHTML = "Location information is unavailable."
                                        break;
                                    case error.TIMEOUT:
                                        x.innerHTML = "The request to get user location timed out."
                                        break;
                                    case error.UNKNOWN_ERROR:
                                        x.innerHTML = "An unknown error occurred."
                                        break;
                                }
                            }
                        </script>
                    </div>

                    <div id="tabs-2">
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
                <div>
                    <p>
                        <%--Latitude:
                <input id="latitude" type="text" value="" class="formstyle width80" placeholder="Latitude" /><br />
                Longitude:
                <input id="longitude" type="text" value="" class="formstyle width80" placeholder="Latitude" /><br />--%>

                Latitude:
                    <asp:TextBox ID="latitudeTextBox" runat="server" class="formstyle width80" placeholder="Latitude" />
                        <asp:RequiredFieldValidator ID="latitudeTextBoxRequiredFieldValidator" CssClass="validator" ControlToValidate="latitudeTextBox" runat="server" ErrorMessage="*Required field"></asp:RequiredFieldValidator><br />
                        Longitude:
                    <asp:TextBox ID="longitudeTextBox" runat="server" class="formstyle width80" placeholder="Longitude" />
                        <asp:RequiredFieldValidator ID="longitudeTextBoxRequiredFieldValidator" CssClass="validator" ControlToValidate="longitudeTextBox" runat="server" ErrorMessage="*Required field"></asp:RequiredFieldValidator><br />
                        <asp:Button ID="searchButton" runat="server" class="button formstyle" Width="100%" Text="Search" OnClick="searchButton_Click" />
                    </p>
                </div>
                <br />
                <br />

                <asp:SqlDataSource ID="SqlDataSource_Near" runat="server" ConnectionString="<%$ ConnectionStrings:asecpjConnectionString %>" ProviderName="<%$ ConnectionStrings:asecpjConnectionString.ProviderName %>"></asp:SqlDataSource>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource_Near" DataKeyNames="geocacheId">

                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td><p>Search for geocaches near you!</p></td>
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
                            <td>
                                <p>
                                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:Label ID="distanceLabel" runat="server" Text='<%# getDistance(Eval("distance")) %>' />
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
                                                <p>Name</p>
                                            </th>
                                            <th id="Th2" runat="server">
                                                <p>Date Created</p>
                                            </th>
                                            <th id="Th3" runat="server">
                                                <p>Created By</p>
                                            </th>
                                            <th id="Th4" runat="server">
                                                <p>Distance</p>
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
            </header>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
