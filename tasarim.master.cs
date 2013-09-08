using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Web.Security;

public partial class tasarim : System.Web.UI.MasterPage
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti, baglanti2;
    Int32 toplamoyun = 0;
    string tarih;
    protected void Page_Load(object sender, EventArgs e)
    {

      
        //lisans kontrol başla
        Int32 hak = 0;

        if (Request.Url.Host.Replace("www.", "") == "oyunde.com")
        {
            hak = 1;
        }

        if (hak == 0)
        {
          Response.Redirect("http://www.sanaldata.com");
        }
     
        //lisans kontrol bitiş

        //tarih oyun kontrolü
        using(baglanti=new MySqlConnection(bag))
        {
            tarih = DateTime.Now.Month + "/" + DateTime.Now.Day + "/" + DateTime.Now.Year;
           
            baglanti.Open();
            using(baglanti2=new MySqlConnection(bag))
            {
                baglanti2.Open();
        MySqlCommand komut = new MySqlCommand("select id from oyunlar where ytarih='" + tarih + "';", baglanti);
        MySqlDataReader a = komut.ExecuteReader();
        while (a.Read())
        {
            MySqlCommand tr = new MySqlCommand("update oyunlar set onay='1' where id='" + a["id"].ToString() + "';", baglanti2);
            tr.ExecuteNonQuery();
           

        } a.Close(); a.Dispose();
        baglanti.Close();
        baglanti2.Close();
        baglanti2.Dispose();
        }


        }

        //tarih oyun kontrolü bitiş
        baglanti = new MySqlConnection(bag);
        try
        {
            toplamoyun = Convert.ToInt32(Request.Cookies["toplamoyun"].Value);
            tpo.Text = toplamoyun.ToString();
           
        }
        catch
        {
            tpo.Text = "0";

        }
        balonn.Text = " <object type='application/x-shockwave-flash' data='http://www.oyunde.com/flash/facebookbalon.swf'   width='129' height='231'><param name='wmode' value='transparent' /> <param name='wmode' value='http://www.oyunde.com/flash/facebookbalon.swf' />  </object>";

    }
    protected void aramayapp(object sender, EventArgs e)
    {
        if (aramakutu.Text == "" || aramakutu.Text=="Lütfen aranılan kelimeyi yazınız")
        {
            aramakutu.Text = "Lütfen aranılan kelimeyi yazınız";
        }
        else
        {
            Response.Redirect("http://www.oyunde.com/eoyun/" + aramakutu.Text);
        }
    }
}
