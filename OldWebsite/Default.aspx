<%@ Page Language="C#" MasterPageFile="~/RareCare.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="UWBG Rare Care Database" %>
<asp:Content ID="contentDefault" ContentPlaceHolderID="contentRareCare" Runat="Server">


<%--UWBG Rare Care Database Search web application
Provided by David Campbell

Default ASP.NET web page
Updated October 22, 2013--%>

<!--Temporary alert message
<p style="color:red">OUTAGE NOTIFICATION:  Rare Care’s monitoring signup webpages will be temporarily unavailable from <span style="font-weight:bold">7AM February 23 to 5PM February 24</span> due to system maintenance.  We apologize for the inconvenience.</p>-->


<div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 300px; width: 500px; padding: 10px">
    <asp:Panel ID="pnlFind" runat="server" Height="400px" Width="500px" DefaultButton="lnkbtnFindMe">
    
    <h2>Select your Volunteer Record <asp:ImageButton ID="imgbtnMapHelp" runat="server" OnClientClick="window.open('helpDefault.html','Rare Care Volunteer Record Help','width=300,height=300,left=300,top=300')" ImageUrl="~/iconQuestion.png" /></h2>

    
    <div style="font-size:large; text-align:right; padding-right: 50px">
    
    Enter your last name: &nbsp;

        <asp:TextBox ID="txtLastName" runat="server" AutoPostBack="true"></asp:TextBox>
        <asp:LinkButton ID="lnkbtnFindMe" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnFindMe_Click">Find Me</asp:LinkButton>
        
    <br />
    <br />
    Then select your specific record: &nbsp;   
        <asp:DropDownList ID="listContact" runat="server" DataSourceID="accessdatasrcWORMVol" AppendDataBoundItems="false" DataTextField="ListItem" DataValueField="PersonID" Width="145px">
        </asp:DropDownList>
        <asp:SQLDataSource ID="accessdatasrcWORMVol" runat="server"
            ConnectionString="<%$ ConnectionStrings:WORM2007 %>" ProviderName="<%$ ConnectionStrings:WORM2007.ProviderName %>" 
            SelectCommand="SELECT [PersonID], [FirstName] + ' ' + [LastName] AS ListItem FROM [Person] WHERE ([LastName] = @LastName AND [Volunteer] = 'True' And Active = 'True' And (Monitor = 'True' Or AssistantMonitor = 'True'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtLastName" Name="LastName" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:SQLDataSource>
     <br />
     <br />
    
        <asp:LinkButton ID="lnkbtnProceed" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnProceed_Click">&nbsp;&nbsp;&nbsp;Proceed to Search&nbsp;&nbsp;&nbsp;</asp:LinkButton>
        
        <br /><br />
        <asp:LinkButton ID="lnkbtnRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnRequests_Click">&nbsp;&nbsp;&nbsp;Review My Requests&nbsp;&nbsp;&nbsp;</asp:LinkButton>

        <br /><br />
        <asp:LinkButton ID="lnkbtnAllRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnAllRequests_Click">&nbsp;&nbsp;&nbsp;View Everyone's Assignments&nbsp;&nbsp;&nbsp;</asp:LinkButton>
    
        </div> <!--text align right-->
        
         
       </asp:Panel> 

</div>

<br />
<br />
<asp:Label ID="lblMessage" runat="server" Font-Size="Large" ForeColor="Maroon"></asp:Label>
       

</asp:Content>

