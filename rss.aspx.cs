using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Text; 
using System.Xml;
using MySql.Data.MySqlClient;


public partial class rss : System.Web.UI.Page
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        fonksiyonlar fonk = new fonksiyonlar();
        baglanti = new MySqlConnection(bag);
        baglanti.Open();
        Response.Clear();
        Response.ContentType = "text/xml";
        XmlTextWriter objX = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
        objX.WriteStartDocument();
        objX.WriteStartElement("rss");
        objX.WriteAttributeString("version", "2.0");
        objX.WriteStartElement("channel");
        objX.WriteElementString("title", "Oyun De | Ücretsiz Flash Oyun Oyna | En Hit Oyunları Oyna");
        objX.WriteElementString("link", "http://www.oyunde.com");
        objX.WriteElementString("description", "Oyun De | Ücretsiz Flash Oyun Oyna | En Hit Oyunları Oyna");
        MySqlCommand a = new MySqlCommand("select isapi,tanitim,adi,tarih from oyunlar where onay='1'  order by id desc limit 20", baglanti);
        MySqlDataReader b = a.ExecuteReader();
        while (b.Read())
        {
            objX.WriteStartElement("item");
            objX.WriteElementString("title", b["adi"].ToString());
            objX.WriteElementString("description", fonk.htmlencode(b["tanitim"].ToString()));
            objX.WriteElementString("link", "http://www.oyunde.com/oyun_oyna/" + b["isapi"].ToString());
            objX.WriteElementString("pubDate", b["tarih"].ToString());
            objX.WriteEndElement();
            
        }
        b.Close();
        b.Dispose();

        baglanti.Close();
        baglanti.Dispose();


        objX.WriteEndElement();
        objX.WriteEndElement();
        objX.WriteEndDocument();
        objX.Flush();
        objX.Close();
        Response.End();

    }
}