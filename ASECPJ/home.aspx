<%@ Page Title="" Language="C#" MasterPageFile="~/master/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ASECPJ.home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="../scripts/jquery.carouFredSel-5.5.2.js"></script>
    <script type="text/javascript" src="../scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="../scripts/jquery.form.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header>
        <!-- Header Title Start -->
        <h1>Hello there, I'm <span>&quot;Your Name&quot;</span>. Welcome to my design portfolio!</h1>
        <h2>&ndash; Photographer and Web Developer &ndash;</h2>
    </header>
    <!-- Header Title End -->
    <section id="slideshow">
        <!-- Slideshow Start -->
        <div class="html_carousel">
            <div id="slider">

                <div class="slide">
                    <img src="../images/slideshow/sliderimage1.jpg" width="3000" height="783" alt="image 1" /><!-- Replace these images with your own but make sure they are 3000px wide and 783px high or the same ration -->
                </div>
                <!--/slide-->

                <div class="slide">
                    <img src="../images/slideshow/sliderimage2.jpg" width="3000" height="783" alt="image 2" /><!-- Replace these images with your own but make sure they are 3000px wide and 783px high or the same ration -->
                </div>
                <!--/slide-->

                <div class="slide">
                    <img src="../images/slideshow/sliderimage3.jpg" width="3000" height="783" alt="image 3" /><!-- Replace these images with your own but make sure they are 3000px wide and 783px high or the same ration -->
                </div>
                <!--/slide-->

            </div>
            <!--/slider-->
            <div class="clearfix"></div>
        </div>
        <!--/html_carousel-->
    </section>
    <!-- Slideshow End -->


    <aside id="about" class=" left">
        <!-- Text Section Start -->
        <h3>about me</h3>
        <!-- Replace all text with what you want -->
        <p>Hey there, my name is &quot;Your Name&quot; and I am a photographer and web developer! This is my brand new portfolio. It's super cool because it's completely responsive! That means you can re-size it to whatever size you like and it always looks great. Have a look around and enjoy.</p>
    </aside>
    <aside class="right">
        <h3>my work</h3>
        <p>Below, you will be able to find lots of my work. I take loads of pretty pictures and I also make websites. If you like what you see then you can contact me below! Maybe you would like to hire me or just have a chat, either way, I look forward to hearing from you.</p>
    </aside>
    <div class="clearfix"></div>
    <!-- Text Section End -->

    <div>
    <section id="work">
        <!-- Work Links Section Start -->
        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item.png" alt="image 1" /></a><!-- Image must be 400px by 300px -->
            <h3>Skies Of Spain</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item2.png" alt="image 2"/></a><!-- Image must be 400px by 300px -->
            <h3>Beautiful Bahrain</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item3.png" alt="image 3" /></a><!-- Image must be 400px by 300px -->
            <h3>Wild Stripes</h3>
            <!--Title-->
            <p>photo manipulation</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item4.png" alt="image 4" /></a><!-- Image must be 400px by 300px -->
            <h3>Lazy Days</h3>
            <!--Title-->
            <p>photo manipulation</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item5.png" alt="image 5" /></a><!-- Image must be 400px by 300px -->
            <h3>Trapped</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item6.png" alt="image 6" /></a><!-- Image must be 400px by 300px -->
            <h3>Quad-Core</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item7.png" alt="image 7" /></a><!-- Image must be 400px by 300px -->
            <h3>Retro Blast</h3>
            <!--Title-->
            <p>illustration</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item8.png" alt="image 8" /></a><!-- Image must be 400px by 300px -->
            <h3>Gates Of The Sun</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item9.png" alt="image 9" /></a><!-- Image must be 400px by 300px -->
            <h3>Winter Touch</h3>
            <!--Title-->
            <p>photography</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="item">
            <a href="work-template.html">
                <img src="../images/work/thumbs/item10.png" alt="image 10" /></a><!-- Image must be 400px by 300px -->
            <h3>Burn</h3>
            <!--Title-->
            <p>photo manipulation</p>
            <!--Category-->
        </div>
        <!--/item-->

        <div class="clearfix"></div>
    </section>
    <!-- Work Links Section End -->


    <section id="bottom">
        <!-- Last Words Section Start -->
        <h3>Thanks for looking at my new website!</h3>
    </section>
    <!-- Last Words Section End-->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- SLIDESHOW SCRIPT START -->
    <script type="text/javascript">
        $("#slider").carouFredSel({
            responsive: true,
            scroll: {
                fx: "crossfade",
                easing: "swing",
                duration: 1000,

            },
            items: {
                visible: 1,
                height: "27%"
            }
        });
    </script>
    <!-- SLIDESHOW SCRIPT END -->
</asp:Content>
