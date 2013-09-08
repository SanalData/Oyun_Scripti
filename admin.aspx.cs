using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using HtmlAgilityPack;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Net;
using System.Text;
using System.IO;
using System.Data;
public partial class admin : System.Web.UI.Page
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    fonksiyonlar fonk = new fonksiyonlar();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        baglanti = new MySqlConnection(bag);


        if (Request.QueryString["islem"] == "isapi")
        {
            using (baglanti = new MySqlConnection(bag))
            {
                baglanti.Open();
                MySqlConnection baglanti2 = new MySqlConnection(bag);
                baglanti2.Open();
                MySqlCommand a = new MySqlCommand("select * from oyunlar", baglanti);
                MySqlDataReader t = a.ExecuteReader();
                while (t.Read())
                {

                    MySqlCommand d = new MySqlCommand("update oyunlar set etiketisapi='" + fonk.seo(t["etiket"].ToString()) + "' where id='" + t["id"].ToString() + "';", baglanti2);
                    d.ExecuteNonQuery();

                } t.Close(); t.Dispose();
                baglanti2.Close();
                baglanti.Close();
            }

            Response.Write("İşlem tamamdı");
        }

    }
    protected void oyunkayit_Click(object sender, EventArgs e)
    {
        baglanti.Open();
      
        try
        {
            resim.SaveAs(Server.MapPath("uploads/images/") + fonk.seo(ad.Text) + ".jpg");
            flash.SaveAs(Server.MapPath("uploads/flash/") + fonk.seo(ad.Text) + ".swf");
            MySqlCommand oyunkayit = new MySqlCommand("insert into oyunlar(adi,kategori,tanitim,resim,flash,etiket,isapi,tarih,oynama,etiketisapi) values('" + @ad.Text.Replace("'", "") + "','" + kategori.SelectedValue + "','" + tanitim.Text.Replace("'", "") + "','" + fonk.seo(ad.Text) + ".jpg','" + fonk.seo(ad.Text) + ".swf','" + etiket.Text.Replace("'", "") + "','" + fonk.seo(ad.Text) + "','" + DateTime.Now + "','"+oynama.SelectedValue+"','"+@fonk.seo(etiket.Text)+"');", baglanti);
            oyunkayit.ExecuteNonQuery();
            oyundurum.Text = "Oyun Kayıt Edilmiştir.";

            //bloglara mail göndermeye başla
            fonk.mailgonder("admin1756.4546@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
            fonk.mailgonder("admin1756.4547@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
            fonk.mailgonder("admin1756.4548@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
            fonk.mailgonder("admin1756.4549@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
            fonk.mailgonder("admin1756.4550@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
            fonk.mailgonder("admin1756.4551@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
            fonk.mailgonder("admin1756.4552@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
            fonk.mailgonder("admin1756.4553@blogger.com", "http://www.oyunde.com/oyun_oyna/" + fonk.seo(ad.Text.Replace("'", "")), "", "100");
     
          
        }
        catch (Exception exp)
        {
            oyundurum.Text = "Oyun Kayıt Edilemedi: Hata Kodu = "+exp.Message;
        }
        baglanti.Close();
        baglanti.Dispose();
    }
    protected void yenioyunpanel_Click(object sender, EventArgs e)
    {
        yenioyunpanel.Visible = true;
        botlar.Visible = false;
        baglanti.Open();
       
        MySqlCommand a = new MySqlCommand("select * from kategoriler order by id desc;", baglanti);
        MySqlDataReader r = a.ExecuteReader();
        while (r.Read())
        {
            ListItem t = new ListItem();
            t.Text = r["kad"].ToString();
            t.Value = r["isapi"].ToString();
            kategori.Items.Add(t);

        } r.Close();
        r.Dispose();

        baglanti.Close();
        baglanti.Dispose();
    }
    protected void girisler_Click(object sender, EventArgs e)
    {
        if (kad.Text == "admin" || sifre.Text == "admin8787")
        {
            oyunlarlistesi.Visible = false;
            panel.Visible = true;
            giris.Visible = false;

        }
    }
    protected void botlarpanel_Click(object sender, EventArgs e)
    {
        oyunlarlistesi.Visible = false;
        botlar.Visible = true;
        yenioyunpanel.Visible = false;
    }
    protected void haberkayit(object sender, EventArgs e)
    {

        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                baglanti.Open();
                MySqlCommand kayit = new MySqlCommand("insert into konular(baslik,icerik,isapi) values('" + @fonk.sqlkoruma(baslik.Text) + "','" + @icerik.Text + "','" + @fonk.seo(baslik.Text) + "');", baglanti);
                kayit.ExecuteNonQuery();

                status.Text = "<font color=green>Haber kayıt edilmiştir.</font>";
            }
            catch (Exception exp)
            {

                status.Text = "<font color=red>Hata oluştu kayıt edilemedi.Hata kodu</font>"+exp.Message;
            }
            finally
            {
                baglanti.Close();

                

            }




        }


    }
    protected void listeleoyunlari_Click(object sender, EventArgs e)
    {
      
    }

    protected void oyunlarlistele_Click(object sender, EventArgs e)
    {

        botlar.Visible = false;
        yenioyunpanel.Visible = false;
        giris.Visible = false;
        oyunlarlistesi.Visible = true;
        using (baglanti = new MySqlConnection(bag))
        {
            baglanti.Open();

            MySqlDataAdapter t = new MySqlDataAdapter("select * from oyunlar order by id desc;",baglanti);
            DataTable tablo = new DataTable();

            t.Fill(tablo);
            oyunlarlistesi.DataSource = tablo;
            oyunlarlistesi.DataBind();
            oyunlarlistesi.Dispose();

            baglanti.Close();
        }
    }
    protected void oyunlarlistesi_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "sil")
        {
            using (baglanti = new MySqlConnection(bag))
            {
                baglanti.Open();

                MySqlCommand a = new MySqlCommand("delete from oyunlar where id='" + e.CommandArgument.ToString() + "';", baglanti);
                a.ExecuteNonQuery();

             

                MySqlDataAdapter t = new MySqlDataAdapter("select * from oyunlar order by id desc;", baglanti);
                DataTable tablo = new DataTable();

                t.Fill(tablo);
                oyunlarlistesi.DataSource = tablo;
                oyunlarlistesi.DataBind();
                oyunlarlistesi.Dispose();

                baglanti.Close();

            }
         
        }
        if (e.CommandName == "duzenle")
        {
            Response.Write("<script>window.open('adminoyunduzenle.aspx?id=" + e.CommandArgument.ToString() + "','','width=550,height=500');</script>");
        }
   
    }
}