<%@ Page Language="C#" MasterPageFile="~/RareCareTable.master" AutoEventWireup="true" CodeFile="Results.aspx.cs" Inherits="Results" Title="Rare Care Database Results" %>
<asp:Content ID="cntResults" ContentPlaceHolderID="contentRareCare" Runat="Server">



<%--UWBG Rare Care Database Search web application
Provided by David Campbell

Search Results ASP.NET web page
Updated October 25, 2013--%>


<p style="color:Maroon">To log out, completely exit your browser when you are finished.  Because of the sensitive nature of this information, we ask that you not share the password or the contents of this website with anyone else.  Thank you!</p>

        
    <div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 120px; width: 500px; padding: 10px">

        <div style="font-size:large; text-align:right; padding-right: 50px">

            <asp:LinkButton ID="lnkbtnReturn" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnReturn_Click">&nbsp;&nbsp;&nbsp;New Search&nbsp;&nbsp;&nbsp;</asp:LinkButton>

            <br /><br />
            <asp:LinkButton ID="lnkbtnRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnRequests_Click">&nbsp;&nbsp;&nbsp;Review My Requests&nbsp;&nbsp;&nbsp;</asp:LinkButton>
                                    
            <br /><br />
            <asp:LinkButton ID="lnkbtnAllRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnAllRequests_Click">&nbsp;&nbsp;&nbsp;View Everyone's Assignments&nbsp;&nbsp;&nbsp;</asp:LinkButton>

        </div>

    </div>
    
    <hr />
    
    <h3>Search Results <asp:ImageButton ID="imgbtnMapHelp" runat="server" OnClientClick="window.open('helpResults.html','Rare Care Results Help','width=300,height=300,left=300,top=300')" ImageUrl="~/iconQuestion.png" /></h3>
    
    <p>
        <asp:Label ID="lblVolName" runat="server" Font-Size="Large" Text="Volunteer"></asp:Label>&nbsp;&nbsp;
        Volunteer ID:&nbsp;<asp:Label ID="lblVolID" runat="server" Text="ID"></asp:Label></p>

    
    <asp:GridView ID="grdvwResults" runat="server" AutoGenerateColumns="False" DataSourceID="accessdatasrcVolRequests" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="grdvwResults_SelectedIndexChanged" DataKeyNames="EO_ID" Width="990px" OnRowDataBound="grdvwResults_RowDataBound">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="EO_ID" HeaderText="EO_ID" SortExpression="EO_ID" Visible="False" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
            <asp:BoundField DataField="COUNTIES" HeaderText="Counties" SortExpression="COUNTIES" />
            <asp:BoundField DataField="Phenology" HeaderText="Phenology" SortExpression="Phenology" />
            <asp:BoundField DataField="Taxonomy" HeaderText="Taxonomy" SortExpression="Taxonomy" />
            <asp:BoundField DataField="Species" HeaderText="Species" SortExpression="Species" />
            <asp:BoundField DataField="EO_Num" HeaderText="EO Number" SortExpression="EO_Num">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>  
            
            <asp:BoundField DataField="LAST_OBS" HeaderText="Last Observation" SortExpression="LAST_OBS" DataFormatString="{0:d}" />
            <asp:BoundField DataField="SURVEY_DATE" HeaderText="Survey Date" SortExpression="SURVEY_DATE" DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="Precision" SortExpression="PRECISION">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PRECISION") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PRECISION") %>' ToolTip="S=precise location; M=location 1 mile radius; G=location 5 mile radius"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="SURVEY_SITES" HeaderText="Survey Sites" SortExpression="SURVEY_SITES" />
            <asp:BoundField DataField="MA_NAMES" HeaderText="Managed Area Names" SortExpression="MA_NAMES" />
            <asp:BoundField DataField="TRS" HeaderText="TRS" SortExpression="TRS" >
                <ItemStyle Font-Size="X-Small" />
            </asp:BoundField>
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="accessdatasrcVolRequests" runat="server" ConnectionString="<%$ ConnectionStrings:WORM2007 %>"
        ProviderName="<%$ ConnectionStrings:WORM2007.ProviderName %>" 
        SelectCommand="SELECT [EO_ID], [COUNTIES], [Phenology], [Taxonomy], [Species], [EO_Num], [Priority], [LAST_OBS], [SURVEY_DATE], [PRECISION], [SURVEY_SITES], [MA_NAMES], [TRS] FROM [VolunteerOpportunities] WHERE [Species] LIKE @Species AND ([COUNTIES] LIKE @Adams OR [COUNTIES] LIKE @Asotin OR [COUNTIES] LIKE @Benton OR [COUNTIES] LIKE @Chelan OR [COUNTIES] LIKE @Clallam OR [COUNTIES] LIKE @Clark OR [COUNTIES] LIKE @Columbia OR [COUNTIES] LIKE @Cowlitz OR [COUNTIES] LIKE @Douglas OR [COUNTIES] LIKE @Ferry OR [COUNTIES] LIKE @Franklin OR [COUNTIES] LIKE @Garfield OR [COUNTIES] LIKE @Grant OR [COUNTIES] LIKE @GraysHarbor OR [COUNTIES] LIKE @Island OR [COUNTIES] LIKE @Jefferson OR [COUNTIES] LIKE @King OR [COUNTIES] LIKE @Kitsap OR [COUNTIES] LIKE @Kittitas OR [COUNTIES] LIKE @Klickitat OR [COUNTIES] LIKE @Lewis OR [COUNTIES] LIKE @Lincoln OR [COUNTIES] LIKE @Mason OR [COUNTIES] LIKE @Okanogan OR [COUNTIES] LIKE @Pacific OR [COUNTIES] LIKE @PendOreille OR [COUNTIES] LIKE @Pierce OR [COUNTIES] LIKE @SanJuan OR [COUNTIES] LIKE @Skagit OR [COUNTIES] LIKE @Skamania OR [COUNTIES] LIKE @Snohomish OR [COUNTIES] LIKE @Spokane OR [COUNTIES] LIKE @Stevens OR [COUNTIES] LIKE @Thurston OR [COUNTIES] LIKE @Wahkiakum OR [COUNTIES] LIKE @WallaWalla OR [COUNTIES] LIKE @Whatcom OR [COUNTIES] LIKE @Whitman OR [COUNTIES] LIKE @Yakima) AND [Taxonomy] LIKE @Taxonomy AND ([Phenology] LIKE @Month OR [Phenology] LIKE @January OR [Phenology] LIKE @February OR [Phenology] LIKE @March OR [Phenology] LIKE @April OR [Phenology] LIKE @May OR [Phenology] LIKE @June OR [Phenology] LIKE @July OR [Phenology] LIKE @August OR [Phenology] LIKE @September OR [Phenology] LIKE @October OR [Phenology] LIKE @November OR [Phenology] LIKE @December) AND [Priority] LIKE @Priority AND [NotonWeb] = 'FALSE' ORDER BY CASE [Priority] WHEN 'Highest' THEN 1 WHEN 'Medium' THEN 2 WHEN 'Lower' THEN 3 ELSE 4 END">
        <SelectParameters>
            <asp:SessionParameter Name="Species" SessionField="Species" Type="String" />
            <asp:SessionParameter Name="Adams" SessionField="Adams" Type="String" />
            <asp:SessionParameter Name="Asotin" SessionField="Asotin" Type="String" />
            <asp:SessionParameter Name="Benton" SessionField="Benton" Type="String" />
            <asp:SessionParameter Name="Chelan" SessionField="Chelan" Type="String" />
            <asp:SessionParameter Name="Clallam" SessionField="Clallam" Type="String" />
            <asp:SessionParameter Name="Clark" SessionField="Clark" Type="String" />
            <asp:SessionParameter Name="Columbia" SessionField="Columbia" Type="String" />
            <asp:SessionParameter Name="Cowlitz" SessionField="Cowlitz" Type="String" />
            <asp:SessionParameter Name="Douglas" SessionField="Douglas" Type="String" />
            <asp:SessionParameter Name="Ferry" SessionField="Ferry" Type="String" />
            <asp:SessionParameter Name="Franklin" SessionField="Franklin" Type="String" />
            <asp:SessionParameter Name="Garfield" SessionField="Garfield" Type="String" />
            <asp:SessionParameter Name="Grant" SessionField="Grant" Type="String" />
            <asp:SessionParameter Name="GraysHarbor" SessionField="Grays Harbor" Type="String" />
            <asp:SessionParameter Name="Island" SessionField="Island" Type="String" />
            <asp:SessionParameter Name="Jefferson" SessionField="Jefferson" Type="String" />
            <asp:SessionParameter Name="King" SessionField="King" Type="String" />
            <asp:SessionParameter Name="Kitsap" SessionField="Kitsap" Type="String" />
            <asp:SessionParameter Name="Kittitas" SessionField="Kittitas" Type="String" />
            <asp:SessionParameter Name="Klickitat" SessionField="Klickitat" Type="String" />
            <asp:SessionParameter Name="Lewis" SessionField="Lewis" Type="String" />
            <asp:SessionParameter Name="Lincoln" SessionField="Lincoln" Type="String" />
            <asp:SessionParameter Name="Mason" SessionField="Mason" Type="String" />
            <asp:SessionParameter Name="Okanogan" SessionField="Okanogan" Type="String" />
            <asp:SessionParameter Name="Pacific" SessionField="Pacific" Type="String" />
            <asp:SessionParameter Name="PendOreille" SessionField="Pend Oreille" Type="String" />
            <asp:SessionParameter Name="Pierce" SessionField="Pierce" Type="String" />
            <asp:SessionParameter Name="SanJuan" SessionField="San Juan" Type="String" />
            <asp:SessionParameter Name="Skagit" SessionField="Skagit" Type="String" />
            <asp:SessionParameter Name="Skamania" SessionField="Skamania" Type="String" />
            <asp:SessionParameter Name="Snohomish" SessionField="Snohomish" Type="String" />
            <asp:SessionParameter Name="Spokane" SessionField="Spokane" Type="String" />
            <asp:SessionParameter Name="Stevens" SessionField="Stevens" Type="String" />
            <asp:SessionParameter Name="Thurston" SessionField="Thurston" Type="String" />
            <asp:SessionParameter Name="Wahkiakum" SessionField="Wahkiakum" Type="String" />
            <asp:SessionParameter Name="WallaWalla" SessionField="Walla Walla" Type="String" />
            <asp:SessionParameter Name="Whatcom" SessionField="Whatcom" Type="String" />
            <asp:SessionParameter Name="Whitman" SessionField="Whitman" Type="String" />
            <asp:SessionParameter Name="Yakima" SessionField="Yakima" Type="String" />
            <asp:SessionParameter Name="Taxonomy" SessionField="Ease" Type="String" />
            <asp:SessionParameter Name="Month" SessionField="Month" Type="String" />
            <asp:SessionParameter Name="January" SessionField="January" Type="String" />
            <asp:SessionParameter Name="February" SessionField="February" Type="String" />
            <asp:SessionParameter Name="March" SessionField="March" Type="String" />
            <asp:SessionParameter Name="April" SessionField="April" Type="String" />
            <asp:SessionParameter Name="May" SessionField="May" Type="String" />
            <asp:SessionParameter Name="June" SessionField="June" Type="String" />
            <asp:SessionParameter Name="July" SessionField="July" Type="String" />
            <asp:SessionParameter Name="August" SessionField="August" Type="String" />
            <asp:SessionParameter Name="September" SessionField="September" Type="String" />
            <asp:SessionParameter Name="October" SessionField="October" Type="String" />
            <asp:SessionParameter Name="November" SessionField="November" Type="String" />
            <asp:SessionParameter Name="December" SessionField="December" Type="String" />
            <asp:SessionParameter Name="Priority" SessionField="Priority" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:Label ID="lblMessage" runat="server" Font-Size="Large" ForeColor="Maroon"></asp:Label>
    
   

</asp:Content>

