<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/tasarim.master" AutoEventWireup="true" CodeFile="detay.aspx.cs" Inherits="detay" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script runat="server">

    Int32 a = 0;
    Random rnd = new Random();
    string d;
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
         <div class="hreview"><div class="hreview-aggregate"><span class="item"><span class="fn">Oyun Oyna</span></span><span class="rating"><span class="average">10</span> von <span class="best">10</span></span>  <span class="votes"><%d= rnd.Next(30, 80).ToString(); %><% Response.Write(d); %></span> Oy <span class="count">5</span> Kritik</div>
    <div class="urlharita" ><img alt="Oyun Oyna" border="0" src="http://www.oyunde.com/images/home.png"  />&nbsp;<a href="http://www.oyunde.com" title="Ücretsiz Oyunlar" >OyunDe</a> › <asp:Label ID="kat" runat="server"></asp:Label> › <asp:Label ID="oad" runat="server"></asp:Label> |  <asp:Label ID="begenkodu" runat="server"></asp:Label>     <asp:Label CssClass="detaydurum" ID="detaydurum" runat="server"></asp:Label> </div>
   
    
     <div class="icerikkismi" >
       
        <asp:Image runat="server" ID="oyunresmi" CssClass="oyunresmi" Height="200px" Width="200px" />
        <div class="reklam468" id="reklam468" runat="server"><script type="text/javascript"><!--
                                                                 google_ad_client = "ca-pub-0017252754083147";
                                                                 /* Oyunde 468 &#42; 60 yeniiiiii */
                                                                 google_ad_slot = "5102290491";
                                                                 google_ad_width = 468;
                                                                 google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
       <h1 runat="server" id="h11"> <asp:Label ID="baslikh1" runat="server"></asp:Label></h1>
        <h2 runat="server" id="h22"><asp:Label ID="oyunaciklama" runat="server"></asp:Label></h2>
             <asp:Label ID="hit" runat="server"></asp:Label><asp:Button  ID="listeekle" runat="server" Text="Oyun listeleme ekle" OnClick="listeekle_Click" CssClass="transparanbutton"></asp:Button>
       <div runat="server" id="reklambaglanti">
<script type="text/javascript"><!--
    google_ad_client = "ca-pub-0017252754083147";
    /* Oyunde 468 &#42; 60 yeniiiiii */ 
    google_ad_slot = "5102290491";
    google_ad_width = 468;
    google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
       </div>
          <br  runat="server" id="br1"/>
        <br runat="server" id="br2" />
         <a name="klavye"></a>
       <h3 id="h3oynama" runat="server">&nbsp; <asp:Label ID="oyn1" runat="server"></asp:Label> Oynanma Şekli</h3>
  <asp:Image runat="server" CssClass="kontrolet" ID="kontrolet" />
       
        <asp:Button ID="baslat"  CssClass="baslat" runat="server" Text=""  OnClick="baslat_Click" />
            
   <asp:Label ID="oyun" runat="server" Visible="false"></asp:Label>
      
    
  
         <br class="clear" />
        
        <div class="yorumbar"  align="left">Yorumlar</div>
     <div class="yorumlar22">
        
         <asp:Repeater ID="kayitliyorumlar" runat="server">
             <ItemTemplate><%a++; %><img class="oyunoynaavatar" src="http://www.oyunde.com/images/oyunoynaavatar.png" title="Oyun Oyna Avatar" alt="Oyun Oyna Avatar" /><div class="yorumad"><div><%#Eval("ad") %></div><div><%#Eval("tarih") %></div></div><%#Eval("Yorum") %><br class="clear" /></ItemTemplate>
         </asp:Repeater>
         <%if (a == 0) { Response.Write(Session["oyunad"] + " oyunu için herhangi bir yorum bulunmamaktadır." + Session["oyunad"] + " oyununa ilk yorumu yan taraftan yapabilirsiniz."); } %>
     </div>
        <asp:UpdatePanel runat="server" ID="yorumyaz">
            <ContentTemplate>
                 <div class="yorumgiris22"> Ad soyad<br /><asp:TextBox ID="ad" runat="server"></asp:TextBox><br />Email<br /><asp:TextBox ID="email" runat="server"></asp:TextBox><br />Mesajınız<br /><asp:TextBox ID="yorum" runat="server" Rows="8"  Width="300" TextMode="MultiLine"></asp:TextBox><br /><asp:Button ID="yorumgonder" runat="server" Text="Gönder" OnClick="yorumgonder_Click" /><br /><asp:Label ID="durum" runat="server"></asp:Label></div>
            </ContentTemplate>
        </asp:UpdatePanel>
         <asp:UpdateProgress ID="yorumbekleyin" runat="server"><ProgressTemplate>Bekleyiniz.</ProgressTemplate></asp:UpdateProgress>
    <div class="solpaylas">

       <fb:like href="http://www.oyunde.com/oyun_oyna/<%= Request.QueryString["id"]%>" send="false" width="50" layout="box_count" show_faces="false" ></fb:like>
  <div style="height:10px;"></div>
 <iframe allowtransparency="true" frameborder="0" scrolling="no" src="http://platform.twitter.com/widgets/tweet_button.1340179658.html#_=1342604056514&amp;count=vertical&amp;id=twitter-widget-0&amp;lang=tr&amp;original_referer=http://www.oyunde.com/oyun_oyna/<%= Request.QueryString["id"]%>&amp;size=m&amp;text=Oyunde&amp;url=http://www.oyunde.com/oyun_oyna/<%= Request.QueryString["id"]%>" class="twitter-share-button twitter-count-vertical" style="width: 55px; height: 62px; " title="Twitter Tweet Button"></iframe>
 <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
 
 <div style="height:10px;"></div>
 <!-- Bu etiketi +1 düğmesinin görüntülenmesini istediğiniz yere yerleştirin -->
