using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.Configuration;
using Gapi.Language;

public partial class adminoyunduzenle : System.Web.UI.Page
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    string id;
   
    fonksiyonlar fonk = new fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            id = fonk.sqlkoruma(Request.QueryString["id"]);
            using (baglanti = new MySqlConnection(bag))
            {
                baglanti.Open();
                MySqlCommand ar = new MySqlCommand("select * from oyunlar where id='" + @id + "';", baglanti);
                MySqlDataReader a = ar.ExecuteReader();
                while (a.Read())
                {
                    adi.Text = a["adi"].ToString();
                    Session["b"] = fonk.seo(a["adi"].ToString());
                    aciklama.Text = a["tanitim"].ToString();
                    etiket.Text = a["etiket"].ToString();
                    tarih.Text = a["ytarih"].ToString();
                
                    oresim.ImageUrl = "http://www.oyunde.com/uploads/images/" + a["resim"].ToString();

                } a.Close();


                baglanti.Close();
            }
        }

    }

    protected void guncelle_Click(object sender, EventArgs e)
    { 
        id=fonk.sqlkoruma(Request.QueryString["id"]);
        using(baglanti=new MySqlConnection(bag))
        {
            baglanti.Open();

            MySqlCommand ta = new MySqlCommand("update oyunlar set adi='" + @adi.Text + "',tanitim='" + aciklama.Text + "',isapi='" + @fonk.seo(adi.Text) + "',etiket='" + etiket.Text + "',ytarih='"+tarih.Text+"' where id='" + id + "'", baglanti);
            ta.ExecuteNonQuery();
            Response.Write("<script>alert('Oyun Güncellendi');</script>");
            baglanti.Close();

        }

    }
}