<%@ Page Title="" Language="C#" MasterPageFile="~/geocache/1column-geocache.master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="ASECPJ.geocache.location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".accordion").accordion({
                active: false,
                collapsible: true,
                heightStyle: "content",
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header>
        <h1>Geocaches Nearby</h1>
        <div class="accordion">
            <h2>Locate me!</h2>
            <div>
                Latitude:
                <asp:TextBox ID="latitudeTextBox" class="formstyle" Width="80%" placeholder="Latitude" runat="server"></asp:TextBox><br />
                Longitude:
                <asp:TextBox ID="longitudeTextBox" class="formstyle" Width="80%" placeholder="Longitude" runat="server"></asp:TextBox>
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
                        mapholder.style.height = '400px';
                        mapholder.style.width = '100%';

                        var myOptions = {
                            center: latlon, zoom: 14,
                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                            mapTypeControl: false,
                            navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL }
                        };
                        var map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
                        var marker = new google.maps.Marker({ position: latlon, map: map, title: "You are here!" });

                        var x = document.getElementById('<%= latitudeTextBox.ClientID %>');
                        var y = document.getElementById("<%= longitudeTextBox.ClientID %>");
                        x.value = lat;
                        y.value = lon;
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

            <h2>Manual selection</h2>
            <div>
                Latitude:
                <asp:TextBox ID="manualLatitudeTextBox" class="formstyle" Width="80%" placeholder="Latitude" runat="server"></asp:TextBox><br />
                Longitude:
                <asp:TextBox ID="manualLongitudeTextBox" class="formstyle" Width="80%" placeholder="Longitude" runat="server"></asp:TextBox>
            </div>
        </div>
    </header>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
