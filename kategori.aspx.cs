using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Data;

public partial class kategori : System.Web.UI.Page
{
    fonksiyonlar fonk = new fonksiyonlar();
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    string id, sorgu;
    protected void Page_Load(object sender, EventArgs e)
    {


        id = Request.QueryString["id"].Replace("-", " ");
        sorgu = fonk.sqlkoruma(Request.QueryString["id"].Replace("-", " "));

     
         Page.MetaKeywords = id + " oyunu oyna," + id + " indirmeden oyna," + id + " incelemesi," + id + " facebooktan oyna," + id + " oyunu resimleri";
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
                 MySqlCommand o1 = new MySqlCommand("select id,adi,resim,hit from oyunlar where onay='1' and kategori='" + @sorgu + "' order by id desc;", baglanti);
                 MySqlDataAdapter oa1 = new MySqlDataAdapter(o1);
                 DataTable ot1 = new DataTable();
                 oa1.Fill(ot1);
                 oyunlar1.DataSource = ot1;
                 oyunlar1.DataBind();

                 ot1.Clear();

                 // kategori acıklaması
                 o1 = new MySqlCommand("select aciklama,kad from kategoriler where isapi='" + @sorgu + "' limit 1;", baglanti);
                 MySqlDataReader ar = o1.ExecuteReader();
                 while (ar.Read())
                 {
                     Page.Title = ar["kad"].ToString() + " oyunları kategorisindeki oyunlar";
                     aciklama.Text = ar["aciklama"].ToString();
                     kad.Text = ar["kad"].ToString();

                     Page.MetaDescription = ar["aciklama"].ToString().Replace("nbsp;", "");

                 } ar.Close();
                 ar.Dispose();
             }
             finally
             {
                 baglanti.Close();
             }
         }


    }
}