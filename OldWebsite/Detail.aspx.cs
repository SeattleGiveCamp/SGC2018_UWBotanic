//UWBG Rare Care Database Search web application
//Provided by David Campbell

//Item Detail C# code behind file 
//Updated February 14, 2013


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
using System.Data.Odbc;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        
        lblVolName.Text = Session["Name"].ToString();
        lblVolID.Text = Session["VolID"].ToString();
        lblEOID.Text = Session["EO"].ToString();

        //lblMessage.Text = Session["EO"].ToString();

        
        }
    protected void lnkbtnReturn_Click(object sender, EventArgs e)
    {
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Response.Redirect("Results.aspx", false);
    }

    protected void lnkbtnAdd_Click(object sender, EventArgs e)
    {
        Label lblDetailCounty = (Label)frmvwDetail.FindControl("COUNTIESLabel");
        Session["DetailCounty"] = lblDetailCounty.Text;
        Label lblDetailSpecies = (Label)frmvwDetail.FindControl("SpeciesLabel");
        Session["DetailSpecies"] = lblDetailSpecies.Text;
        Label lblDetailEO_Num = (Label)frmvwDetail.FindControl("EO_NUMLabel");
        Session["DetailEO_Num"] = lblDetailEO_Num.Text;
        Label lblDetailPhenology = (Label)frmvwDetail.FindControl("PhenologyLabel");
        Session["DetailPhenology"] = lblDetailPhenology.Text;
        
        //lblMessage.Text = "Session variables: " + Session["Name"].ToString() + " VolID " + Session["VolID"].ToString() + " EOID " + Session["EO"].ToString() + " EO_Num " + Session["DetailEO_Num"].ToString() + " " + Session["DetailSpecies"].ToString() + " " + Session["DetailCounty"].ToString();

        String connString = "Dsn=WORM2007";
        System.Data.Odbc.OdbcConnection sqlconnvolunteerrequests = new System.Data.Odbc.OdbcConnection(connString);

        System.Data.Odbc.OdbcCommand cmd = new System.Data.Odbc.OdbcCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO VolunteerRequests (EO_ID, Vol_ID, VolName, County, Phenology, Species, EO_Num) VALUES (?,?,?,?,?,?,?)";
        cmd.Parameters.AddWithValue("EO_ID", Session["EO"].ToString());
        cmd.Parameters.AddWithValue("Vol_ID", Session["VolID"].ToString());
        cmd.Parameters.AddWithValue("VolName", Session["Name"].ToString());
        cmd.Parameters.AddWithValue("County", Session["DetailCounty"].ToString());
        cmd.Parameters.AddWithValue("Phenology", Session["DetailPhenology"].ToString());
        cmd.Parameters.AddWithValue("Species", Session["DetailSpecies"].ToString());
        cmd.Parameters.AddWithValue("DetailEO_Num", Session["DetailEO_Num"].ToString());

        cmd.Connection = sqlconnvolunteerrequests;

        sqlconnvolunteerrequests.Open();
        cmd.ExecuteNonQuery();
        sqlconnvolunteerrequests.Close();

        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Session["EO"] = lblEOID.Text;

        Response.Redirect("Requests.aspx", false);
    }
    protected void lnkbtnRequests_Click(object sender, EventArgs e)
    {
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Response.Redirect("Requests.aspx", false);
    }
}
    
    
