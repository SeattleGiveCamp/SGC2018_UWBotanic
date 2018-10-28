//UWBG Rare Care Database Search web application
//Provided by David Campbell

//Volunteer Requests C# code behind file 
//Updated October 14, 2014



using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;


public partial class Requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblVolName.Text = Session["Name"].ToString();
            lblVolID.Text = Session["VolID"].ToString();

            //Hide Submit form on page load or post back
            pnlSubmit.Visible = false;

            //Clear any messages
            lblMessage.Text = "";
        }
    

    }



    protected void lnkbtnReturn_Click(object sender, EventArgs e)
    {
        if (grdvwRequests.EditIndex != -1)
        { lblMessage.Text = "Please exit Edit mode on your request list by clicking Update or Cancel on the left side of the list"; }
        else
        {
            Session["Name"] = lblVolName.Text;
            Session["VolID"] = lblVolID.Text;
            Response.Redirect("Search.aspx", false);
        }
    }


    protected void lnkbtnAllRequests_Click(object sender, EventArgs e)
    {
        
            Session["Name"] = lblVolName.Text;
            Session["VolID"] = lblVolID.Text;
            Response.Redirect("AllRequests.aspx", false);
        
    }


    protected void grdvwRequests_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        sqldatasrcRequests.DataBind();
        grdvwRequests.DataBind();
        
    }


    protected void lnkbtnResults_Click(object sender, EventArgs e)
    {
        if (grdvwRequests.EditIndex != -1)
        { lblMessage.Text = "Please exit Edit mode on your request list by clicking Update or Cancel on the left side of the list"; }
        else
        {
            Session["Name"] = lblVolName.Text;
            Session["VolID"] = lblVolID.Text;
            Response.Redirect("Results.aspx", false);
        }
    }


    protected void OpenDetails(object sender, EventArgs e)
    {
        Session["EO"] = grdvwRequests.SelectedDataKey["EO_ID"].ToString();
                
        Response.Redirect("RequestDetail.aspx");

    }


    protected void lnkbtnSubmit_Click(object sender, EventArgs e)
    {
        if (grdvwRequests.EditIndex != -1)
        { lblMessage.Text = "Please exit Edit mode on your request list by clicking Update or Cancel on the left side of the list"; }
        else if (grdvwRequests.Rows.Count == 0)
        { lblMessage.Text = "You do not have any requests listed.  Please perform a New Search using the button above, select an opportunity, and add it to your list."; }
        else
        {

            //Unselect and databind on requests to remove viewing, editing, and deleting
            grdvwRequests.SelectedIndex = -1;
            grdvwRequests.DataBind();
            
            //Show questions and submission list
            pnlSubmit.Visible = true;
            grdvwSubmit.DataBind();

            if (grdvwSubmit.Rows.Count == 0)
            {
                lblMessage.Text = "You do not have any requests marked for submission to Rare Care.  Please Edit your requests above and check the 'Submit to Rare Care' checkbox for any requests you would like to submit.";
            }
        }
    }


    protected void lnkbtnSend_Click(object sender, EventArgs e)
    {

        //If no items are listed for submission, do not submit the list
        if (grdvwSubmit.Rows.Count == 0)
        {
            lblMessage.Text = "You do not have any requests marked for submission to Rare Care.  Please Edit your requests above and check the 'Submit to Rare Care' checkbox for any requests you would like to submit.";
            return;
        }
        
        //Hide Submit form upon Send
        pnlSubmit.Visible = false;


        //Append volunteer request to VolunteerRequests in VolunteerOpportunities table
        String strconn = System.Configuration.ConfigurationManager.ConnectionStrings["WORM2007"].ConnectionString;
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(strconn);

        for (int i = 0; i < grdvwSubmit.Rows.Count; i++)
        {
            String strRequestcommand = "UPDATE [VolunteerOpportunities] SET [VolunteerRequests] = IIF([VolunteerRequests] IS NULL,' ',[VolunteerRequests]) + @VolInfo WHERE [EO_ID] = @EO_ID";
            SqlParameter paramRequest = new SqlParameter();
            paramRequest.ParameterName = "@EO_ID";
            paramRequest.Value = grdvwSubmit.Rows[i].Cells[2].Text;
            SqlParameter paramName = new SqlParameter();
            paramName.ParameterName = "@VolInfo";
            paramName.Value = DateTime.Now.ToShortDateString() + " " + lblVolName.Text + " " + grdvwSubmit.Rows[i].Cells[5].Text.Replace("&nbsp;", "").ToString() + " of " + txtTotalAssignments.Text + " USFS parking pass:" + ddlParkingPass.SelectedValue + " Discover Pass:" + ddlDiscoverPass.SelectedValue + ";";

            SqlCommand cmdRequest = new SqlCommand(strRequestcommand, conn);
            cmdRequest.Parameters.Add(paramName);
            cmdRequest.Parameters.Add(paramRequest);

            conn.Open();
            cmdRequest.ExecuteNonQuery();
            conn.Close();


            //Enter submission dates for submitted items
            String strSubmitcommand = "UPDATE [VolunteerRequests] SET [SubmissionDate] = GETDATE(), [ToBeSubmitted] = 0 WHERE [ID] = @RequestID";
            SqlParameter paramID = new SqlParameter();
            paramID.ParameterName = "@RequestID";
            paramID.Value = grdvwSubmit.Rows[i].Cells[1].Text;
            
                        
            SqlCommand cmdSubmit = new SqlCommand(strSubmitcommand, conn);
            cmdSubmit.Parameters.Add(paramID);
            
            
            conn.Open();
            cmdSubmit.ExecuteNonQuery();
            conn.Close();
            
        }


        //Send e-mail to RareCare

        String body;
        body = lblVolName.Text + ", volunteer ID " + lblVolID.Text + ", has requested monitoring assignments." + Environment.NewLine + "Total assignments requested: " + txtTotalAssignments.Text + Environment.NewLine + "Parking pass needed: " + ddlParkingPass.SelectedItem.Text + Environment.NewLine + "Discover Pass needed: " + ddlDiscoverPass.SelectedItem.Text;
        body += Environment.NewLine + Environment.NewLine + "Here are the current requests for this volunteer:";

        for (int i = 0; i < grdvwSubmit.Rows.Count; i++)
        {
            CheckBox chkPartner = (CheckBox)grdvwSubmit.Rows[i].Cells[6].Controls[0];
            body += Environment.NewLine + " Order of Preference: " + grdvwSubmit.Rows[i].Cells[5].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " County: " + grdvwSubmit.Rows[i].Cells[10].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " Phenology: " + grdvwSubmit.Rows[i].Cells[11].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " Species: " + grdvwSubmit.Rows[i].Cells[8].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " EO Number: " + grdvwSubmit.Rows[i].Cells[9].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " Field Partner Requested: " + chkPartner.Checked.ToString() + Environment.NewLine + " Comments: " + grdvwSubmit.Rows[i].Cells[7].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + Environment.NewLine;
        }


        //The server is UW specific and requires SSL, the login information being provided in Web.config
        SmtpClient server = new SmtpClient("smtp.washington.edu");
        server.EnableSsl = true;

        //Send a message to David Campbell for testing or monitoring
        server.Send("sefsapps@u.washington.edu", "sefsapps@uw.edu", "RareCare Monitoring Request", body);
        
        //Send a message to RareCare
        server.Send("sefsapps@u.washington.edu", "rarecare@uw.edu", "RareCare Monitoring Request", body);

        lblMessage.Text = "A notification has been sent to the Rare Care administrator.  You may not edit or delete your submissions, but you may submit more requests.  You should receive a confirmation e-mail message.";



        //Send confirmation e-mail to volunteer

        //Open WORM database to obtain Email from Person table for the volunteer
        
        String strcommand = "SELECT [Email] FROM [Person] WHERE [PersonID] = @VolID";
        SqlParameter param = new SqlParameter();
        param.ParameterName = "@VolID";
        param.Value = lblVolID.Text;        
        
        SqlCommand cmd = new SqlCommand(strcommand, conn);
        cmd.Parameters.Add(param);

        conn.Open();
        SqlDataReader reader;
        reader = cmd.ExecuteReader();

        reader.Read();
        String strEmail = reader.GetString(0).ToString();

        reader.Close();
        conn.Close();

        //Send confirmation message to volunteer
        String volbody;
        volbody = "Thank you for submitting your rare plant monitoring request.  Rare Care will review your choices and post status updates online as decisions are made.  You may see the status updates at any time by returning to https://www.cfr.washington.edu/RareCare, selecting your volunteer record, and clicking 'Review my Requests.'" + Environment.NewLine + Environment.NewLine + "This is an automated message so you cannot reply to it.  If you have any questions about your monitoring requests, please respond to rarecare@uw.edu." + Environment.NewLine + Environment.NewLine + "Total assignments requested: " + txtTotalAssignments.Text + Environment.NewLine + "Parking pass needed: " + ddlParkingPass.SelectedItem.Text + Environment.NewLine + "Discover Pass needed: " + ddlDiscoverPass.SelectedItem.Text;

        volbody += Environment.NewLine + Environment.NewLine + "Here are your current requests:";

        for (int i = 0; i < grdvwSubmit.Rows.Count; i++)
        {
            CheckBox chkPartner = (CheckBox)grdvwSubmit.Rows[i].Cells[6].Controls[0];
            volbody += Environment.NewLine + " Order of Preference: " + grdvwSubmit.Rows[i].Cells[5].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " County: " + grdvwSubmit.Rows[i].Cells[10].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " Phenology: " + grdvwSubmit.Rows[i].Cells[11].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " Species: " + grdvwSubmit.Rows[i].Cells[8].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " EO Number: " + grdvwSubmit.Rows[i].Cells[9].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + " Field Partner Requested: " + chkPartner.Checked.ToString() + Environment.NewLine + " Comments: " + grdvwSubmit.Rows[i].Cells[7].Text.Replace("&nbsp;", "").ToString() + Environment.NewLine + Environment.NewLine;
        }
        
        //Do not send message if there is no e-mail address
        if (strEmail.Length > 0)
        {
            server.Send("sefsapps@u.washington.edu", strEmail, "RareCare Monitoring Request Confirmation", volbody);
        }

        //Databind Requests to reflect submission changes
        grdvwRequests.DataBind();
        
    }



    protected void grdvwRequests_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //Disable details, editing, and deleting for any unselected row
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if ((e.Row.RowState == DataControlRowState.Normal) || (e.Row.RowState == DataControlRowState.Alternate))
            {

                //Disable Details link
                LinkButton lnkbtnDetailsGridView = e.Row.FindControl("lnkbtnDetails") as LinkButton;
                lnkbtnDetailsGridView.Enabled = false;
                lnkbtnDetailsGridView.ForeColor = System.Drawing.Color.Silver;

                //Disable Edit link
                LinkButton lnkbtnEditGridView = e.Row.FindControl("lnkbtnEdit") as LinkButton;
                lnkbtnEditGridView.Enabled = false;
                lnkbtnEditGridView.ForeColor = System.Drawing.Color.Silver;

                //Disable Delete link and pop-up warning
                LinkButton lnkbtnDeleteGridView = e.Row.FindControl("lnkbtnDelete") as LinkButton;
                lnkbtnDeleteGridView.OnClientClick = "";
                lnkbtnDeleteGridView.Enabled = false;
                lnkbtnDeleteGridView.ForeColor = System.Drawing.Color.Silver;
            }
            
        }

        if (e.Row.RowType == DataControlRowType.Header)
        {
            foreach (TableCell cell in e.Row.Cells)
            {
                if (cell.Controls.Count != 0)
                {
                    LinkButton sortLink = (LinkButton)cell.Controls[0];

                    String sortLinkText = sortLink.Text;

                    sortLink.Text += "<img src='Images/Marker.png' title='Sort Ascending' />";

                    if (grdvwRequests.SortExpression == sortLink.CommandArgument)
                    {
                        if (grdvwRequests.SortDirection == SortDirection.Ascending)
                        {
                            sortLink.Text = sortLinkText + "<img src='Images/MarkerUp.png' title='Sorted Ascending' />";
                        }
                        else
                        {
                            sortLink.Text = sortLinkText + "<img src='Images/MarkerDown.png' title='Sorted Descending' />";
                        }
                    }
                }
            } 
        }


    }



    protected void grdvwRequests_SelectedIndexChanged(object sender, EventArgs e)
    {

        //Bind GridView to remove previous selections
        grdvwRequests.DataBind();

        //Remove any message text from last selection
        lblMessage.Text = "";

        //Hide Submit form is visible
        pnlSubmit.Visible = false;

        //Enable viewing of selected item
        LinkButton lnkbtnDetailsGridView = grdvwRequests.SelectedRow.FindControl("lnkbtnDetails") as LinkButton;
        lnkbtnDetailsGridView.Enabled = true;

        //enable editing and deleting of selected item if not assigned or submitted
        CheckBox chkAssignedGridView = grdvwRequests.SelectedRow.FindControl("chkAssigned") as CheckBox;
        Label lblSubmissionDateGridView = grdvwRequests.SelectedRow.FindControl("lblSubmissionDate") as Label;
        Label lblStatusGridView = grdvwRequests.SelectedRow.FindControl("lblStatus") as Label;

        LinkButton lnkbtnEditGridView = grdvwRequests.SelectedRow.FindControl("lnkbtnEdit") as LinkButton;
        LinkButton lnkbtnDeleteGridView = grdvwRequests.SelectedRow.FindControl("lnkbtnDelete") as LinkButton;

        if (!chkAssignedGridView.Checked && lblSubmissionDateGridView.Text == "" && lblStatusGridView.Text == "")
        {
            lnkbtnEditGridView.Enabled = true;

            lnkbtnDeleteGridView.Enabled = true;

        }
        else
        {
            lnkbtnEditGridView.Enabled = false;
            lnkbtnEditGridView.ForeColor = System.Drawing.Color.Silver;
            
            lnkbtnDeleteGridView.Enabled = false;
            lnkbtnDeleteGridView.ForeColor = System.Drawing.Color.Silver;
            lnkbtnDeleteGridView.OnClientClick = "";
            
            //Set message text according to the status of the request, some have no submission dates for now
            if (lblSubmissionDateGridView.Text != "")
            {
                lblMessage.Text = "This EO has been submitted and may not be edited or deleted.";
            }
            if (lblStatusGridView.Text != "")
            {
                lblMessage.Text = "This EO may not be edited or deleted.";
            }
            if (chkAssignedGridView.Checked)
            {
                lblMessage.Text = "This EO has been assigned and may not be edited or deleted.";
            }


        }

        //Highligt selected row
        grdvwRequests.SelectedRow.BackColor = System.Drawing.Color.AliceBlue;

                
    }




    protected void grdvwRequests_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //Unselect and databind on cancel to remove viewing, editing, and deleting
        grdvwRequests.SelectedIndex = -1;
        grdvwRequests.DataBind();
    }


    protected void grdvwRequests_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        //Unselect and databind on update to remove viewing, editing, and deleting
        grdvwRequests.SelectedIndex = -1;
        grdvwRequests.DataBind();
    }


    protected void grdvwRequests_Sorted(object sender, EventArgs e)
    {
        //Unselect and databind after sorting to remove viewing, editing, and deleting
        grdvwRequests.SelectedIndex = -1;
        grdvwRequests.DataBind();
    }





    protected void grdvwSubmit_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        //Mark selected items not to be submitted and rebind the gridviews
        String strconn = System.Configuration.ConfigurationManager.ConnectionStrings["WORM2007"].ConnectionString;
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(strconn);


        String strRequestcommand = "UPDATE [VolunteerRequests] SET [ToBeSubmitted] = 0 WHERE [ID] = @ID";
        SqlParameter paramRequest = new SqlParameter();
        paramRequest.ParameterName = "@ID";
        paramRequest.Value = grdvwSubmit.SelectedDataKey.Values[0];
            
        SqlCommand cmdRequest = new SqlCommand(strRequestcommand, conn);
        cmdRequest.Parameters.Add(paramRequest);
            

        conn.Open();
        cmdRequest.ExecuteNonQuery();
        conn.Close();

        grdvwSubmit.DataBind();
        grdvwRequests.DataBind();

        //If no submissions are remaining, notify user
        if (grdvwSubmit.Rows.Count == 0)
        {
            lblMessage.Text = "You do not have any requests marked for submission to Rare Care.  Please Edit your requests above and check the 'Submit to Rare Care' checkbox for any requests you would like to submit.";
        }
    }


}
