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
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    fonksiyonlar fonk = new fonksiyonlar();
    MySqlConnection baglanti;
    string id, sorgu;
    protected void Page_Load(object sender, EventArgs e)
    {
     
        
        id = Request.QueryString["id"].Replace("-", " ");
        sorgu = fonk.sqlkoruma(Request.QueryString["id"]);
        sorgu = sorgu.Replace("-", " ");
        Page.Title = id+" arama sonuçları";
        Page.MetaDescription = id + " araması için bulunan sonuçlar";
        Page.MetaKeywords = id + " oyunu oyna,"+id+" indirmeden oyna,"+id+" incelemesi,"+id+" facebooktan oyna,"+id+" oyunu resimleri";

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

                MySqlCommand o1 = new MySqlCommand("select id,adi,resim from oyunlar where onay='1' and etiket like '%" + sorgu + "%' or adi like '%" + sorgu + "%' or etiketisapi like '%" + fonk.sqlkoruma(Request.QueryString["id"]) + "%' order by id desc limit 20;", baglanti);
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
  

    }
}