<%@ Page Title="" Language="C#" MasterPageFile="~/master/2column.master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="ASECPJ.geocache.view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $("#accordion").accordion({
                collapsible: true,
                heightStyle: "content",
                event: "click hoverintent"
            });
        });

        var cfg = ($.hoverintent = {
            sensitivity: 7,
            interval: 100
        });

        $.event.special.hoverintent = {
            setup: function () {
                $(this).bind("mouseover", jQuery.event.special.hoverintent.handler);
            },
            teardown: function () {
                $(this).unbind("mouseover", jQuery.event.special.hoverintent.handler);
            },
            handler: function (event) {
                var that = this,
                    args = arguments,
                    target = $(event.target),
                    cX, cY, pX, pY;

                function track(event) {
                    cX = event.pageX;
                    cY = event.pageY;
                };
                pX = event.pageX;
                pY = event.pageY;
                function clear() {
                    target
                        .unbind("mousemove", track)
                        .unbind("mouseout", arguments.callee);
                    clearTimeout(timeout);
                }
                function handler() {
                    if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) {
                        clear();
                        event.type = "hoverintent";
                        // prevent accessing the original event since the new event
                        // is fired asynchronously and the old event is no longer
                        // usable (#6028)
                        event.originalEvent = {};
                        jQuery.event.handle.apply(that, args);
                    } else {
                        pX = cX;
                        pY = cY;
                        timeout = setTimeout(handler, cfg.interval);
                    }
                }
                var timeout = setTimeout(handler, cfg.interval);
                target.mousemove(track).mouseout(clear);
                return true;
            }
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenttop" runat="server">
    <div class="subnav">
        <table>
            <tr>
                <td><a href="#top">Geocache</a></td>
                <td><a href="#about">Finds</a></td>
                <td><a href="#work">Location</a></td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentleft" runat="server">
    <header>
        <h1>Geocache</h1>
        <table style="border: 1px solid black; width: 100%;">
            <tr>
                <th>Description</th>
                <th>Placed</th>
                <th>Found</th>
            </tr>
            <tr>
                <td><a href="#">Gator Bait CITO</a><br />
                    by DoTheNumbers | GC3XY7P | Alabama </td>
                <td>9 Mar 13 </td>
                <td>0 times</td>
            </tr>
        </table>
    </header>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentright" runat="server">
    <header>
        <div id="accordion">
            <h2>Section 1</h2>
            <div>
                <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
            </div>
            <h2>Section 2</h2>
            <div>
                <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
            </div>
            <h2>Section 3</h2>
            <div>
                <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui. </p>
                <ul>
                    <li>List item one</li>
                    <li>List item two</li>
                    <li>List item three</li>
                </ul>
            </div>
        </div>
    </header>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
