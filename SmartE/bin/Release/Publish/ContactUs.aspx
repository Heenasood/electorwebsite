<%@ Page Title="" Language="C#" MasterPageFile="~/UniversalSite.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SmartE.WebForm14" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="heading">
        <h1>Contact Us</h1>
    </div>
    <div style="margin-left:220px; margin-right:220px">
        <table class="auto-style7">

            <tr>

                <td style="width: 578px">
                    <h3 class="txt">Thank you for using Smart Elector! </h3>
                    <h3><b>Address:</b></h3>
                    <h3><b>New Zealand</b><br />
                        28A, Linwood Ave, Mount Albert, Auckland<br />
                        Monday-Friday 7:30AM - 6.00PM
                    </h3>
                </td>

            </tr>
            

        </table>

    </div>
    <div style="margin-left:220px; margin-right:220px">
         <!--The div element for the map -->
                    <div id="map"></div>
                    <script>
                        // Initialize and add the map
                        function initMap() {
                            // The location of Uluru
                            var uluru = { lat: -36.874148, lng: 174.722578 };
                            // The map, centered at Uluru
                            var map = new google.maps.Map(
                                document.getElementById('map'), { zoom: 16, center: uluru });
                            // The marker, positioned at Uluru
                            var marker = new google.maps.Marker({ position: uluru, map: map });
                        }
                    </script>
                    <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5PwtVT503Ru-G31GloZTVBKT3gKl4yrU&callback=initMap">
                    </script>
    </div>
</asp:Content>
