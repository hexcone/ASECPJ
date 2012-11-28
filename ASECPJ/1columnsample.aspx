<%@ Page Title="" Language="C#" MasterPageFile="~/master/1column.master" AutoEventWireup="true" CodeBehind="1columnsample.aspx.cs" Inherits="ASECPJ._1columnsample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="subnav">
        <table>
            <tr>
                <td><a href="#top">HOME</a></td>
                <td><a href="#about">About</a></td>
                <td><a href="#work">Work</a></td>
                <td><a href="#footer">Contact</a></td>
            </tr>
        </table>
    </div>

    <header>
        <!-- Work Showcase Section Start -->

        <h1>Skies Of Spain</h1>
        <!-- Title of project -->
        <h2>photography</h2>
        <!-- Category of project -->
        <!-- Description of project start -->
        <p>Spain has always been a favorite country of mine because of the absolutely stunning skies. I am mesmerized by the dazzling colours and it is one of my favorite places to take photos. Below are my three favorite photographs that I have taken of this glorious setting.</p>
        <!-- Description of project end -->
    </header>

    <section id="workbody">
        <!-- Project images start -->
        <img src="images/work/SkiesOfSpain/sky1.JPG" alt="sky1"><!-- Use whatever images you like - they will automatically fit the width of the page -->
        <h5>&ndash; Volcanic Skies</h5>
        <!-- Image title -->
        <img src="images/work/SkiesOfSpain/sky2.JPG" alt="sky2"><!-- Use whatever images you like - they will automatically fit the width of the page -->
        <h5>&ndash; Godly Light</h5>
        <!-- Image title -->
        <img src="images/work/SkiesOfSpain/sky3.JPG" alt="sky3"><!-- Use whatever images you like - they will automatically fit the width of the page -->
        <h5>&ndash; Pale Evening</h5>
        <!-- Image title -->
    </section>
    <!-- Project images end -->

    <hr />
    <!-- Horizontal Line -->



    <section id="work">
        <!-- Work Links Section Start -->
        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item.png" alt="image 1"></a><!-- Image must be 400px by 300px -->
            <h3>Skies Of Spain</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item2.png" alt="image 2"></a><!-- Image must be 400px by 300px -->
            <h3>Beautiful Bahrain</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item3.png" alt="image 3"></a><!-- Image must be 400px by 300px -->
            <h3>Wild Stripes</h3>
            <!--Title-->
            <p>photo manipulation</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item4.png" alt="image 4"></a><!-- Image must be 400px by 300px -->
            <h3>Lazy Days</h3>
            <!--Title-->
            <p>photo manipulation</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item5.png" alt="image 5"></a><!-- Image must be 400px by 300px -->
            <h3>Trapped</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item6.png" alt="image 6"></a><!-- Image must be 400px by 300px -->
            <h3>Quad-Core</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item7.png" alt="image 7"></a><!-- Image must be 400px by 300px -->
            <h3>Retro Blast</h3>
            <!--Title-->
            <p>illustration</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item8.png" alt="image 8"></a><!-- Image must be 400px by 300px -->
            <h3>Gates Of The Sun</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item9.png" alt="image 9"></a><!-- Image must be 400px by 300px -->
            <h3>Winter Touch</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="images/work/thumbs/item10.png" alt="image 10"></a><!-- Image must be 400px by 300px -->
            <h3>Burn</h3>
            <!--Title-->
            <p>photo manipulation</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="clearfix"></div>
    </section>
    <!-- Work Links Section End -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
