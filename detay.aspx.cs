using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class detay : System.Web.UI.Page
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    fonksiyonlar fonk = new fonksiyonlar();
    string isapi, et, oresim;
    string[] etiket;
    Int32 i = 0, i2 = 0, hitler;
    Int32 toplamoyun = 0;
    protected void Page_Load(object sender, EventArgs e)
    {


        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                baglanti.Open();
                isapi = fonk.sqlkoruma(Request.QueryString["id"]);
                //kayıtlı yorumlar

                MySqlCommand a1 = new MySqlCommand("select * from yorumlar where kid='" + @isapi + "' and onay='1' order by id desc;", baglanti);
                MySqlDataAdapter a2 = new MySqlDataAdapter(a1);
                DataTable a3 = new DataTable();
                a2.Fill(a3);

                kayitliyorumlar.DataSource = a3;
                kayitliyorumlar.DataBind();

                a2.Dispose();
                a3.Clear();


                //benzer oyunlar tabı

                MySqlCommand d = new MySqlCommand("select * from oyunlar where onay='1'  order by rand() limit 12", baglanti);
                MySqlDataAdapter r = new MySqlDataAdapter(d);
                DataTable t = new DataTable();
                r.Fill(t);
                benzeroyunlar.DataSource = t;
                benzeroyunlar.DataBind();
                r.Dispose();




                MySqlCommand oyunsql = new MySqlCommand("select * from oyunlar where onay='1' and isapi='" + @isapi + "' limit 1;", baglanti);
                MySqlDataReader a = oyunsql.ExecuteReader();
                while (a.Read())
                {

                    //icerikleri yerleştir
                    Session["oyunad"] = a["adi"].ToString();
                    Page.Title = a["adi"].ToString() + " oyunu oyna";
                    baslikh1.Text = a["adi"].ToString() + " oyunu oyna";
                    oyunaciklama.Text = a["tanitim"].ToString().Replace("<p>", "").Replace("</p>", "");
                    Page.MetaDescription = fonk.htmlencode(a["tanitim"].ToString());
                    Page.MetaKeywords = a["etiket"].ToString();
                    oad.Text = a["adi"].ToString();
                    oyn1.Text = a["adi"].ToString();
                    kat.Text = "<a href='http://www.oyunde.com/oyun_oynak/" + a["kategori"].ToString() + "' title='" + a["kategori"].ToString() + " kategorisindeki oyunları oyna'>" + a["kategori"].ToString() + "</a>";
                    oyunresmi.ImageUrl = "http://www.oyunde.com/uploads/images/" + a["resim"].ToString();
                    oyunresmi.AlternateText = a["adi"].ToString() + " oyunu oyna";
                    hit.Text = a["adi"] + " adlı oyun " + a["hit"] + " defa oynandı   &nbsp;  <b>|</b>";
                    hitler = Convert.ToInt32(a["hit"]);
                    oresim = a["resim"].ToString();
                    //canonical link oluştur
                    HtmlLink canonicalTag = new HtmlLink();
                    canonicalTag.Href = "http://www.oyunde.com/oyun_oyna/" + fonk.seo(a["adi"].ToString());
                    canonicalTag.Attributes["rel"] = "canonical";
                    Page.Header.Controls.Add(canonicalTag);
                    //facebook begen kodu
                    begenkodu.Text = "<iframe src='https://www.facebook.com/plugins/like.php?href=http://www.oyunde.com/oyun_oyna/" + fonk.seo(a["adi"].ToString()) + "'  scrolling='no' class='facebegen' frameborder='0'> </iframe>";
                    //nasıl kontrol et

                    if (a["oynama"].ToString() == "klavye")
                    {
                        kontrolet.ImageUrl = "http://www.oyunde.com/images/klavye.gif";
                        kontrolet.AlternateText = "Oyun Oyna";
                    }
                    else
                    {
                        kontrolet.ImageUrl = "http://www.oyunde.com/images/mouse.gif";
                        kontrolet.AlternateText = "Oyun Oyna";
                    }
                    //etiket sistemi
                    etiketler.Text = "";
                    string etiket = a["etiket"].ToString();

                    string[] etiket11 = etiket.Split(',');

                    foreach (string arrStr in etiket11)
                    {
                        etiketler.Text = etiketler.Text + "<a href='http://www.oyunde.com/eoyun/" + fonk.seo(arrStr) + "' title='" + arrStr + "' >" + arrStr + "</a>,";
                    }


                    oyun.Text = " <object type='application/x-shockwave-flash' data='http://www.oyunde.com/uploads/flash/" + a["flash"].ToString() + "'   width='685' height='500'> <param name='wmode' value='http://www.oyunde.com/uploads/flash/" + a["flash"].ToString() + "' />  </object>";
                } a.Close();
                a.Dispose();
            }
            finally
            {
                baglanti.Close();
            }
        }

   
    }
    protected void baslat_Click(object sender, EventArgs e)
    {
        hitler = hitler + 1;
        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                baglanti.Open();
                MySqlCommand hitguncelle = new MySqlCommand("update oyunlar set hit='" + hitler + "' where isapi='" + isapi + "';", baglanti);
                hitguncelle.ExecuteNonQuery();
            }
            finally
            {
                baglanti.Close();
            }
        }
        oyun.Visible = true;
        oyunresmi.Visible = false;
        reklam468.Visible = false;
        listeekle.Visible = false;
        h11.Visible = false;
        h22.Visible = false;
        kontrolet.Visible = false;
        br1.Visible = false;
        br2.Visible = false;
        reklambaglanti.Visible = false;
        h3oynama.Visible = false;
        oyunaciklama.Visible = false;
        baslikh1.Visible = false;
        hit.Visible = false;
        baslat.Visible = false;
        
    }
    protected void listeekle_Click(object sender, EventArgs e)
    {
        detaydurum.Text = "<img src='http://www.oyunde.com/images/ok.png'> Oyun listene eklendi";
        try
        {
            toplamoyun = Convert.ToInt32(Request.Cookies["toplamoyun"].Value);

        }
        catch
        {
            Response.Cookies["toplamoyun"].Value = "0";
            toplamoyun = 0;
           

        }
        
        toplamoyun++;
        Response.Cookies["toplamoyun"].Value = toplamoyun.ToString();
        Response.Cookies["toplamoyun"].Expires = DateTime.Now.AddDays(10);
        Response.Cookies["oyunadi" + toplamoyun.ToString()].Value = isapi.ToString();
        Response.Cookies["oyunadi"].Expires = DateTime.Now.AddDays(10);
        Response.Cookies["oyunresmi" + toplamoyun.ToString()].Value = oresim;
        Response.Cookies["oyunresmi"].Expires = DateTime.Now.AddDays(10);
        //Response.Redirect("http://www.oyunde.com/oyun_oyna/"+isapi.ToString()); 

    }
    protected void yorumgonder_Click(object sender, EventArgs e)
    {
        try
        {
            using (baglanti = new MySqlConnection(bag))
            {
                try
                {
                    baglanti.Open();
                    durum.Text = "<font color='green' style='font-weight:normal;'>Yorumunuz kayıt edildi</font>";
                    MySqlCommand s = new MySqlCommand("insert into yorumlar(ad,mail,yorum,kid) values('" + ad.Text.Replace("'", "") + "','" + email.Text.Replace("'", "") + "','" + yorum.Text.Replace("'", "") + "','" + Request.QueryString["id"] + "');", baglanti);
                    s.ExecuteNonQuery();


                }
                finally
                {
                    baglanti.Close();
                }
            }
       

        }
        catch
        {
            durum.Text = "<font color='red' style='font-weight:normal;'>Yorumunuz kayıt edilemedi</font>";
        }
    }

}