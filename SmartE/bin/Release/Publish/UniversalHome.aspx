<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="UniversalHome.aspx.cs" Inherits="SmartE.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Banner -->
    <section id="banner">
        <div class="inner">
            <h1>Smart-Elector</h1>
            <p>
                Think RIGHT! Vote RIGHT!<br />
                Your vote can make a difference
            </p>
        </div>
        <video autoplay loop muted playsinline src="images/banner.mp4"></video>
    </section>

    <!-- Highlights -->
    <section class="wrapper">
        <div class="inner">
            <header class="special">
                <h2>THE FREEDON TO CHOOSE BEST!</h2>
                <p>
                    We believe that anything is possible with the right platform.
Whether you want to make a right decision or you want to choose a right candidate for your bright future.
We have got you every thing covered.
                </p>
                <br />

                    <h3>ISN'T THAT GREAT!</h3>

            </header>
            <div class="highlights">
                <section>
                    <div class="content">
                        <header>
                            <a href="#" class="icon fa-vcard-o"><span class="label">Icon</span></a>
                            <h3>Login</h3>
                        </header>
                        <p>Login and get the benefits from SmartElector</p>
                    </div>
                </section>
                <section>
                    <div class="content">
                        <header>
                            <a href="#" class="icon fa-files-o"><span class="label">Icon</span></a>
                            <h3>New? Register</h3>
                        </header>
                        <p>New memebrs can register themself and can be a part of Smart-Elector Family</p>
                    </div>
                </section>
                <section>
                    <div class="content">
                        <header>
                            <a href="#" class="icon fa-floppy-o"><span class="label">Icon</span></a>
                            <h3>Donations</h3>
                        </header>
                        <p>If you are interested in supporting you may donate for the nobel cause or fund for the society</p>
                    </div>
                </section>
                <section>
                    <div class="content">
                        <header>
                            <a href="#" class="icon fa-line-chart"><span class="label">Icon</span></a>
                            <h3>Dashboard</h3>
                        </header>
                        <p>EASY TO READ: Results are displayed through graph and bar.</p>
                    </div>
                </section>
                <section>
                    <div class="content">
                        <header>
                            <a href="#" class="icon fa-paper-plane-o"><span class="label">Icon</span></a>
                            <h3>FAQs</h3>
                        </header>
                        <p>Connect to our FAQs page to quick access</p>
                    </div>
                </section>
                <section>
                    <div class="content">
                        <header>
                            <a href="#" class="icon fa-qrcode"><span class="label">Icon</span></a>
                            <h3>Questions?</h3>
                        </header>
                        <p>Send us and email and we will get back to us soon</p>
                    </div>
                </section>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section id="cta" class="wrapper">
        <div class="inner">
            <h2>Mōhiotanga</h2>
            <p>
                <b>Knowledge, intelligence, awareness or insight<br />
                    When dealing with people, remember you are not dealing with creatures of logic, but with creatures of emotion. -Dale Carnegie</b>
            </p>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="wrapper">
        <div class="inner">
            <header class="special">
                <h2>Testimonials From Clients</h2>
                
            </header>
            <div class="testimonials">
                <section>
                    <div class="content">
                        <blockquote>
                            <p>Smart Elector Team is doing a Fabulous job.</p>
                        </blockquote>
                        <div class="author">
                            <div class="image">
                                <img src="images/pic01.jpg" alt="" />
                            </div>
                            <p class="credit">- <strong>Jane Doe</strong> <span>CEO - ABC Inc.</span></p>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="content">
                        <blockquote>
                            <p>SmartElector UI is improving alot and they are doing a great progress</p>
                        </blockquote>
                        <div class="author">
                            <div class="image">
                                <img src="images/pic03.jpg" alt="" />
                            </div>
                            <p class="credit">- <strong>John Doe</strong> <span>CEO - ABC Inc.</span></p>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="content">
                        <blockquote>
                            <p>Smart-Elector is a fabulos website which aims at connecting the candidates and electors</p>
                        </blockquote>
                        <div class="author">
                            <div class="image">
                                <img src="images/pic02.jpg" alt="" />
                            </div>
                            <p class="credit">- <strong>Janet Smith</strong> <span>CEO - ABC Inc.</span></p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>

<%--    <div style="width:1200px; margin-left:100px; margin-right:100px">
        <hr />
        <br />
        
        <table border="0" cellpadding="25px" cellspacing="25px" >
            <tr>
                <td style="height: 300px; width: 40%; ">
                  <asp:Panel runat="server" class="img" BackImageUrl="~/images/vote29.JPG"><h2 class="img" style="height: 281px; text-align: left;"><strong><a href="Login.aspx" style="text-decoration:none; color:azure; font-size:xx-large"><br /><br /><br />Login</a></strong></h2></asp:Panel>
                </td>
                <td class="tabletxt">
                    <h2 class="header">The Freedon to Choose BEST!</h2>
                    <p class="txt">
                        We believe that anything is possible with the right platform.<br />
                        Whether you want to make a right decision or you want to choose a right candidate for your bright future.<br />
                        We have got you every thing covered.
                        <br />
                        <br />
                        <center><h2 class="header">Isn&#39;t that great!</h2></center>
                </td>
            </tr>
            <tr>
                <td class="tabletxt">
                    <p class="txt" style="width: 421px">Electors can register them for free to explore the candidates profile and their released manfestoes.</p>
                </td>
                <td style="height: 300px; width: 40%;">
                   <asp:Panel runat="server" BackImageUrl="~/images/vote20.JPG" class="img" Height="364px"> </asp:Panel></td>
            </tr>
            <tr>
                <td style="width: 40%;">&nbsp;
                    <asp:Panel ID="Panel1" runat="server" class="img" BackImageUrl="~/images/vote31.JPG" Height="318px" Width="494px"></asp:Panel>
                </td>
                <td class="tabletxt">
                    <h2 class="header">Voting Process:</h2>
                    <p class="txt">
                        - Enrollment Of Electors<br />
                        - Pre-Registration For Online Voting<br />
                        - Authenticating
                        <br />
                        - Casting & Counting A Vote<br />
                    </p>  
                </td>
            </tr>
        </table>
        

        <br />
       <br />
        <br />
    </div>--%>
</asp:Content>

