//UWBG Rare Care Database Search web application
//Provided by David Campbell

//Search Results C# code behind file 
//Updated October 25, 2013


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



public partial class Results : System.Web.UI.Page
{
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        lblVolName.Text = Session["Name"].ToString();
        lblVolID.Text = Session["VolID"].ToString();

        if (grdvwResults.Rows.Count == 0)
        { lblMessage.Text = "There are no records matching the criteria you selected.  Please revise your criteria or broaden your search parameters."; }
        else lblMessage.Text = "";

        

        if (!Page.IsPostBack)
        {
            // Sort GridView by last sorted column if returning to page
            if (Session["Sort"] != null && Session["SortOrder"] != null)
            {
                if (Session["Sort"].ToString() != "None")
                {
                    SortDirection direction;

                    if (Session["SortOrder"].ToString() == "Ascending")
                    {
                        direction = SortDirection.Ascending;
                    }
                    else
                    {
                        direction = SortDirection.Descending;
                    }

                    grdvwResults.Sort(Session["Sort"].ToString(), direction);
                    grdvwResults.DataBind();
                }
                
            }
        }
         
    }


    protected void lnkbtnReturn_Click(object sender, EventArgs e)
    {
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Session["Sort"] = "None";
        Response.Redirect("Search.aspx", false);
    }

    protected void lnkbtnAllRequests_Click(object sender, EventArgs e)
    {

        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Session["Sort"] = grdvwResults.SortExpression.ToString();
        Response.Redirect("AllRequests.aspx", false);

    }


    protected void grdvwResults_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["EO"] = grdvwResults.SelectedValue.ToString();
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Session["Sort"] = grdvwResults.SortExpression.ToString();
        Response.Redirect("Detail.aspx", false);
    }


    protected void lnkbtnRequests_Click(object sender, EventArgs e)
    {
        Session["Name"] = lblVolName.Text;
        Session["VolID"] = lblVolID.Text;
        Session["Sort"] = grdvwResults.SortExpression.ToString();
        Response.Redirect("Requests.aspx", false);

    }


    protected void grdvwResults_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        //Add graphic sort indicators to header for any rows that allow sorting
        if (e.Row.RowType == DataControlRowType.Header)
        {
            foreach (TableCell cell in e.Row.Cells)
            {
                if (cell.Controls.Count != 0)
                {
                    LinkButton sortLink = (LinkButton)cell.Controls[0];

                    String sortLinkText = sortLink.Text;

                    sortLink.Text += "<img src='Images/Marker.png' title='Sort Ascending' />";

                    if (grdvwResults.SortExpression == sortLink.CommandArgument)
                    {
                        if (grdvwResults.SortDirection == SortDirection.Ascending)
                        {
                            sortLink.Text = sortLinkText + "<img src='Images/MarkerUp.png' title='Sorted Ascending' />";
                            Session["SortOrder"] = "Ascending";
                        }
                        else
                        {
                            sortLink.Text = sortLinkText + "<img src='Images/MarkerDown.png' title='Sorted Descending' />";
                            Session["SortOrder"] = "Descending";
                        }
                    }
                }
            }
        }

    }

    
    
}
