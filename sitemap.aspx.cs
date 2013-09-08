using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Text;
using System.Xml;


public partial class sitemap : System.Web.UI.Page
{
    MySqlConnection baglanti;
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        baglanti = new MySqlConnection(bag);

        baglanti.Open();
             Response.Clear(); //sitemap xml formatlı olduğundan sayfamızın içeriğini temizliyoruz.
        Response.ContentType = "text/xml";

        XmlTextWriter xr = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        xr.WriteStartDocument();
        xr.WriteStartElement("urlset"); // sitemap standartı gereği urlset düğümü oluşturuyoruz.

        // aşağıdaki kodlar ile sitemap`in hangi standartlara uygun olduğunuz belirliyoruz.
        xr.WriteAttributeString("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9");
        xr.WriteAttributeString("xmlns:xsi", "http://www.w3.org/2001/XMLSchema-instance");
        xr.WriteAttributeString("xsi:schemaLocation","http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/siteindex.xsd");

        // Aşağıdaki 6 satır ile de herhangi bir sayfayı sitemap`e ekliyoruz.
        xr.WriteStartElement("url"); // sitemap standartına göre url düğümü oluşturuluyor.
        xr.WriteElementString("loc", "http://www.oyunde.com/");
        xr.WriteElementString("lastmod", DateTime.Now.ToString("yyyy-MM-dd")); //son değiştirme tarihi
        xr.WriteElementString("changefreq", "always"); // sayfa içeriğini değişme frekansı
        xr.WriteElementString("priority", "0.1"); // sayfanın değişme frekansına göre öncelik sırası
        xr.WriteEndElement();

        // Aşağıda ise dinamik olarak yani veritabanındaki bilgilere göre sitemap`imizi hazırlıyoruz.
        MySqlCommand a = new MySqlCommand("select isapi from oyunlar where onay='1'  order by id desc", baglanti);
        MySqlDataReader oku2=a.ExecuteReader();
        while (oku2.Read())
        {
            xr.WriteStartElement("url");
            xr.WriteElementString("loc","http://www.oyunde.com/oyun_oyna/"+oku2["isapi"].ToString());
                      xr.WriteElementString("priority", "0.1");
                      xr.WriteElementString("changefreq", "always");
            xr.WriteEndElement();
        }
        baglanti.Close();

        xr.WriteEndDocument();
        xr.Flush();
        xr.Close();
        Response.End();








    }
}