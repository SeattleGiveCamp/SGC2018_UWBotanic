//UWBG Rare Care Database Search web application
//Provided by David Campbell

//Request Detail C# code behind file 
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
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEOID.Text = Session["EO"].ToString();
    }
    

}
    
    
