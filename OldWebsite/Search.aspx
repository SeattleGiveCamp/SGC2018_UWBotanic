<%@ Page Language="C#" MasterPageFile="~/RareCare.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="_Default" Title="Rare Care Database Search" %>
<asp:Content ID="contentDefault" ContentPlaceHolderID="contentRareCare" Runat="Server">



<%--UWBG Rare Care Database Search web application
Provided by David Campbell

Search Volunteer Opportunities ASP.NET web page
Updated March 26, 2015--%>


<p style="color:Maroon">To log out, completely exit your browser when you are finished.  Because of the sensitive nature of this information, we ask that you not share the password or the contents of this website with anyone else.  Thank you!</p>

    
    <div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 80px; width: 500px; padding: 10px">

        <div style="font-size:large; text-align:right; padding-right: 50px">

            <asp:LinkButton ID="lnkbtnRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnRequests_Click">&nbsp;&nbsp;&nbsp;Review My Requests&nbsp;&nbsp;&nbsp;</asp:LinkButton>
            
            <br /><br />
            <asp:LinkButton ID="lnkbtnAllRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnAllRequests_Click">&nbsp;&nbsp;&nbsp;View Everyone's Assignments&nbsp;&nbsp;&nbsp;</asp:LinkButton>
         
        </div>

    </div>
    
    <hr />
           
    <p>
        <asp:Label ID="lblVolName" runat="server" Font-Size="Large" Text="Volunteer"></asp:Label>&nbsp;&nbsp;
        Volunteer ID:&nbsp;<asp:Label ID="lblVolID" runat="server" Text="ID"></asp:Label></p>

<div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 80px; width: 500px; padding: 10px">

    <h3>Browse Entire List</h3>
    
    <div style="font-size:large; text-align:right; padding-right: 50px">

        <asp:LinkButton ID="lnkbtnBrowse" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnBrowse_Click">&nbsp;&nbsp;&nbsp;Browse&nbsp;&nbsp;&nbsp;</asp:LinkButton>
            
    </div>

</div>

<hr />

