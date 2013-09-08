using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Data;

public partial class haberler : System.Web.UI.Page
{
    Int32 toplamoyun = 0;
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    fonksiyonlar fonk = new fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                baglanti.Open();

                //haberler
                MySqlCommand rr1 = new MySqlCommand("select baslik from konular order by id desc limit 5;", baglanti);
                MySqlDataAdapter ar1 = new MySqlDataAdapter(rr1);
                DataTable y1 = new DataTable();
                ar1.Fill(y1);
                //kategoriler
                MySqlCommand o11 = new MySqlCommand("select * from kategoriler", baglanti);
                MySqlDataAdapter oa11 = new MySqlDataAdapter(o11);
                DataTable ot11 = new DataTable();
                oa11.Fill(ot11);
                kategoriler.DataSource = ot11;
                kategoriler.DataBind();
                ot11.Clear();

                sonhaberler.DataSource = y1;
                sonhaberler.DataBind();
                ar1.Dispose();


                string id = fonk.sqlkoruma(Request.QueryString["id"]);
                MySqlCommand t = new MySqlCommand("select * from konular where isapi='" + id + "'", baglanti);
                MySqlDataReader a = t.ExecuteReader();
                while (a.Read())
                {
                    Page.Title = a["baslik"].ToString();
                    Page.MetaDescription = fonk.Left(fonk.htmlencode(a["icerik"].ToString()), 250);
                    Page.MetaKeywords = a["baslik"].ToString();

                    baslik.Text = a["baslik"].ToString();
                
                    icerik.Text = a["icerik"].ToString();

                } a.Close(); a.Dispose();

            }
            finally
            {
                baglanti.Close();
            }
        }

    }
}