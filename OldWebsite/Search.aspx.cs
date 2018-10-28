//UWBG Rare Care Database Search web application
//Provided by David Campbell

//Search volunteer opportunities C# code behind file 
//Updated November 12, 2013


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
        lblMessage.Text = "";
        
        lblVolName.Text = Session["Name"].ToString();
        lblVolID.Text = Session["VolID"].ToString();

        //Clear session variables used in searches
        Session["Species"] = "%";
        Session["County"] = "%";

        //Set session variables for each county, which are cleared for searches
        //involving individual counties
        Session["Adams"] = "%Adams%";
        Session["Asotin"] = "%Asotin%";
        Session["Benton"] = "%Benton%";
        Session["Chelan"] = "%Chelan%";
        Session["Clallam"] = "%Clallam%";
        Session["Clark"] = "%Clark%";
        Session["Columbia"] = "%Columbia%";
        Session["Cowlitz"] = "%Cowlitz%";
        Session["Douglas"] = "%Douglas%";
        Session["Ferry"] = "%Ferry%";
        Session["Franklin"] = "%Franklin%";
        Session["Garfield"] = "%Garfield%";
        Session["Grant"] = "%Grant%";
        Session["Grays Harbor"] = "%Grays Harbor%";
        Session["Island"] = "%Island%";
        Session["Jefferson"] = "%Jefferson%";
        Session["King"] = "%King%";
        Session["Kitsap"] = "%Kitsap%";
        Session["Kittitas"] = "%Kittitas%";
        Session["Klickitat"] = "%Klickitat%";
        Session["Lewis"] = "%Lewis%";
        Session["Lincoln"] = "%Lincoln%";
        Session["Mason"] = "%Mason%";
        Session["Okanogan"] = "%Okanogan%";
        Session["Pacific"] = "%Pacific%";
        Session["Pend Oreille"] = "%Pend Oreille%";
        Session["Pierce"] = "%Pierce%";
        Session["San Juan"] = "%San Juan%";
        Session["Skagit"] = "%Skagit%";
        Session["Skamania"] = "%Skamania%";
        Session["Snohomish"] = "%Snohomish%";
        Session["Spokane"] = "%Spokane%";
        Session["Stevens"] = "%Stevens%";
        Session["Thurston"] = "%Thurston%";
        Session["Wahkiakum"] = "%Wahkiakum%";
        Session["Walla Walla"] = "%Walla Walla%";
        Session["Whatcom"] = "%Whatcom%";
        Session["Whitman"] = "%Whitman%";
        Session["Yakima"] = "%Yakima%";
        

        Session["Ease"] = "%";
        Session["Month"] = "%";

        //Set session variables for each month, which are cleared for searches
        //involving individual months
        Session["January"] = "%January%";
        Session["February"] = "%February%";
        Session["March"] = "%March%";
        Session["April"] = "%April%";
        Session["May"] = "%May%";
        Session["June"] = "%June%";
        Session["July"] = "%July%";
        Session["August"] = "%August%";
        Session["September"] = "%September%";
        Session["October"] = "%October%";
        Session["November"] = "%November%";
        Session["December"] = "%December%";

        Session["Priority"] = "%";
        
        //Handle 'no preference' settings of some controls
        if (!Page.IsPostBack)
        {
            if (txtGenus.Text == "No preference")
            {
                accessdatasrcSpecies.SelectCommand = "SELECT DISTINCT [Species] FROM [VolunteerOpportunities] ORDER BY [Species]";
                accessdatasrcSpecies.DataBind();
                ddlSpecies.DataBind();
                ddlSpecies.Items.Insert(0, new ListItem("No preference", "%"));
                ddlSpecies.SelectedIndex = 0;

                //lblMessage.Text = "page load code run";
            }
        }

        //lblMessage.Text = "Ease: " + Session["Ease"].ToString() + "Priority: " + Session["Priority"].ToString();
        
    }
    
    
    protected void lnkbtnBrowse_Click(object sender, EventArgs e)
    {
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Response.Redirect("Results.aspx", false);
    }
    
  
  
    //Search by Species
    protected void lnkbtnSearchSpecies_Click(object sender, EventArgs e)
    {
        Session["Species"] = ddlSpecies.SelectedValue.ToString();
        
        if (txtGenus.Text != "No preference" && ddlSpecies.SelectedItem.Text == "No preference")
            { Session["Species"] = "%" + txtGenus.Text + "%"; }

        //lblMessage.Text = Session["Species"].ToString() + Session["County"].ToString();
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Response.Redirect("Results.aspx", false);
    }
    
    
    
    
    protected void txtGenus_TextChanged(object sender, EventArgs e)
    {
        accessdatasrcSpecies.SelectCommand = "SELECT DISTINCT [Species] FROM [VolunteerOpportunities] WHERE ([Species] LIKE '%' + ? + '%') AND [NotonWeb] = 'FALSE' ORDER BY [Species]";
        accessdatasrcSpecies.DataBind();
        ddlSpecies.DataBind();
        ddlSpecies.Items.Insert(0, new ListItem("No preference", "%"));
        ddlSpecies.SelectedIndex = 0;

        if (txtGenus.Text == "No preference")
        {
            accessdatasrcSpecies.SelectCommand = "SELECT DISTINCT [Species] FROM [VolunteerOpportunities] ORDER BY [Species]";
            accessdatasrcSpecies.DataBind();
            ddlSpecies.DataBind();
            ddlSpecies.Items.Insert(0, new ListItem("No preference", "%"));
            ddlSpecies.SelectedIndex = 0;
            
        }

        //lblMessage.Text = txtGenus.Text.Trim().Length.ToString();
    }
    protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlRegion.SelectedItem.Text == "Western")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Clallam");
            ddlCounty.Items.Add("Grays Harbor");
            ddlCounty.Items.Add("Jefferson");
            ddlCounty.Items.Add("Kitsap");
            ddlCounty.Items.Add("Mason");
            ddlCounty.Items.Add("Island");
            ddlCounty.Items.Add("King");
            ddlCounty.Items.Add("San Juan");
            ddlCounty.Items.Add("Skagit");
            ddlCounty.Items.Add("Snohomish");
            ddlCounty.Items.Add("Whatcom");
            ddlCounty.Items.Add("Clark");
            ddlCounty.Items.Add("Lewis");
            ddlCounty.Items.Add("Pacific");
            ddlCounty.Items.Add("Pierce");
            ddlCounty.Items.Add("Skamania");
            ddlCounty.Items.Add("Thurston");
            ddlCounty.Items.Add("Wahkiakum");
        }

        if (ddlRegion.SelectedItem.Text == "Central")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Chelan");
            ddlCounty.Items.Add("Douglas");
            ddlCounty.Items.Add("Okanogan");
            ddlCounty.Items.Add("Benton");
            ddlCounty.Items.Add("Grant");
            ddlCounty.Items.Add("Kittitas");
            ddlCounty.Items.Add("Klickitat");
            ddlCounty.Items.Add("Yakima");
        }

        if (ddlRegion.SelectedItem.Text == "Eastern")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Ferry");
            ddlCounty.Items.Add("Lincoln");
            ddlCounty.Items.Add("Pend Oreille");
            ddlCounty.Items.Add("Spokane");
            ddlCounty.Items.Add("Stevens");
            ddlCounty.Items.Add("Adams");
            ddlCounty.Items.Add("Asotin");
            ddlCounty.Items.Add("Columbia");
            ddlCounty.Items.Add("Franklin");
            ddlCounty.Items.Add("Garfield");
            ddlCounty.Items.Add("Walla Walla");
            ddlCounty.Items.Add("Whitman");
        }

        if (ddlRegion.SelectedItem.Text == "Western: Olympic")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Clallam");
            ddlCounty.Items.Add("Grays Harbor");
            ddlCounty.Items.Add("Jefferson");
            ddlCounty.Items.Add("Kitsap");
            ddlCounty.Items.Add("Mason");
        }

        if (ddlRegion.SelectedItem.Text == "Western: North")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Island");
            ddlCounty.Items.Add("King");
            ddlCounty.Items.Add("San Juan");
            ddlCounty.Items.Add("Skagit");
            ddlCounty.Items.Add("Snohomish");
            ddlCounty.Items.Add("Whatcom");
        }

        if (ddlRegion.SelectedItem.Text == "Western: South")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Clark");
            ddlCounty.Items.Add("Lewis");
            ddlCounty.Items.Add("Pacific");
            ddlCounty.Items.Add("Pierce");
            ddlCounty.Items.Add("Skamania");
            ddlCounty.Items.Add("Thurston");
            ddlCounty.Items.Add("Wahkiakum");
        }

        if (ddlRegion.SelectedItem.Text == "Central: North")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Chelan");
            ddlCounty.Items.Add("Douglas");
            ddlCounty.Items.Add("Okanogan");
        }

        if (ddlRegion.SelectedItem.Text == "Central: South")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Benton");
            ddlCounty.Items.Add("Grant");
            ddlCounty.Items.Add("Kittitas");
            ddlCounty.Items.Add("Klickitat");
            ddlCounty.Items.Add("Yakima");
        }

        if (ddlRegion.SelectedItem.Text == "Eastern: North")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Ferry");
            ddlCounty.Items.Add("Lincoln");
            ddlCounty.Items.Add("Pend Oreille");
            ddlCounty.Items.Add("Spokane");
            ddlCounty.Items.Add("Stevens");
        }
        
        
        if (ddlRegion.SelectedItem.Text == "Eastern: South")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Adams");
            ddlCounty.Items.Add("Asotin");
            ddlCounty.Items.Add("Columbia");
            ddlCounty.Items.Add("Franklin");
            ddlCounty.Items.Add("Garfield");
            ddlCounty.Items.Add("Walla Walla");
            ddlCounty.Items.Add("Whitman");
        }

        if (ddlRegion.SelectedItem.Text == "No preference")
        {
            ddlCounty.Items.Clear();
            ddlCounty.Items.Add("No preference");
            ddlCounty.Items.Add("Adams");
            ddlCounty.Items.Add("Asotin");
            ddlCounty.Items.Add("Benton");
            ddlCounty.Items.Add("Chelan");
            ddlCounty.Items.Add("Clallam");
            ddlCounty.Items.Add("Clark");
            ddlCounty.Items.Add("Columbia");
            ddlCounty.Items.Add("Douglas");
            ddlCounty.Items.Add("Ferry");
            ddlCounty.Items.Add("Franklin");
            ddlCounty.Items.Add("Garfield");
            ddlCounty.Items.Add("Grant");
            ddlCounty.Items.Add("Grays Harbor");
            ddlCounty.Items.Add("Island");
            ddlCounty.Items.Add("Jefferson");
            ddlCounty.Items.Add("King");
            ddlCounty.Items.Add("Kitsap");
            ddlCounty.Items.Add("Kittitas");
            ddlCounty.Items.Add("Klickitat");
            ddlCounty.Items.Add("Lewis");
            ddlCounty.Items.Add("Lincoln");
            ddlCounty.Items.Add("Mason");
            ddlCounty.Items.Add("Okanogan");
            ddlCounty.Items.Add("Pacific");
            ddlCounty.Items.Add("Pend Oreille");
            ddlCounty.Items.Add("Pierce");
            ddlCounty.Items.Add("San Juan");
            ddlCounty.Items.Add("Skagit");
            ddlCounty.Items.Add("Skamania");
            ddlCounty.Items.Add("Snohomish");
            ddlCounty.Items.Add("Spokane");
            ddlCounty.Items.Add("Stevens");
            ddlCounty.Items.Add("Thurston");
            ddlCounty.Items.Add("Wahkiakum");
            ddlCounty.Items.Add("Walla Walla");
            ddlCounty.Items.Add("Whatcom");
            ddlCounty.Items.Add("Whitman");
            ddlCounty.Items.Add("Yakima");
                        
        }

        //lblMessage.Text = ddlCounty.SelectedItem.Text;
    }

    //Search by Region or Phenology
    protected void lnkbtnSearchRegion_Click(object sender, EventArgs e)
    {

        //Set session variables for months selected using Region drop-down list
        String strRegion = ddlRegion.SelectedItem.Text.ToString();
        String strCounty = ddlCounty.SelectedItem.Text.ToString();

        if (!strCounty.Equals("No preference"))
        {
            Session["County"] = "none";
            Session["Adams"] = "none";
            Session["Asotin"] = "none";
            Session["Benton"] = "none";
            Session["Chelan"] = "none";
            Session["Clallam"] = "none";
            Session["Clark"] = "none";
            Session["Columbia"] = "none";
            Session["Cowlitz"] = "none";
            Session["Douglas"] = "none";
            Session["Ferry"] = "none";
            Session["Franklin"] = "none";
            Session["Garfield"] = "none";
            Session["Grant"] = "none";
            Session["Grays Harbor"] = "none";
            Session["Island"] = "none";
            Session["Jefferson"] = "none";
            Session["King"] = "none";
            Session["Kitsap"] = "none";
            Session["Kittitas"] = "none";
            Session["Klickitat"] = "none";
            Session["Lewis"] = "none";
            Session["Lincoln"] = "none";
            Session["Mason"] = "none";
            Session["Okanogan"] = "none";
            Session["Pacific"] = "none";
            Session["Pend Oreille"] = "none";
            Session["Pierce"] = "none";
            Session["San Juan"] = "none";
            Session["Skagit"] = "none";
            Session["Skamania"] = "none";
            Session["Snohomish"] = "none";
            Session["Spokane"] = "none";
            Session["Stevens"] = "none";
            Session["Thurston"] = "none";
            Session["Wahkiakum"] = "none";
            Session["Walla Walla"] = "none";
            Session["Whatcom"] = "none";
            Session["Whitman"] = "none";
            Session["Yakima"] = "none";

            Session[strCounty] = "%"+strCounty+"%";
        }

        if (!strRegion.Equals("No preference") && strCounty.Equals("No preference"))
        {
            Session["County"] = "none";
            Session["Adams"] = "none";
            Session["Asotin"] = "none";
            Session["Benton"] = "none";
            Session["Chelan"] = "none";
            Session["Clallam"] = "none";
            Session["Clark"] = "none";
            Session["Columbia"] = "none";
            Session["Cowlitz"] = "none";
            Session["Douglas"] = "none";
            Session["Ferry"] = "none";
            Session["Franklin"] = "none";
            Session["Garfield"] = "none";
            Session["Grant"] = "none";
            Session["Grays Harbor"] = "none";
            Session["Island"] = "none";
            Session["Jefferson"] = "none";
            Session["King"] = "none";
            Session["Kitsap"] = "none";
            Session["Kittitas"] = "none";
            Session["Klickitat"] = "none";
            Session["Lewis"] = "none";
            Session["Lincoln"] = "none";
            Session["Mason"] = "none";
            Session["Okanogan"] = "none";
            Session["Pacific"] = "none";
            Session["Pend Oreille"] = "none";
            Session["Pierce"] = "none";
            Session["San Juan"] = "none";
            Session["Skagit"] = "none";
            Session["Skamania"] = "none";
            Session["Snohomish"] = "none";
            Session["Spokane"] = "none";
            Session["Stevens"] = "none";
            Session["Thurston"] = "none";
            Session["Wahkiakum"] = "none";
            Session["Walla Walla"] = "none";
            Session["Whatcom"] = "none";
            Session["Whitman"] = "none";
            Session["Yakima"] = "none";

            if (strRegion == "Western")
            {
                Session["Clallam"] = "%Clallam%";
                Session["Grays Harbor"] = "%Grays Harbor%";
                Session["Jefferson"] = "%Jefferson%";
                Session["Kitsap"] = "%Kitsap%";
                Session["Mason"] = "%Mason%";
                Session["Island"] = "%Island%";
                Session["King"] = "%King%";
                Session["San Juan"] = "%San Juan%";
                Session["Skagit"] = "%Skagit%";
                Session["Snohomish"] = "%Snohomish%";
                Session["Whatcom"] = "%Whatcom%";
                Session["Clark"] = "%Clark%";
                Session["Lewis"] = "%Lewis%";
                Session["Pacific"] = "%Pacific%";
                Session["Pierce"] = "%Pierce%";
                Session["Skamania"] = "%Skamania%";
                Session["Thurston"] = "%Thurston%";
                Session["Wahkiakum"] = "%Wahkiakum%";
            }

            if (strRegion == "Central")
            {
                Session["Chelan"] = "%Chelan%";
                Session["Douglas"] = "%Douglas%";
                Session["Okanogan"] = "%Okanogan%";
                Session["Benton"] = "%Benton%";
                Session["Grant"] = "%Grant%";
                Session["Kittitas"] = "%Kittitas%";
                Session["Klickitat"] = "%Klickitat%";
                Session["Yakima"] = "%Yakima%";
            }

            if (strRegion == "Eastern")
            {
                Session["Ferry"] = "%Ferry%";
                Session["Lincoln"] = "%Lincoln%";
                Session["Pend Oreille"] = "%Pend Oreille%";
                Session["Spokane"] = "%Spokane%";
                Session["Stevens"] = "%Stevens%";
                Session["Adams"] = "%Adams%";
                Session["Asotin"] = "%Asotin%";
                Session["Columbia"] = "%Columbia%";
                Session["Franklin"] = "%Franklin%";
                Session["Garfield"] = "%Garfield%";
                Session["Walla Walla"] = "%Walla Walla%";
                Session["Whitman"] = "%Whitman%";
            }

            if (strRegion == "Western: Olympic")
            {
                Session["Clallam"] = "%Clallam%";
                Session["Grays Harbor"] = "%Grays Harbor%";
                Session["Jefferson"] = "%Jefferson%";
                Session["Kitsap"] = "%Kitsap%";
                Session["Mason"] = "%Mason%";
            }

            if (strRegion == "Western: North")
            {
                Session["Island"] = "%Island%";
                Session["King"] = "%King%";
                Session["San Juan"] = "%San Juan%";
                Session["Skagit"] = "%Skagit%";
                Session["Snohomish"] = "%Snohomish%";
                Session["Whatcom"] = "%Whatcom%";
            }

            if (strRegion == "Western: South")
            {
                Session["Clark"] = "%Clark%";
                Session["Lewis"] = "%Lewis%";
                Session["Pacific"] = "%Pacific%";
                Session["Pierce"] = "%Pierce%";
                Session["Skamania"] = "%Skamania%";
                Session["Thurston"] = "%Thurston%";
                Session["Wahkiakum"] = "%Wahkiakum%";
            }

            if (strRegion == "Central: North")
            {
                Session["Chelan"] = "%Chelan%";
                Session["Douglas"] = "%Douglas%";
                Session["Okanogan"] = "%Okanogan%";
            }

            if (strRegion == "Central: South")
            {
                Session["Benton"] = "%Benton%";
                Session["Grant"] = "%Grant%";
                Session["Kittitas"] = "%Kittitas%";
                Session["Klickitat"] = "%Klickitat%";
                Session["Yakima"] = "%Yakima%";
            }

            if (strRegion == "Eastern: North")
            {
                Session["Ferry"] = "%Ferry%";
                Session["Lincoln"] = "%Lincoln%";
                Session["Pend Oreille"] = "%Pend Oreille%";
                Session["Spokane"] = "%Spokane%";
                Session["Stevens"] = "%Stevens%";
            }


            if (strRegion == "Eastern: South")
            {
                Session["Adams"] = "%Adams%";
                Session["Asotin"] = "%Asotin%";
                Session["Columbia"] = "%Columbia%";
                Session["Franklin"] = "%Franklin%";
                Session["Garfield"] = "%Garfield%";
                Session["Walla Walla"] = "%Walla Walla%";
                Session["Whitman"] = "%Whitman%";
            }


        }

        Session["Ease"] = ddlEase.SelectedItem.Text;

        if (Session["Ease"].Equals("No preference"))
        { Session["Ease"] = "%"; }

        
        //Set session variables for months selected using Time of Year drop-down list
        String strSeason = ddlSeason.SelectedItem.Text.ToString();
        String strMonth = ddlMonths.SelectedItem.Text.ToString();

        if (!strMonth.Equals("No preference"))
        {
            Session["Month"] = "none";
            Session["January"] = "none";
            Session["February"] = "none";
            Session["March"] = "none";
            Session["April"] = "none";
            Session["May"] = "none";
            Session["June"] = "none";
            Session["July"] = "none";
            Session["August"] = "none";
            Session["September"] = "none";
            Session["October"] = "none";
            Session["November"] = "none";
            Session["December"] = "none";

            Session[strMonth] = "%" + strMonth + "%";
        }

        if (!strSeason.Equals("No preference") && strMonth.Equals("No preference"))
        {
            Session["Month"] = "none";
            Session["January"] = "none";
            Session["February"] = "none";
            Session["March"] = "none";
            Session["April"] = "none";
            Session["May"] = "none";
            Session["June"] = "none";
            Session["July"] = "none";
            Session["August"] = "none";
            Session["September"] = "none";
            Session["October"] = "none";
            Session["November"] = "none";
            Session["December"] = "none";

            if (strSeason == "Early Spring")
            {                
                Session["April"] = "%April%";
                Session["March"] = "%March%";
                
            }

            if (strSeason == "Spring")
            {
                Session["June"] = "%June%";
                Session["May"] = "%May%";
            }

            if (strSeason == "Summer")
            {
                Session["July"] = "%July%";
                Session["August"] = "%August%";
            }

            if (strSeason == "Fall")
            {
                Session["September"] = "%September%";
                Session["October"] = "%October%";
                Session["November"] = "%November%";
            }
        }
               

        Session["Priority"] = ddlPriority.SelectedItem.Text;

        if (Session["Priority"].Equals("No preference"))
        { Session["Priority"] = "%"; }
        
        
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Response.Redirect("Results.aspx", false);

        //lblMessage.Text = Session["Month"] + " " + Session["January"].ToString() + " " + Session["February"].ToString() + " " + Session["March"].ToString() + " " + Session["April"].ToString() + " " + Session["May"].ToString() + " " + Session["June"].ToString() + " " + Session["July"].ToString() + " " + Session["August"].ToString() + " " + Session["September"].ToString() + " " + Session["October"].ToString() + " " + Session["November"].ToString() + " " + Session["December"].ToString();
    }

    protected void lnkbtnRequests_Click(object sender, EventArgs e)
    {
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Response.Redirect("Requests.aspx", false);
    }
    protected void ddlSeason_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSeason.SelectedItem.Text == "Early Spring")
        {
            ddlMonths.Items.Clear();
            ddlMonths.Items.Add("No preference");
            ddlMonths.Items.Add("March");
            ddlMonths.Items.Add("April");
            
        }

        if (ddlSeason.SelectedItem.Text == "Spring")
        {
            ddlMonths.Items.Clear();
            ddlMonths.Items.Add("No preference");
            ddlMonths.Items.Add("May");
            ddlMonths.Items.Add("June");

        }

        if (ddlSeason.SelectedItem.Text == "Summer")
        {
            ddlMonths.Items.Clear();
            ddlMonths.Items.Add("No preference");
            ddlMonths.Items.Add("July");
            ddlMonths.Items.Add("August");

        }

        if (ddlSeason.SelectedItem.Text == "Fall")
        {
            ddlMonths.Items.Clear();
            ddlMonths.Items.Add("No preference");
            ddlMonths.Items.Add("September");
            ddlMonths.Items.Add("October");
            ddlMonths.Items.Add("November");

        }

        if (ddlSeason.SelectedItem.Text == "No preference")
        {
            ddlMonths.Items.Clear();
            ddlMonths.Items.Add("No preference");
            ddlMonths.Items.Add("January");
            ddlMonths.Items.Add("February");
            ddlMonths.Items.Add("March");
            ddlMonths.Items.Add("April");
            ddlMonths.Items.Add("May");
            ddlMonths.Items.Add("June");
            ddlMonths.Items.Add("July");
            ddlMonths.Items.Add("August");
            ddlMonths.Items.Add("September");
            ddlMonths.Items.Add("October");
            ddlMonths.Items.Add("November");
            ddlMonths.Items.Add("December");

        }
    }

    protected void lnkbtnAllRequests_Click(object sender, EventArgs e)
    {

        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Response.Redirect("AllRequests.aspx", false);

    }

}