<div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 400px; width: 500px; padding: 10px">

    <h3>Search by Region or Phenology <asp:ImageButton ID="imgbtnMapHelp" runat="server" OnClientClick="window.open('helpSearch.html','Rare Care Search Help','width=300,height=300,left=300,top=300')" ImageUrl="~/iconQuestion.png" /></h3>

    <p style="font-size:large">Select one or more criteria:</p>

    <div style="font-size:large; text-align:right; padding-right: 50px">

        Region (e.g. Western): &nbsp;<asp:DropDownList ID="ddlRegion" runat="server" Width="155px" AutoPostBack="True" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged">
            <asp:ListItem Selected="True">No preference</asp:ListItem>
            <asp:ListItem>Western</asp:ListItem>
            <asp:ListItem>Central</asp:ListItem>
            <asp:ListItem>Eastern</asp:ListItem>
            <asp:ListItem>Western: Olympic</asp:ListItem>
            <asp:ListItem>Western: North</asp:ListItem>
            <asp:ListItem>Western: South</asp:ListItem>
            <asp:ListItem>Central: North</asp:ListItem>
            <asp:ListItem>Central: South</asp:ListItem>
            <asp:ListItem>Eastern: North</asp:ListItem>
            <asp:ListItem>Eastern: South</asp:ListItem>
        </asp:DropDownList><br /><br />

        County (e.g. King): &nbsp;<asp:DropDownList ID="ddlCounty" runat="server" AutoPostBack="True" Width="155px">
            <asp:ListItem Selected="True">No preference</asp:ListItem>
            <asp:ListItem>Adams</asp:ListItem>
            <asp:ListItem>Asotin</asp:ListItem>
            <asp:ListItem>Benton</asp:ListItem>
            <asp:ListItem>Chelan</asp:ListItem>
            <asp:ListItem>Clallam</asp:ListItem>
            <asp:ListItem>Clark</asp:ListItem>
            <asp:ListItem>Columbia</asp:ListItem>
            <asp:ListItem>Cowlitz</asp:ListItem>
            <asp:ListItem>Douglas</asp:ListItem>
            <asp:ListItem>Ferry</asp:ListItem>
            <asp:ListItem>Franklin</asp:ListItem>
            <asp:ListItem>Garfield</asp:ListItem>
            <asp:ListItem>Grant</asp:ListItem>
            <asp:ListItem>Grays Harbor</asp:ListItem>
            <asp:ListItem>Island</asp:ListItem>
            <asp:ListItem>Jefferson</asp:ListItem>
            <asp:ListItem>King</asp:ListItem>
            <asp:ListItem>Kitsap</asp:ListItem>
            <asp:ListItem>Kittitas</asp:ListItem>
            <asp:ListItem>Klickitat</asp:ListItem>
            <asp:ListItem>Lewis</asp:ListItem>
            <asp:ListItem>Lincoln</asp:ListItem>
            <asp:ListItem>Mason</asp:ListItem>
            <asp:ListItem>Okanogan</asp:ListItem>
            <asp:ListItem>Pacific</asp:ListItem>
            <asp:ListItem>Pend Oreille</asp:ListItem>
            <asp:ListItem>Pierce</asp:ListItem>
            <asp:ListItem>San Juan</asp:ListItem>
            <asp:ListItem>Skagit</asp:ListItem>
            <asp:ListItem>Skamania</asp:ListItem>
            <asp:ListItem>Snohomish</asp:ListItem>
            <asp:ListItem>Spokane</asp:ListItem>
            <asp:ListItem>Stevens</asp:ListItem>
            <asp:ListItem>Thurston</asp:ListItem>
            <asp:ListItem>Wahkiakum</asp:ListItem>
            <asp:ListItem>Walla Walla</asp:ListItem>
            <asp:ListItem>Whatcom</asp:ListItem>
            <asp:ListItem>Whitman</asp:ListItem>
            <asp:ListItem>Yakima</asp:ListItem>
        </asp:DropDownList><br /><br />
        
        Time of Year (e.g. Spring): &nbsp;<asp:DropDownList ID="ddlSeason" runat="server" AutoPostBack="True" Width="155px" OnSelectedIndexChanged="ddlSeason_SelectedIndexChanged">
            <asp:ListItem Selected="True">No preference</asp:ListItem>
            <asp:ListItem>Early Spring</asp:ListItem>
            <asp:ListItem>Spring</asp:ListItem>
            <asp:ListItem>Summer</asp:ListItem>
            <asp:ListItem>Fall</asp:ListItem>
        </asp:DropDownList><br /><br />
        
        Month (e.g. May): &nbsp;<asp:DropDownList ID="ddlMonths" runat="server" AutoPostBack="True" Width="155px">
            <asp:ListItem Selected="True">No preference</asp:ListItem>
            <asp:ListItem>January</asp:ListItem>
            <asp:ListItem>February</asp:ListItem>
            <asp:ListItem>March</asp:ListItem>
            <asp:ListItem>April</asp:ListItem>
            <asp:ListItem>May</asp:ListItem>
            <asp:ListItem>June</asp:ListItem>
            <asp:ListItem>July</asp:ListItem>
            <asp:ListItem>August</asp:ListItem>
            <asp:ListItem>September</asp:ListItem>
            <asp:ListItem>October</asp:ListItem>
            <asp:ListItem>November</asp:ListItem>
            <asp:ListItem>December</asp:ListItem>
        </asp:DropDownList><br /><br />
        
        Priority (e.g. highest): &nbsp;<asp:DropDownList ID="ddlPriority" runat="server" AutoPostBack="True" Width="155px">
            <asp:ListItem Selected="True">No preference</asp:ListItem>
            <asp:ListItem>Highest</asp:ListItem>
            <asp:ListItem>Medium</asp:ListItem>
            <asp:ListItem>Lower</asp:ListItem>
		<asp:ListItem>SEED</asp:ListItem>
        </asp:DropDownList><br /><br />
        
        Ease of ID (e.g. easy): &nbsp;<asp:DropDownList ID="ddlEase" runat="server" AutoPostBack="True" Width="155px">
            <asp:ListItem Selected="True">No preference</asp:ListItem>
            <asp:ListItem>Easy</asp:ListItem>
            <asp:ListItem>Moderate</asp:ListItem>
            <asp:ListItem>Challenging</asp:ListItem>
            <asp:ListItem>Technical Key</asp:ListItem>
        </asp:DropDownList><br /><br />
        
        <asp:LinkButton ID="lnkbtnSearchRegion" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnSearchRegion_Click">&nbsp;&nbsp;&nbsp;Search&nbsp;&nbsp;&nbsp;</asp:LinkButton>
            
     </div>

</div>

<hr />

<div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 225px; width: 500px; padding: 10px">

    <h3>Search by Species <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="window.open('helpSearch.html','Rare Care Search Help','width=300,height=300,left=300,top=300')" ImageUrl="~/iconQuestion.png" /></h3>

    <p style="font-size:large">Select one or more criteria:</p>
    
    <div style="font-size:large; text-align:right; padding-right: 50px">
        
        Genus Only (e.g. <span style="font-style:italic">Carex</span>): &nbsp;<asp:TextBox ID="txtGenus" runat="server" AutoPostBack="True" OnClick="this.value=''" OnTextChanged="txtGenus_TextChanged">No preference</asp:TextBox><br /><br />
        
        Species (e.g. <span style="font-style:italic">Carex pauciflora</span>): &nbsp;<asp:DropDownList
            ID="ddlSpecies" runat="server" AutoPostBack="True" DataSourceID="accessdatasrcSpecies" DataTextField="Species" DataValueField="Species" Width="155px" AppendDataBoundItems="false">
            <asp:ListItem>No preference</asp:ListItem>
        </asp:DropDownList><asp:SqlDataSource ID="accessdatasrcSpecies" runat="server" ConnectionString="<%$ ConnectionStrings:WORM2007 %>"
            ProviderName="<%$ ConnectionStrings:WORM2007.ProviderName %>" SelectCommand="SELECT DISTINCT [Species] FROM [VolunteerOpportunities] WHERE [Species] LIKE '%' + @Species + '%' AND [Assigned] = 'FALSE' ORDER BY [Species]">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtGenus" Name="Species" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br />
        
        <span style="font-size: x-small">After entering Genus, it may be necessary to click Search twice:</span>
        <asp:LinkButton ID="lnkbtnSearchSpecies" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnSearchSpecies_Click">&nbsp;&nbsp;&nbsp;Search&nbsp;&nbsp;&nbsp;</asp:LinkButton>
    </div>

</div>


    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Maroon"></asp:Label>
    <br />

</asp:Content>

