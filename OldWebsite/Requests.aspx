<%@ Page Language="C#" MasterPageFile="~/RareCareTable.master" AutoEventWireup="true" CodeFile="Requests.aspx.cs" Inherits="Requests" Title="Rare Care Requests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentRareCare" Runat="Server">



<%--UWBG Rare Care Database Search web application
Provided by David Campbell

Volunteer Requests ASP.NET web page
Updated October 24, 2013--%>



<div style="width: 1000px">
<p style="color:Maroon">To log out, completely exit your browser when you are finished.  Because of the sensitive nature of this information, we ask that you not share the password or the contents of this website with anyone else.  Thank you!</p>
</div>
    
    <div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 120px; width: 500px; padding: 10px">

        <div style="font-size:large; text-align:right; padding-right: 50px">

            <asp:LinkButton ID="lnkbtnReturn" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnReturn_Click">&nbsp;&nbsp;&nbsp;New Search&nbsp;&nbsp;&nbsp;</asp:LinkButton>
        
            <br /><br />
            <asp:LinkButton ID="lnkbtnResults" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnResults_Click">&nbsp;&nbsp;&nbsp;Return to Search Results&nbsp;&nbsp;&nbsp;</asp:LinkButton>
            
            <br /><br />
            <asp:LinkButton ID="lnkbtnAllRequests" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnAllRequests_Click">&nbsp;&nbsp;&nbsp;View Everyone's Assignments&nbsp;&nbsp;&nbsp;</asp:LinkButton>

        </div>

    </div>
    
    <hr />
    
    
    <p>
        <asp:Label ID="lblVolName" runat="server" Font-Size="Large" Text="Volunteer"></asp:Label>&nbsp;&nbsp;
        Volunteer ID:&nbsp;<asp:Label ID="lblVolID" runat="server" Text="ID"></asp:Label></p>

<div style="border: solid 2px #1A3955; background-color: #F4F6F1; width: 1000px; padding: 10px">

    <h2>Monitoring Requests <asp:ImageButton ID="imgbtnRequestsHelp" runat="server" OnClientClick="window.open('helpRequests.html','Rare Care Requests Help','width=400,height=400,left=300,top=300')" ImageUrl="~/iconQuestion.png" /></h2>
    
    
    <asp:GridView ID="grdvwRequests" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID,EO_ID" DataSourceID="sqldatasrcRequests" BackColor="White" BorderColor="White" BorderStyle="None" Width="990px" OnRowDeleted="grdvwRequests_RowDeleted" OnRowDataBound="grdvwRequests_RowDataBound" OnSelectedIndexChanged="grdvwRequests_SelectedIndexChanged" OnRowCancelingEdit="grdvwRequests_RowCancelingEdit" OnRowUpdated="grdvwRequests_RowUpdated" OnSorted="grdvwRequests_Sorted">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnSelect" runat="server" CausesValidation="False" CommandName="Select"
                        Text="Select"></asp:LinkButton>
                    </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnDetails" runat="server" CausesValidation="False" 
                        Text="View Details" OnClick="OpenDetails" OnClientClick="aspnetForm.target = '_blank';"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkbtnEdit" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnDelete" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit"></asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                        Text="Delete" OnClientClick="javascript:return confirm('Delete selected entry?')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" Visible="False" />
            
            <asp:BoundField DataField="EO_ID" HeaderText="EO ID" SortExpression="EO_ID" ReadOnly="True">
                <ItemStyle CssClass="hidden" />
                <HeaderStyle CssClass="hidden" />
            </asp:BoundField>
            
            <asp:BoundField DataField="Vol_ID" HeaderText="Vol_ID" SortExpression="Vol_ID" Visible="False" />
   
            
            <asp:BoundField DataField="VolName" SortExpression="VolName" ReadOnly="True" >
                <ItemStyle CssClass="hidden" />
                <HeaderStyle CssClass="hidden" />
            </asp:BoundField>
            
            <asp:BoundField DataField="Preference" HeaderText="Pref Order (1,2,3)" SortExpression="Preference" >
                <ItemStyle HorizontalAlign="Center" />
                <ControlStyle Width="15px" />
            </asp:BoundField>
            
            <asp:CheckBoxField DataField="FieldPartner" HeaderText="Request Field Partner" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            
            <asp:BoundField DataField="Comments" HeaderText="Comments" >
                <ControlStyle Width="70px" />
            </asp:BoundField>
                        
            <asp:CheckBoxField DataField="ToBeSubmitted" HeaderText="Submit to Rare Care?" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            
            <asp:BoundField DataField="Species" HeaderText="Species" SortExpression="Species" ReadOnly="True" />
            <asp:BoundField DataField="EO_Num" HeaderText="EO Number" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="County" HeaderText="Counties" SortExpression="County" ReadOnly="True" />
            <asp:BoundField DataField="Phenology" HeaderText="Phenology" SortExpression="Phenology" ReadOnly="True" />
            
            <asp:TemplateField HeaderText="Submission Date" SortExpression="SubmissionDate">
                <EditItemTemplate>
                    <asp:Label ID="lblSubmissionDate" runat="server" Text='<%# Eval("SubmissionDate", "{0:d}") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSubmissionDate" runat="server" Text='<%# Bind("SubmissionDate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Assigned?" SortExpression="Assigned">
                <ItemTemplate>
                    <asp:CheckBox ID="chkAssigned" runat="server" Checked='<%# Eval("Assigned") %>' Enabled="false" CssClass="hidden" />
                    <asp:Image ID="imgAssigned" runat="server" ImageUrl='<%# (Eval("Assigned").ToString()=="True")?"Images/checkboxChecked.gif":"Images/checkboxEmpty.gif" %>' Height="16px" Width="16px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Assignment Status" SortExpression="Status">
                <EditItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
                  
            
                  
        </Columns>
        <HeaderStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Black" CssClass="headerpadding" />
    </asp:GridView>
    <asp:SqlDataSource ID="sqldatasrcRequests" runat="server" ConnectionString="<%$ ConnectionStrings:WORM2007 %>"
        DeleteCommand="DELETE FROM [VolunteerRequests] WHERE [ID] = @ID" InsertCommand="INSERT INTO [VolunteerRequests] ([ID], [EO_ID], [Vol_ID], [VolName], [Preference], [County], [Species], [EO_Num], [FieldPartner], [Comments], [ToBeSubmitted]) VALUES (@ID, @EO_ID, @Vol_ID, @VolName, @Preference, @County, @Species, @EO_Num, @FieldPartner, @Comments, @ToBeSubmitted)"
        ProviderName="<%$ ConnectionStrings:WORM2007.ProviderName %>" SelectCommand="SELECT * FROM [VolunteerRequests] WHERE ([Vol_ID] = ?) ORDER BY [SubmissionDate] DESC, [Preference]"
        UpdateCommand="UPDATE [VolunteerRequests] SET [Preference] = @Preference, [FieldPartner] = @FieldPartner, [Comments] = @Comments, [ToBeSubmitted] = @ToBeSubmitted WHERE [ID] = @ID">
        <SelectParameters>
            <asp:SessionParameter Name="Vol_ID" SessionField="VolID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Preference" Type="Int32" />
            <asp:Parameter Name="FieldPartner" Type="Boolean" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="ToBeSubmitted" Type="Boolean" />
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
            <asp:Parameter Name="ToBeSubmitted" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    
    
