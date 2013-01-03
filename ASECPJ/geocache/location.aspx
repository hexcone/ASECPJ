<%@ Page Title="" Language="C#" MasterPageFile="~/geocache/1column-geocache.master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="ASECPJ.geocache.location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $('#tabs').tabs({
                collapsible: true,
                fx: { opacity: 'toggle', duration: 500 },
                show: function (event, ui) {
                    google.maps.event.trigger(map, 'resize');
                }
            });

        });


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
    <header>
        <h1>Geocaches Nearby</h1>
        <div>
            <p>
                Latitude:
                <input id="latitude" type="text" value="" class="formstyle width80" placeholder="Latitude" /><br />
                Longitude:
                <input id="longitude" type="text" value="" class="formstyle width80" placeholder="Latitude" /><br />
            </p>
        </div>
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

                        latitude.value = lat;
                        longitude.value = lon;
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
                <script type="text/javascript" src="gmap.js"></script>
            </div>

        </div>
        <br /><br />

        <div>
            <table style="border: 1px solid black; width: 100%;">
                <tr>
                    <th>
                        <p>Description</p>
                    </th>
                    <th>
                        <p>Placed</p>
                    </th>
                    <th>
                        <p>Found</p>
                    </th>
                    <th>
                        <p>Distance</p>
                    </th>
                </tr>
                <tr>
                    <td>
                        <p>
                            <a href="view.aspx">Gator Bait CITO</a><br />
                            by <a href="#">DoTheNumbers</a> | Block L
                        </p>
                    </td>
                    <td>
                        <p>9 Mar 13</p>
                    </td>
                    <td>
                        <p>0 times</p>
                    </td>
                    <td>
                        <p>400 meters away</p>
                    </td>
                </tr>
            </table>
        </div>





    </header>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
