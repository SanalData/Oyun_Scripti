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
    fonksiyonlar fonk = new fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Title = "Oyun, Oyun Oyna, Oyunlar, Kral Oyun, En Yeni Oyunlar, Cocuk oyunlari,Oyun, Oyun Oyna, Oyunlar, Kral Oyun, En Yeni Oyunlar, Cocuk oyunlari,Oyun, Oyun Oyna, Oyunlar, Kral Oyun Oyna, En Yeni Oyun Oyna, Cocuk oyunlari";
        Page.MetaDescription = "Sitemizden kaliteli yüksek cözünürlükte oyunlar oynayabilirsiniz oyun oynamak icin sitemizi mutlaka ziyaret etmelisiniz.Oyunde üzerinde Oyun Oynayarak stress atabilirsiniz çünkü oyun oynamak sizi rahatlatýr.";
        Page.MetaKeywords = "Oyun, Oyunlar, Kral Oyun, Oyun Oyna, Yeni Oyunlar, Araba Oyunlarý, Çocuk Oyunlarý, Çizgi Film Oyunlarý, Dövüþ Oyunlari,Full Oyun Oyna";
        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                baglanti.Open();

                //kategoriler
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

                //en yeni rastgele oyunlar
                MySqlCommand o = new MySqlCommand("select * from oyunlar where onay='1' order by rand() limit 40;", baglanti);
                MySqlDataAdapter ea = new MySqlDataAdapter(o);
                DataTable aa = new DataTable();
                ea.Fill(aa);
                oyunlar1.DataSource = aa;
                oyunlar1.DataBind();
                oyunlar1.Dispose();

                //hit oyunlar
                o = new MySqlCommand("select * from oyunlar where onay='1'  order by hit desc limit 6;", baglanti);
                ea = new MySqlDataAdapter(o);
                aa = new DataTable();
                ea.Fill(aa);
                hitoyunlar.DataSource = aa;
                hitoyunlar.DataBind();
                hitoyunlar.Dispose();
              
                //hitler


                o = new MySqlCommand("select * from yorumlar where onay='1';", baglanti);
                ea = new MySqlDataAdapter(o);
                aa = new DataTable();
                ea.Fill(aa);
                sonyorumlar.DataSource = aa;
                sonyorumlar.DataBind();
                sonyorumlar.Dispose();


            }
            catch (Exception exp)
            {

                          }
            finally
            {
                baglanti.Close();
            }
        }
    }
}