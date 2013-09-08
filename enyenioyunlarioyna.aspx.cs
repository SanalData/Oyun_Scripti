using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    Int32 toplamoyun = 0;
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "En Yeni Oyunlar | Oyun De";
        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                baglanti.Open();

                //kategoriler
                MySqlCommand o11 = new MySqlCommand("select * from kategoriler", baglanti);
                MySqlDataAdapter oa11 = new MySqlDataAdapter(o11);
                DataTable ot11 = new DataTable();
                oa11.Fill(ot11);
                kategoriler.DataSource = ot11;
                kategoriler.DataBind();
                ot11.Clear();


                //anasayfa oyun1
                MySqlCommand o1 = new MySqlCommand("select id,adi,resim,hit from oyunlar where onay='1'  order by id desc limit 20;", baglanti);
                MySqlDataAdapter oa1 = new MySqlDataAdapter(o1);
                DataTable ot1 = new DataTable();
                oa1.Fill(ot1);
                oyunlar1.DataSource = ot1;
                oyunlar1.DataBind();
                ot1.Clear();
            }
            finally
            {
                baglanti.Close();
            }
        }
      

        try
        {
            toplamoyun = Convert.ToInt32(Request.Cookies["toplamoyun"].Value);
           
        }
        catch
        {
            Response.Cookies["toplamoyun"].Value = "0";

        }
    }
}