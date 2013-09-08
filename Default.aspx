<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/tasarim.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<script runat="server">
    fonksiyonlar fonk = new fonksiyonlar();
    Int32 i = 0;
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="kategoriler">
<asp:Repeater ID="kategoriler" runat="server">

    <ItemTemplate><div class="ksecenekler"><a href="http://www.oyunde.com/oyun_oynak/<%#Eval("isapi") %>" title="<%#Eval("kad") %> oyunları oyna"><%#Eval("kad") %></a></div></ItemTemplate>
</asp:Repeater>
         <!--son yorumar-->
       <img src="http://www.oyunde.com/images/sonyorumlar.png" title="Oyun Oynadaki Son Yorumlar" alt="Oyun Oynadaki Son Yorumlar" />
     <asp:Repeater ID="sonyorumlar" runat="server">
         <ItemTemplate><div class="oyunoynasonyorumlar" ><img  src="http://www.oyunde.com/images/bulletyatay.png" title="Son oynanan oyunlarda  yorumlar" alt="Son oynanan oyunlarda  yorumlar" /><a href="http://www.oyunde.com/oyun_oyna/<%#Eval("kid") %>" title="Son oynanan oyunlarda  yorumlar"><%#Eval("yorum") %></a></div></ItemTemplate>
     </asp:Repeater>
            <!--son yorumar-->
            <!--son haberker-->
    <img alt="Oyun Oyna" src="images/sonhaberler.png" />
    <asp:Repeater ID="sonhaberler" runat="server">
    <ItemTemplate>
    <div class="oyunoynasonyorumlar" ><img  src="http://www.oyunde.com/images/bulletyatay.png" title="<%#Eval("baslik") %> oyun haberi" alt="<%#Eval("baslik") %> oyun haberi" /><a href="http://www.oyunde.com/oyun_oynah/<%# fonk.seo(Eval("baslik").ToString()) %>" title="<%#Eval("baslik") %> oyun haberi"><%#Eval("baslik") %></a></div>
    
    </ItemTemplate>
    </asp:Repeater>
    <!-- son haberler-->
         <!--günün oyunu başla-->
      <img alt="Oyun Oyna" src="images/sonhaberler.png" />
     Her gün sizler için bir tane günün oyunu ayarlıcaz böylece gününlük en yeni <h1>oyun oyna</h1>yarak zevkli anlar geçirebilirsiniz
         <!--günün oyunu bitiş-->
     </div>
  
      <div class="oyunlardefault">
          <br /><div class="flashoyun">




              
<!--ORTA BANNER BAŞLA--> 
 <div id="wrapper">
    
    

        <div class="slider-wrapper theme-default">
            <div class="ribbon"></div>
            <div id="slider" class="nivoSlider">
             <!--manşet sistemi başla-->
            
          
              <img  src="images/flash.jpg" alt="" height="266" width="580" />
              <img src="images/flash.jpg" alt="Ücretsiz" height="266" width="580" />
              <img src="images/flash.jpg" alt="En Yeni Oyunlar Oyna" height="266" width="580" />
              <img src="images/flash.jpg" alt="Kral" height="266" width="580" />
              <img src="images/flash.jpg" alt="Oyunlar Oyna" height="266" width="580" />

            
             <!--manset sistemi bitiş-->
            </div>

        </div>

    </div>

    <script type="text/javascript" src="/js/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script><!-- ORTA BANNER BİTİŞ-->




                </div><div class="hitoyun"><asp:Repeater ID="hitoyunlar" runat="server"><ItemTemplate><div class="hitoyunkutu"><a title="<%#Eval("adi") %>"  href="http://oyunde.com/oyun_oyna/<%#Eval("isapi") %>"><%#Eval("adi") %></a></div></ItemTemplate></asp:Repeater></div>
    <asp:Repeater ID="oyunlar1" runat="server">
       
        <ItemTemplate>
    
            <div class="oyunkutu"  align="center"><div class="yeni">Yeni</div><div class="kutuyazi">www.OyunDe.com</div><a href="oyun_oyna/<%#fonk.seo(Eval("adi").ToString()) %>" title="<%#Eval("adi")%>"><img border="0" src="http://www.oyunde.com/uploads/images/<%#Eval("resim")%>" height="150" width="146" title="<%#Eval("adi") %>" alt="<%#Eval("adi") %>" /></a><br /><%#Eval("adi") %><br /><div style="width:100%; margin-top: 2px;" align="left"><div class="oyunkutuhit"><div class="joysitk"><b><%#Eval("hit") %></b> kere oynandı</div></div></div></div>


        </ItemTemplate>
    </asp:Repeater>
          <br class="clear" />
    </div>
   
</asp:Content>

