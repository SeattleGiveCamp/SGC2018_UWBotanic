<%@ Page Language="C#" MasterPageFile="~/RareCareTable.master" AutoEventWireup="true" CodeFile="AllRequests.aspx.cs" Inherits="AllRequests" Title="Rare Care All Requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentRareCare" Runat="Server">



<%--UWBG Rare Care Database Search web application
Provided by David Campbell

Volunteer All Requests ASP.NET web page
Updated September 24, 2013--%>



<div style="width: 1000px">

<p style="color:Maroon">To log out, completely exit your browser when you are finished.  Because of the sensitive nature of this information, we ask that you not share the password or the contents of this website with anyone else.  Thank you!</p>

</div>
    
    <div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 120px; width: 500px; padding: 10px">

        <div style="font-size:large; text-align:right; padding-right: 50px">

            <asp:LinkButton ID="lnkbtnSearch" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnSearch_Click">&nbsp;&nbsp;&nbsp;New Search&nbsp;&nbsp;&nbsp;</asp:LinkButton>
            
            <br /><br />
            <asp:LinkButton ID="lnkbtnResults" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnResults_Click">&nbsp;&nbsp;&nbsp;Return to Search Results&nbsp;&nbsp;&nbsp;</asp:LinkButton>
        
            <br /><br />
            <asp:LinkButton ID="lnkbtnRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnRequests_Click">&nbsp;&nbsp;&nbsp;Review My Requests&nbsp;&nbsp;&nbsp;</asp:LinkButton>

            
            
        </div>

    </div>
    
    <hr />
    

<div style="border: solid 2px #1A3955; background-color: #F4F6F1; width: 1000px; padding: 10px">

    <h2>All Monitoring Assignments</h2>
    
    
    <asp:GridView ID="grdvwRequests" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID,EO_ID" DataSourceID="sqldatasrcRequests" BackColor="White" BorderColor="White" BorderStyle="None" Width="990px" OnSorted="grdvwRequests_Sorted" OnRowDataBound="grdvwRequests_RowDataBound" OnSelectedIndexChanged="grdvwRequests_SelectedIndexChanged" CellPadding="5">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnSelect" runat="server" CausesValidation="False" CommandName="Select" Text="View Details" OnClientClick="aspnetForm.target = '_blank';"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" Visible="False" />
            
            <asp:BoundField DataField="EO_ID" HeaderText="EO ID" SortExpression="EO_ID" ReadOnly="True" />
                            
            <asp:BoundField DataField="Vol_ID" HeaderText="Vol_ID" SortExpression="Vol_ID" Visible="False" />
            
            <asp:BoundField DataField="VolName" HeaderText="Volunteer Name" SortExpression="VolName" ReadOnly="True" />
            
            <asp:BoundField DataField="Species" HeaderText="Species" SortExpression="Species" ReadOnly="True" />
            
            <asp:BoundField DataField="EO_Num" HeaderText="EO Number" SortExpression="EO_Num" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            
            <asp:BoundField DataField="County" HeaderText="Counties" SortExpression="County" ReadOnly="True" />
            
            <asp:BoundField DataField="Phenology" HeaderText="Phenology" SortExpression="Phenology" ReadOnly="True" />
                        
                       
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="LightGray" Font-Bold="True" ForeColor="Black" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />        
    </asp:GridView>
    
    <asp:SqlDataSource ID="sqldatasrcRequests" runat="server" ConnectionString="<%$ ConnectionStrings:WORM2007 %>"
        DeleteCommand="DELETE FROM [VolunteerRequests] WHERE [ID] = ?"
        InsertCommand="INSERT INTO [VolunteerRequests] ([ID], [EO_ID], [Vol_ID], [VolName], [Preference], [County], [Species], [EO_Num], [FieldPartner], [Comments]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        ProviderName="<%$ ConnectionStrings:WORM2007.ProviderName %>"
        SelectCommand="SELECT * FROM [VolunteerRequests] WHERE [Assigned] = True"
        UpdateCommand="UPDATE [VolunteerRequests] SET [Preference] = ?, [FieldPartner] = ?, [Comments] = ? WHERE [ID] = ?">
        
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Preference" Type="Int32" />
            <asp:Parameter Name="FieldPartner" Type="Boolean" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="EO_ID" Type="Int32" />
            <asp:Parameter Name="Vol_ID" Type="Int32" />
            <asp:Parameter Name="VolName" Type="String" />
            <asp:Parameter Name="Preference" Type="Int32" />
            <asp:Parameter Name="County" Type="String" />
            <asp:Parameter Name="Species" Type="String" />
            <asp:Parameter Name="EO_Num" Type="Int32" />
            <asp:Parameter Name="FieldPartner" Type="Boolean" />
            <asp:Parameter Name="Comments" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    
    
</div>
<asp:Label ID="lblMessage" runat="server" Font-Size="Large" ForeColor="Maroon"></asp:Label>


</asp:Content>

