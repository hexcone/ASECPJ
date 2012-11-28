<%@ Page Title="" Language="C#" MasterPageFile="~/master/2column.master" AutoEventWireup="true" CodeBehind="2columnsample.aspx.cs" Inherits="ASECPJ._2columnsample" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenttop" runat="server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentleft" runat="server">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentright" runat="server">
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
