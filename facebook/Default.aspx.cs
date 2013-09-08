using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;

public partial class oyun_Default : System.Web.UI.Page
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    fonksiyonlar fonk = new fonksiyonlar();
    string islem = null;
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["facebook"] = "evet";
        islem = Request.QueryString["islem"];
        if (islem == null)
        {
            oyunlar.DataSource = fonk.adaptor("select * from oyunlar order by rand() limit 32");
            oyunlar.DataBind();
            oyunlar.Dispose();
        }
        else
        {
            oyunpnl.Visible = true;
            id = fonk.sqlkoruma(Request.QueryString["id"]);
           

        }
    }
}