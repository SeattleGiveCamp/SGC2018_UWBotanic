<%@ Page Language="C#" MasterPageFile="~/RareCareTable.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="_Default" Title="Rare Care Database Detail" %>
<asp:Content ID="contentDefault" ContentPlaceHolderID="contentRareCare" Runat="Server">



<%--UWBG Rare Care Database Search web application
Provided by David Campbell

Search results Detail ASP.NET web page
Updated October 24, 2013--%>


<p style="color:Maroon">To log out, completely exit your browser when you are finished.  Because of the sensitive nature of this information, we ask that you not share the password or the contents of this website with anyone else.  Thank you!</p>

    
    <div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 30px; width: 500px; padding: 10px">

        <div style="font-size:large; text-align:right; padding-right: 50px">

            <asp:LinkButton ID="lnkbtnRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnRequests_Click">&nbsp;&nbsp;&nbsp;Review My Requests&nbsp;&nbsp;&nbsp;</asp:LinkButton>
            
            <asp:LinkButton ID="lnkbtnReturn" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnReturn_Click">&nbsp;&nbsp;&nbsp;Return to Search Results&nbsp;&nbsp;&nbsp;</asp:LinkButton>
            
        </div>

    </div>
    
    <hr />
    
    <h3>EO Detail <asp:ImageButton ID="imgbtnDetailHelp" runat="server" OnClientClick="window.open('helpDetail.html','Rare Care EO Detail Help','width=300,height=300,left=300,top=300')" ImageUrl="~/iconQuestion.png" /></h3>
    <p>
        <asp:Label ID="lblVolName" runat="server" Font-Size="Large" Text="Volunteer"></asp:Label>&nbsp;&nbsp;
        Volunteer ID:&nbsp;<asp:Label ID="lblVolID" runat="server" Text="ID"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
        EO ID: &nbsp;<asp:Label ID="lblEOID" runat="server" Text="ID"></asp:Label>
    </p>


           <asp:FormView ID="frmvwDetail" runat="server" DataSourceID="accessdatasrcDetail" Width="520px" Height="369px" BorderColor="#1A3955" BorderStyle="Solid" BorderWidth="2px" Visible="true">
            <EditItemTemplate>
                EO_ID:
                <asp:TextBox ID="EO_IDTextBox" runat="server" Text='<%# Bind("EO_ID") %>'>
                </asp:TextBox><br />
                Species:
                <asp:TextBox ID="SpeciesTextBox" runat="server" Text='<%# Bind("Species") %>'>
                </asp:TextBox><br />
                EO_NUM:
                <asp:TextBox ID="EO_NUMTextBox" runat="server" Text='<%# Bind("EO_NUM") %>'>
                </asp:TextBox><br />
                COUNTIES:
                <asp:TextBox ID="COUNTIESTextBox" runat="server" Text='<%# Bind("COUNTIES") %>'>
                </asp:TextBox><br />
                ST_STAT:
                <asp:TextBox ID="ST_STATTextBox" runat="server" Text='<%# Bind("ST_STAT") %>'>
                </asp:TextBox><br />
                PRECISION:
                <asp:TextBox ID="PRECISIONTextBox" runat="server" Text='<%# Bind("PRECISION") %>'>
                </asp:TextBox><br />
                Notes_for_2012:
                <asp:TextBox ID="AssignmentNotesTextBox" runat="server" Text='<%# Bind("AssignmentNotes") %>'>
                </asp:TextBox><br />
                LAST_OBS:
                <asp:TextBox ID="LAST_OBSTextBox" runat="server" Text='<%# Bind("LAST_OBS") %>'>
                </asp:TextBox><br />
                SURVEY_DATE:
                <asp:TextBox ID="SURVEY_DATETextBox" runat="server" Text='<%# Bind("SURVEY_DATE") %>'>
                </asp:TextBox><br />
                Phenology:
                <asp:TextBox ID="PhenologyTextBox" runat="server" Text='<%# Bind("Phenology") %>'>
                </asp:TextBox><br />
                Taxonomy:
                <asp:TextBox ID="TaxonomyTextBox" runat="server" Text='<%# Bind("Taxonomy") %>'>
                </asp:TextBox><br />
                SURVEY_SITES:
                <asp:TextBox ID="SURVEY_SITESTextBox" runat="server" Text='<%# Bind("SURVEY_SITES") %>'>
                </asp:TextBox><br />
                QUADS:
                <asp:TextBox ID="QUADSTextBox" runat="server" Text='<%# Bind("QUADS") %>'>
                </asp:TextBox><br />
                MA_NAMES:
                <asp:TextBox ID="MA_NAMESTextBox" runat="server" Text='<%# Bind("MA_NAMES") %>'>
                </asp:TextBox><br />
                OWNER_CODE:
                <asp:TextBox ID="OWNER_CODETextBox" runat="server" Text='<%# Bind("OWNER_CODE") %>'>
                </asp:TextBox><br />
                TRS:
                <asp:TextBox ID="TRSTextBox" runat="server" Text='<%# Bind("TRS") %>'>
                </asp:TextBox><br />
                MIN_ELEV:
                <asp:TextBox ID="MIN_ELEVTextBox" runat="server" Text='<%# Bind("MIN_ELEV") %>'>
                </asp:TextBox><br />
                SLOPE:
                <asp:TextBox ID="SLOPETextBox" runat="server" Text='<%# Bind("SLOPE") %>'>
                </asp:TextBox><br />
                EO_DATA:
                <asp:TextBox ID="EO_DATATextBox" runat="server" Text='<%# Bind("EO_DATA") %>'>
                </asp:TextBox><br />
                GEN_DESC:
                <asp:TextBox ID="GEN_DESCTextBox" runat="server" Text='<%# Bind("GEN_DESC") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update">
                </asp:LinkButton>
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel">
                </asp:LinkButton>
            </EditItemTemplate>
            <InsertItemTemplate>
                EO_ID:
                <asp:TextBox ID="EO_IDTextBox" runat="server" Text='<%# Bind("EO_ID") %>'>
                </asp:TextBox><br />
                Species:
                <asp:TextBox ID="SpeciesTextBox" runat="server" Text='<%# Bind("Species") %>'>
                </asp:TextBox><br />
                EO_NUM:
                <asp:TextBox ID="EO_NUMTextBox" runat="server" Text='<%# Bind("EO_NUM") %>'>
                </asp:TextBox><br />
                COUNTIES:
                <asp:TextBox ID="COUNTIESTextBox" runat="server" Text='<%# Bind("COUNTIES") %>'>
                </asp:TextBox><br />
                ST_STAT:
                <asp:TextBox ID="ST_STATTextBox" runat="server" Text='<%# Bind("ST_STAT") %>'>
                </asp:TextBox><br />
                PRECISION:
                <asp:TextBox ID="PRECISIONTextBox" runat="server" Text='<%# Bind("PRECISION") %>'>
                </asp:TextBox><br />
                Notes_for_2012:
                <asp:TextBox ID="AssignmentNotesTextBox" runat="server" Text='<%# Bind("AssignmentNotes") %>'>
                </asp:TextBox><br />
                LAST_OBS:
                <asp:TextBox ID="LAST_OBSTextBox" runat="server" Text='<%# Bind("LAST_OBS") %>'>
                </asp:TextBox><br />
                SURVEY_DATE:
                <asp:TextBox ID="SURVEY_DATETextBox" runat="server" Text='<%# Bind("SURVEY_DATE") %>'>
                </asp:TextBox><br />
                Phenology:
                <asp:TextBox ID="PhenologyTextBox" runat="server" Text='<%# Bind("Phenology") %>'>
                </asp:TextBox><br />
                Taxonomy:
                <asp:TextBox ID="TaxonomyTextBox" runat="server" Text='<%# Bind("Taxonomy") %>'>
                </asp:TextBox><br />
                SURVEY_SITES:
                <asp:TextBox ID="SURVEY_SITESTextBox" runat="server" Text='<%# Bind("SURVEY_SITES") %>'>
                </asp:TextBox><br />
                QUADS:
                <asp:TextBox ID="QUADSTextBox" runat="server" Text='<%# Bind("QUADS") %>'>
                </asp:TextBox><br />
                MA_NAMES:
                <asp:TextBox ID="MA_NAMESTextBox" runat="server" Text='<%# Bind("MA_NAMES") %>'>
                </asp:TextBox><br />
                OWNER_CODE:
                <asp:TextBox ID="OWNER_CODETextBox" runat="server" Text='<%# Bind("OWNER_CODE") %>'>
                </asp:TextBox><br />
                TRS:
                <asp:TextBox ID="TRSTextBox" runat="server" Text='<%# Bind("TRS") %>'>
                </asp:TextBox><br />
                MIN_ELEV:
                <asp:TextBox ID="MIN_ELEVTextBox" runat="server" Text='<%# Bind("MIN_ELEV") %>'>
                </asp:TextBox><br />
                SLOPE:
                <asp:TextBox ID="SLOPETextBox" runat="server" Text='<%# Bind("SLOPE") %>'>
                </asp:TextBox><br />
                EO_DATA:
                <asp:TextBox ID="EO_DATATextBox" runat="server" Text='<%# Bind("EO_DATA") %>'>
                </asp:TextBox><br />
                GEN_DESC:
                <asp:TextBox ID="GEN_DESCTextBox" runat="server" Text='<%# Bind("GEN_DESC") %>'>
                </asp:TextBox><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="Insert">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel">
                </asp:LinkButton>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label ID="EO_IDLabel" runat="server" Text='<%# Bind("EO_ID") %>' Visible="False"></asp:Label><div
                    style="text-align: center">
                    <table border="1" width="100%" style="border-collapse:collapse">
                        <tr>
                            <td align="center" style="font-weight: bold; background-color: gainsboro;">
                                SPECIES</td>
                            <td align="center" style="font-weight: bold; background-color: gainsboro">
                                EO_NUM</td>
                            <td align="center" style="font-weight: bold; background-color: gainsboro">
                                COUNTIES</td>
                            <td align="center" style="font-weight: bold; background-color: gainsboro">
                                ST STAT</td>
                            <td align="center" style="font-weight: bold; background-color: gainsboro">
                                PRECISION</td>
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;">
                <asp:Label ID="SpeciesLabel" runat="server" Text='<%# Bind("Species") %>' Font-Italic="True"></asp:Label></td>
                            <td align="center" style="background-color: white">
                <asp:Label ID="EO_NUMLabel" runat="server" Text='<%# Bind("EO_NUM") %>'></asp:Label></td>
                            <td align="center" style="background-color: white">
                <asp:Label ID="COUNTIESLabel" runat="server" Text='<%# Bind("COUNTIES") %>'></asp:Label></td>
                            <td align="center" style="background-color: white">
                <asp:Label ID="ST_STATLabel" runat="server" Text='<%# Bind("ST_STAT") %>'></asp:Label></td>
                            <td align="center" style="background-color: white">
                <asp:Label ID="PRECISIONLabel" runat="server" Text='<%# Bind("PRECISION") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" style="font-weight: bold; background-color: gainsboro;" colspan="4">
                                Assignment Notes</td>
                            <td align="center" style="font-weight: bold; background-color: gainsboro;">
                                PRIORITY</td>
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;" colspan="4">
                <asp:Label ID="AssignmentNotesLabel" runat="server" Text='<%# Bind("AssignmentNotes") %>'>
                </asp:Label></td>
                            <td align="center" style="background-color: white;">
                <asp:Label ID="PriorityLabel" runat="server" Text='<%# Bind("Priority") %>'>
                </asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="width: 5px; font-weight: bold; background-color: gainsboro;">
                                LAST OBS</td>
                            <td align="center" style="font-weight: bold; width: 5px; background-color: gainsboro">
                                SURVEY DATE</td>
                            <td align="center" style="font-weight: bold; width: 5px; background-color: gainsboro">
                                Phenology</td>
                            <td align="center" style="font-weight: bold; width: 5px; background-color: gainsboro" colspan="2">
                                Taxonomy</td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;">
                <asp:Label ID="LAST_OBSLabel" runat="server" Text='<%# Bind("LAST_OBS", "{0:d}") %>'></asp:Label></td>
                            <td align="center" style="background-color: white">
                <asp:Label ID="SURVEY_DATELabel" runat="server" Text='<%# Bind("SURVEY_DATE", "{0:d}") %>'></asp:Label></td>
                            <td align="center" style="background-color: white">
                <asp:Label ID="PhenologyLabel" runat="server" Text='<%# Bind("Phenology") %>'></asp:Label></td>
                            <td align="center" colspan="2" style="background-color: white">
                <asp:Label ID="TaxonomyLabel" runat="server" Text='<%# Bind("Taxonomy") %>'></asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="width: 5px; font-weight: bold; background-color: gainsboro;" colspan="2">
                                SURVEY SITES</td>
                            
                            <td align="center" style="font-weight: bold; width: 5px; background-color: gainsboro" colspan="3">
                                QUADS</td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;" colspan="2">
                <asp:Label ID="SURVEY_SITESLabel" runat="server" Text='<%# Bind("SURVEY_SITES") %>'>
                </asp:Label></td>
                            
                            <td align="center" style="background-color: white" colspan="3">
                <asp:Label ID="QUADSLabel" runat="server" Text='<%# Bind("QUADS") %>'></asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="width: 5px; font-weight: bold; background-color: gainsboro;" colspan="3">
                                MA_NAMES</td>
                            
                            <td align="center" style="font-weight: bold; width: 5px; background-color: gainsboro" colspan="2">
                                OWNER</td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;" colspan="3">
                <asp:Label ID="MA_NAMESLabel" runat="server" Text='<%# Bind("MA_NAMES") %>'></asp:Label></td>
                            
                            <td align="center" style="background-color: white" colspan="2">
                <asp:Label ID="OWNER_CODELabel" runat="server" Text='<%# Bind("OWNER_CODE") %>'>
                </asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="width: 5px; font-weight: bold; background-color: gainsboro;" colspan="3">
                                Township Range Section (TRS)</td>
                            
                            <td align="center" style="font-weight: bold; width: 5px; background-color: gainsboro">
                                MIN ELEV</td>
                            <td align="center" style="font-weight: bold; width: 5px; background-color: gainsboro">
                                SLOPE</td>
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;" colspan="3">
                <asp:Label ID="TRSLabel" runat="server" Text='<%# Bind("TRS") %>'></asp:Label></td>
                            
                            <td align="center" style="background-color: white">
                <asp:Label ID="MIN_ELEVLabel" runat="server" Text='<%# Bind("MIN_ELEV") %>'></asp:Label></td>
                            <td align="center" style="background-color: white">
                <asp:Label ID="SLOPELabel" runat="server" Text='<%# Bind("SLOPE") %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" style="font-weight: bold; background-color: gainsboro;" colspan="5">
                                EO_DATA</td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;" colspan="5">
                <asp:Label ID="EO_DATALabel" runat="server" Text='<%# Bind("EO_DATA") %>'></asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="font-weight: bold; background-color: gainsboro;" colspan="5" rowspan="1">
                                GEN_DESC</td>
                            
                        </tr>
                        <tr>
                            <td align="center" style="background-color: white;" colspan="5">
                <asp:Label ID="GEN_DESCLabel" runat="server" Text='<%# Bind("GEN_DESC") %>'></asp:Label></td>
                            
                        </tr>
                        <tr>
                            <td colspan="5" style="font-weight: bold; background-color: gainsboro;">
                                <asp:Label ID="lblMapping" runat="server">MAPPING - General Vicinity of EO</asp:Label> 
                                <asp:ImageButton ID="imgbtnMapHelp" runat="server" OnClientClick="window.open('helpMap.html','Rare Care Mapping Help','width=300,height=300,left=300,top=300')" ImageUrl="~/iconQuestion.png" /></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold; background-color: gainsboro;">
                                Latitude
                            </td>
                            <td style="background-color: white;">
                                <asp:Label ID="lblLatitude" runat="server" Text='<%# Bind("Latitude") %>'></asp:Label>
                            </td>
                            <td style="font-weight: bold; background-color: gainsboro;">
                                Longitude
                            </td>
                            <td style="background-color: white;">
                                <asp:Label ID="lblLongitude" runat="server" Text='<%# Bind("Longitude") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("https://maps.google.com/?ll={0},{1}&z=13&t=h", Eval("Latitude"), Eval("Longitude")) %>' Target="_blank">Map</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="accessdatasrcDetail" runat="server" ConnectionString="<%$ ConnectionStrings:WORM2007 %>"
            ProviderName="<%$ ConnectionStrings:WORM2007.ProviderName %>" SelectCommand="SELECT VolunteerOpportunities.EO_ID, [Species], [EO_NUM], [COUNTIES], [ST_STAT], [PRECISION], VolunteerOpportunities.AssignmentNotes, [LAST_OBS], [SURVEY_DATE], [Phenology], [Taxonomy], [SURVEY_SITES], [QUADS], [MA_NAMES], [OWNER_CODE], [TRS], [MIN_ELEV], [SLOPE], [EO_DATA], [GEN_DESC], [Priority], [Latitude], [Longitude] FROM VolunteerOpportunities LEFT JOIN Alerts ON VolunteerOpportunities.EO_ID = Alerts.EO_ID WHERE (VolunteerOpportunities.EO_ID = @EO_ID)">
            <SelectParameters>
                <asp:SessionParameter Name="EO_ID" SessionField="EO" Type="Double" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <br />
        <div style="font-size:large; margin-left: 320px">
        <asp:LinkButton ID="lnkbtnAdd" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnAdd_Click">&nbsp;&nbsp;&nbsp;Add to My List&nbsp;&nbsp;&nbsp;</asp:LinkButton>
        </div>
     


    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Maroon"></asp:Label>
    <br />

</asp:Content>

