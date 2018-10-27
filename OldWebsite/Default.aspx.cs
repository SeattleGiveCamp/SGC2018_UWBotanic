//UWBG Rare Care Database Search web application
//Provided by David Campbell

//Default C# code behind file 
//Updated September 16, 2013



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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void lnkbtnProceed_Click(object sender, EventArgs e)
    {
        if (listContact.Items.Count == 0)
        { lblMessage.Text = "You must select a volunteer record before proceeding.  If you are unable to find any matching records, you might be listed under a hyphenated or maiden name.  Please try again or check our list of <a href='http://courses.washington.edu/rarecare/private/Listofmonitors.pdf' target='_blank'>Rare Plant Monitors</a> to see how your last name appears in our records.  If you still need help, you may contact <a href='mailto:rarecare@uw.edu'>rarecare@uw.edu</a>."; }
        
        else
        {
        //Store the volunteer name and PersonID for display and requests table 
        Session["Name"] = listContact.SelectedItem.Text;
        Session["VolID"] = listContact.SelectedItem.Value;

        //Send the user to the search page
        lblMessage.Text = "";
        Response.Redirect("Search.aspx", false);
        }
    }


    protected void lnkbtnFindMe_Click(object sender, EventArgs e)
    {
        accessdatasrcWORMVol.DataBind();
        listContact.DataBind();
        if (listContact.Items.Count == 0)
        { lblMessage.Text = "Sorry, we have no matches for that last name. Might we have you listed under a hyphenated last name or maiden name instead? Please try again, or check our list of <a href='http://courses.washington.edu/rarecare/private/Listofmonitors.pdf' target='_blank'>Rare Plant Monitors</a> to see how your last name appears in our records.  If you still need help, you may contact <a href='mailto:rarecare@uw.edu'>rarecare@uw.edu</a>."; }
        else
        { lblMessage.Text = ""; }

    }

    protected void lnkbtnRequests_Click(object sender, EventArgs e)
    {
        if (listContact.Items.Count == 0)
        {
            lblMessage.Text = "You must select a volunteer record before viewing requests.";
        }
        else
        {
            //Store the volunteer name and PersonID for display and requests table 
            Session["Name"] = listContact.SelectedItem.Text;
            Session["VolID"] = listContact.SelectedItem.Value;
            Response.Redirect("Requests.aspx", false);
        }
    }

    protected void lnkbtnAllRequests_Click(object sender, EventArgs e)
    {
        if (listContact.Items.Count == 0)
        {
            lblMessage.Text = "You must select a volunteer record before viewing requests.";
        }
        else
        {
            Session["Name"] = listContact.SelectedItem.Text;
            Session["VolID"] = listContact.SelectedItem.Value;
            Response.Redirect("AllRequests.aspx", false);
        }
    }
}
