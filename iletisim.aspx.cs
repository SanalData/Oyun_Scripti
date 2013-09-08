using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Data;


public partial class iletisim : System.Web.UI.Page
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    fonksiyonlar fonk = new fonksiyonlar();
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "İletişim | Oyunde ";
        baglanti = new MySqlConnection(bag);
        baglanti.Open();

        //kategoriler
        MySqlCommand o11 = new MySqlCommand("select * from kategoriler", baglanti);
        MySqlDataAdapter oa11 = new MySqlDataAdapter(o11);
        DataTable ot11 = new DataTable();
        oa11.Fill(ot11);
        kategoriler.DataSource = ot11;
        kategoriler.DataBind();
        ot11.Clear();

        baglanti.Close();
        baglanti.Dispose();
    }
    protected void iletiismgonder_Click(object sender, EventArgs e)
    {
      //  fonk.mailgonder("admin@sanaldata.com", "Oyunde İletişim Sayfasından mesaj oluşturulmuştur<br>Gönderen Ad soyad:" + ad.Text + "<br>Gönderen Maili:" + mail.Text + "<br>Mesaj :" + mesaj.Text + "", "Oyunde İletişim Sayfası", "tmm");
        durum.Text = "Mesajınız gönderilmiştir.En kısa sürede geri dönüş yapılacaktır.<br>";
    }
}