<g:plusone size="tall"></g:plusone>

<!-- Bu görüntüleme çağrısını uygun olan yere yerleştirin -->
<script type="text/javascript">
    window.___gcfg = { lang: 'tr' };

    (function () {
        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
        po.src = 'https://apis.google.com/js/plusone.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
    })();
</script>
    </div>
         <br class="clear" />

 </div>
    <%/* reklam kutu */ %>
    <div class="benzeroyunlar">

<script type="text/javascript"><!--
    google_ad_client = "ca-pub-0017252754083147";
    /* Oyunde de yeniiii 300 &#42;250 */
    google_ad_slot = "2679482577";
    google_ad_width = 300;
    google_ad_height = 250;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>

    </div>
     <%/*paylaş kutusu */ %> 
    <div class="oyunoynadetaypaylas"><center><img src="http://www.oyunde.com/images/oyunoynapaylas.png" title="Oyun Oyna Paylaş" alt="Oyun Oyna Paylaş" /></center></div>
       <%/* benzer oyunlar kutu */ %> 
    <div class="reklam300">
      </div>
       <%/* benzer oyunlar kutu */ %> 
    <div class="reklam300">
        <asp:UpdatePanel ID="altkutu" runat="server"><ContentTemplate>
         <asp:ImageButton ID="enyenioyunlarbtn" runat="server" ToolTip="En Yeni Oyunları Göster" ImageUrl="~/images/enyenilerbtn.png" />
      <asp:ImageButton ID="rastgeleoyunlarbtn" runat="server" ToolTip="Rastgele Oyunları Göster" ImageUrl="~/images/rastgelebtn.png" />
           <asp:Repeater ID="benzeroyunlar" runat="server">

            <ItemTemplate><a href="http://www.oyunde.com/oyun_oyna/<%#Eval("isapi")%>" title="<%#Eval("adi")%>"><img border="0" class="benzerkutu" src="http://www.oyunde.com/uploads/images/<%#Eval("resim")%>" title="<%#Eval("adi")%>" alt="<%#Eval("adi")%>" /></a></ItemTemplate>
        </asp:Repeater>
        </ContentTemplate></asp:UpdatePanel>
    </div><br class="clear" />
  
    <div class="etiketler">Etiket : <asp:Label ID="etiketler" CssClass="clear" runat="server"></asp:Label></div>
  
</asp:Content>