</div>
<asp:Label ID="lblMessage" runat="server" Font-Size="Large" ForeColor="Maroon"></asp:Label>

<hr />

<div style="font-size:large; padding-right: 50px">

            <asp:LinkButton ID="lnkbtnSubmit" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnSubmit_Click">&nbsp;&nbsp;Submit Marked Items to Rare Care&nbsp;&nbsp;</asp:LinkButton>
        
        </div>
        

    
    <br /><br />    
    <asp:Panel ID="pnlSubmit" runat="server" Visible="false">
    
    
    
    <div style="border: solid 2px #1A3955; background-color: #F4F6F1; width: 1000px; padding: 10px">

    <h2>Requests to be Submitted</h2>
    
    
    <asp:GridView ID="grdvwSubmit" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,EO_ID" DataSourceID="sqldatasrcSubmit" BackColor="White" BorderColor="White" BorderStyle="None" Width="990px" OnSelectedIndexChanged="grdvwSubmit_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkbtnSelect" runat="server" CausesValidation="False" CommandName="Select"
                        Text="Remove"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID">
                <ItemStyle CssClass="hidden" />
                <HeaderStyle CssClass="hidden" />
            </asp:BoundField>
            
            <asp:BoundField DataField="EO_ID" HeaderText="EO ID" SortExpression="EO_ID" ReadOnly="True">
                <ItemStyle CssClass="hidden" />
                <HeaderStyle CssClass="hidden" />
            </asp:BoundField>
            
            <asp:BoundField DataField="Vol_ID" HeaderText="Vol_ID" SortExpression="Vol_ID" Visible="False" />
   
            
            <asp:BoundField DataField="VolName" SortExpression="VolName" ReadOnly="True" >
                <ItemStyle CssClass="hidden" />
                <HeaderStyle CssClass="hidden" />
            </asp:BoundField>
            
            <asp:BoundField DataField="Preference" HeaderText="Preference Order (1,2,3,etc)" SortExpression="Preference" >
                <ItemStyle HorizontalAlign="Center" />
                <ControlStyle Width="15px" />
            </asp:BoundField>
            
            <asp:CheckBoxField DataField="FieldPartner" HeaderText="Request Field Partner" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:CheckBoxField>
            
            <asp:BoundField DataField="Comments" HeaderText="Comments" >
                <ItemStyle Width="200px" />
                <ControlStyle Width="200px" />
            </asp:BoundField>
            
            <asp:BoundField DataField="Species" HeaderText="Species" SortExpression="Species" ReadOnly="True" />
            
            <asp:BoundField DataField="EO_Num" HeaderText="EO Number" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            
            <asp:BoundField DataField="County" HeaderText="Counties" SortExpression="County" ReadOnly="True" />
            <asp:BoundField DataField="Phenology" HeaderText="Phenology" SortExpression="Phenology" ReadOnly="True" />
            
            <asp:CheckBoxField DataField="ToBeSubmitted" HeaderText="Submit?" >
                <ItemStyle CssClass="hidden" />
                <HeaderStyle CssClass="hidden" />
            </asp:CheckBoxField>           
                        
        </Columns>
        <HeaderStyle BackColor="Gainsboro" Font-Bold="True" ForeColor="Black" CssClass="headerpadding" />
    </asp:GridView>
    
    <asp:SqlDataSource ID="sqldatasrcSubmit" runat="server" ConnectionString="<%$ ConnectionStrings:WORM2007 %>"
        DeleteCommand="DELETE FROM [VolunteerRequests] WHERE [ID] = ?" InsertCommand="INSERT INTO [VolunteerRequests] ([ID], [EO_ID], [Vol_ID], [VolName], [Preference], [County], [Species], [EO_Num], [FieldPartner], [Comments], [ToBeSubmitted]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        ProviderName="<%$ ConnectionStrings:WORM2007.ProviderName %>" SelectCommand="SELECT * FROM [VolunteerRequests] WHERE ([Vol_ID] = ?) AND [ToBeSubmitted] = TRUE ORDER BY [Preference]"
        UpdateCommand="UPDATE [VolunteerRequests] SET [Preference] = ?, [FieldPartner] = ?, [Comments] = ?, [ToBeSubmitted] = ? WHERE [ID] = ?">
        <SelectParameters>
            <asp:SessionParameter Name="Vol_ID" SessionField="VolID" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Preference" Type="Int32" />
            <asp:Parameter Name="FieldPartner" Type="Boolean" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="ToBeSubmitted" Type="Boolean" />
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
            <asp:Parameter Name="ToBeSubmitted" Type="Boolean" />
        </InsertParameters>
    </asp:SqlDataSource>
    
    
