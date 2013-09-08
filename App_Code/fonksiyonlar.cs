using System;
using System.Collections.Generic;
using System.Web.Mail;
using System.Drawing;
using System.Web;
using System.Drawing.Imaging;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Data;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for fonksiyonlar
/// </summary>
public class fonksiyonlar
{
    string bag = WebConfigurationManager.ConnectionStrings["dbbaglantisi"].ConnectionString;
    MySqlConnection baglanti;
    string tasarim;

    MySqlCommand komut;
    DataTable tablo;
    MySqlCommand sql; MySqlDataAdapter t;


    public string sqlsorgu(string sqlsorgu)
    {
        string sonuc;
        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                baglanti.Open();
                komut = new MySqlCommand(sqlsorgu, baglanti);
                komut.ExecuteNonQuery();
                sonuc = "tamamdir";
            }
            catch (Exception exp)
            {

                sonuc = exp.Message;
            }
            finally
            {
                baglanti.Close();
                komut.Dispose();
            }
        }
        return sonuc;
    }


    public DataTable adaptor(string komut)
    {
        using (baglanti = new MySqlConnection(bag))
        {
            try
            {
                sql = new MySqlCommand(komut, baglanti);
                t = new MySqlDataAdapter(sql);
                tablo = new DataTable();
                t.Fill(tablo);

            }
            catch (Exception exp)
            {


            }
            finally
            {

                sql.Dispose();
                t.Dispose();
                tablo.Dispose();
            }



        }

        return tablo;
    }



    public string htmlencode(string metin)
    {
        metin = Regex.Replace(metin, "<[^>]*>", string.Empty);
        metin = metin.Replace("<p>", "");
        metin = metin.Replace("</p>", "");
       
        return metin;
    }
    public Bitmap ResimCiz(Bitmap Resim, Bitmap CizilecekResim)
    {
        Graphics g = Graphics.FromImage(Resim);
    
        g.DrawImage((Image)CizilecekResim, new Point() { X = 15, Y = 14 });

        return Resim;
    }

    public string sqlkoruma(string metin)
    {
        if (metin != null)
        {
            metin = metin.Replace("=", "");
            metin = metin.Replace("insert", "");
            metin = metin.Replace("'", "");
        }
        return metin;


    }
    public string seo(string metin)
    {
        metin = metin.ToLower();
        metin = metin.Replace(" ", "-");
        metin = metin.Replace("'", "-");
        metin = metin.Replace("ş", "s");
        metin = metin.Replace("Ş", "s");
        metin = metin.Replace("İ", "i");
        metin = metin.Replace("ı", "i");
        metin = metin.Replace("Ç", "c");
        metin = metin.Replace("ç", "c");
        metin = metin.Replace("ğ", "g");
        metin = metin.Replace("Ğ", "g");
        metin = metin.Replace("ö", "o");
        metin = metin.Replace("ü", "u");
        metin = metin.Replace("/", "");
        metin = metin.Replace("\\", "");
        return metin;
    }


    public string mailgonder(string alicimail, string mailicerik, string mailbaslik, string durum)
    {



        System.Net.Mail.MailMessage Email = new System.Net.Mail.MailMessage();
        Email.From = new System.Net.Mail.MailAddress("MAİL ADRESİ");
        Email.To.Add(alicimail);
        Email.IsBodyHtml = true;
        Email.Subject = mailbaslik;
        Email.Body = mailicerik;
        System.Net.Mail.SmtpClient Client = new System.Net.Mail.SmtpClient();
        Client.Credentials = new System.Net.NetworkCredential("mail adrsi", "şifre");
        Client.Port = 587;
        Client.Host = "smtp.gmail.com";
        Client.EnableSsl = true;
        Client.Send(Email);


        return durum;
    }
    public string Left(string Original, int Count)
    {
        if (Original == null || Original == string.Empty || Original.Length <
        Count)
        {
            return Original;
        }
        else
        {
            return Original.Substring(0, Count);
        }
    }
}