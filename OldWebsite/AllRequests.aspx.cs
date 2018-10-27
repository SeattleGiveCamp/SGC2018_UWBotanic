//UWBG Rare Care Database Search web application
//Provided by David Campbell

//Volunteer Requests C# code behind file 
//Updated September 24, 2013



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
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Drawing;


public partial class AllRequests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        //Clear any messages
        lblMessage.Text = "";
    

    }


    protected void lnkbtnSearch_Click(object sender, EventArgs e)
    {
        
            Response.Redirect("Search.aspx", false);
        
    }


    protected void lnkbtnRequests_Click(object sender, EventArgs e)
    {
        
            Response.Redirect("Requests.aspx", false);
        
    }

    protected void lnkbtnResults_Click(object sender, EventArgs e)
    {
        
            
            Response.Redirect("Results.aspx", false);
        
    }

        

    
    protected void grdvwRequests_Sorted(object sender, EventArgs e)
    {
        //Unselect and databind after sorting to remove viewing, editing, and deleting
        grdvwRequests.SelectedIndex = -1;
        grdvwRequests.DataBind();
    }


    protected void grdvwRequests_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
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

        Session["EO"] = grdvwRequests.SelectedDataKey["EO_ID"].ToString();

        Response.Redirect("RequestDetail.aspx");

    }
}