</div>


    <div style="border: solid 2px #1A3955; background-color: #F4F6F1; height: 220px; width: 600px; padding: 10px">

    <br />
    <asp:Label ID="lblSend" runat="server" Text="Answer the questions below and then click Submit List:"></asp:Label>
    
    <br /><br />    
    <asp:Label ID="lblTotalAssignments" runat="server" Text="How many total assignments would you like?"></asp:Label>&nbsp;&nbsp;<asp:TextBox
        ID="txtTotalAssignments" runat="server"></asp:TextBox>
    
    <br /><br />    
    <asp:Label ID="lblParkingPass" runat="server" Text="Should Rare Care provide a US Forest Service parking pass if your assignment requires it?"></asp:Label>&nbsp;&nbsp;
    <asp:DropDownList
        ID="ddlParkingPass" runat="server">
        <asp:ListItem Selected="True">No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
    </asp:DropDownList>
    
    <br /><br />    
    <asp:Label ID="lblDiscoverPass" runat="server" Text="Should Rare Care provide a Discover Pass for state lands if your assignment requires it?"></asp:Label>&nbsp;&nbsp;
    <asp:DropDownList
        ID="ddlDiscoverPass" runat="server">
        <asp:ListItem Selected="True">No</asp:ListItem>
        <asp:ListItem>Yes</asp:ListItem>
    </asp:DropDownList>
    
    <br /><br />
        <div style="font-size:large; text-align:right; padding-right: 50px">

            <asp:LinkButton ID="lnkbtnSend" runat="server" BackColor="Maroon" BorderColor="IndianRed"
            BorderStyle="Solid" BorderWidth="2px" ForeColor="White" OnClick="lnkbtnSend_Click">&nbsp;&nbsp;&nbsp;Submit List&nbsp;&nbsp;&nbsp;</asp:LinkButton>
        
        </div>

    </div>
    
</asp:Panel>

</asp:Content>

