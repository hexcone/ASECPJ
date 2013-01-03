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
                    $("#amount").val(ui.value);
                }
            });
            $("#amount").val($("#slider-range-max").slider("value"));
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <header>
        <h1>Hide A Geocache</h1>
        <div class="accordion">
            <h2>Information</h2>
            <div>
                <p>
                    Name:
                        <asp:TextBox ID="subjectTextBox" runat="server" class="formstyle" placeholder="Name"></asp:TextBox>
                    Description:
                        <asp:TextBox ID="commentTextBox" runat="server" class="formstyle" placeholder="Description" Height="200px" TextMode="MultiLine"></asp:TextBox>
                    Image:
                        <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                    <br />
                    Difficulty:
                    <input type="text" id="amount" />
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
                        <asp:ListItem Value="aListItem" Text="Block A" runat="server" />
                        <asp:ListItem Value="bListItem" Text="Block B" runat="server" />
                        <asp:ListItem Value="cListItem" Text="Block C" runat="server" />
                        <asp:ListItem Value="dListItem" Text="Block D" runat="server" />
                        <asp:ListItem Value="eListItem" Text="Block E" runat="server" />
                        <asp:ListItem Value="fListItem" Text="Block F" runat="server" />
                        <asp:ListItem Value="gListItem" Text="Block G" runat="server" />
                        <asp:ListItem Value="hListItem" Text="Block H" runat="server" />
                        <asp:ListItem Value="jListItem" Text="Block J" runat="server" />
                        <asp:ListItem Value="kListItem" Text="Block K" runat="server" />
                        <asp:ListItem Value="lListItem" Text="Block L" runat="server" />
                        <asp:ListItem Value="mListItem" Text="Block M" runat="server" />
                        <asp:ListItem Value="nListItem" Text="Block N" runat="server" />
                        <asp:ListItem Value="pListItem" Text="Block P" runat="server" />
                        <asp:ListItem Value="qListItem" Text="Block Q" runat="server" />
                        <asp:ListItem Value="rListItem" Text="Block R" runat="server" />
                        <asp:ListItem Value="sListItem" Text="Block S" runat="server" />
                        <asp:ListItem Value="unBlockListItem" Text="Uncategorized" runat="server" />
                    </asp:DropDownList><br />
                    Level: 
                        <asp:DropDownList ID="levelDropDownList" runat="server" class="formstyle center">
                            <asp:ListItem Value="level1ListItem" Text="Level 1" runat="server" />
                            <asp:ListItem Value="level2ListItem" Text="Level 2" runat="server" />
                            <asp:ListItem Value="level3ListItem" Text="Level 3" runat="server" />
                            <asp:ListItem Value="level4ListItem" Text="Level 4" runat="server" />
                            <asp:ListItem Value="level5ListItem" Text="Level 5" runat="server" />
                            <asp:ListItem Value="level6ListItem" Text="Level 6" runat="server" />
                            <asp:ListItem Value="level7ListItem" Text="Level 7" runat="server" />
                            <asp:ListItem Value="unLevelListItem" Text="Uncategorized" runat="server" />
                        </asp:DropDownList><br />
                    <br />

                    Latitude:
                <input id="latitude" type="text" value="" class="formstyle width80" placeholder="Latitude" /><br />
                    Longitude:
                <input id="longitude" type="text" value="" class="formstyle width80" placeholder="Latitude" /><br />
                </p>
                <div id="canvas"></div>
                <br />
                <script type="text/javascript" src="gmap.js"></script>

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
        <asp:Button ID="createButton" runat="server" class="button formstyle" Width="100%" Text="Create Geocache!" />
    </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
