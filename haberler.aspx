<%@ Page Title="" Language="C#" MasterPageFile="~/tasarim.master" AutoEventWireup="true" CodeFile="haberler.aspx.cs" Inherits="haberler" %>
<script runat="server">
    fonksiyonlar fonk = new fonksiyonlar();
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
    <img src="images/sonhaberler.png" />
    <asp:Repeater ID="sonhaberler" runat="server">
    <ItemTemplate>
    <div class="oyunoynasonyorumlar" ><img  src="http://www.oyunde.com/images/bulletyatay.png" title="<%#Eval("baslik") %> oyun haberi" alt="<%#Eval("baslik") %> oyun haberi" /><a href="http://www.oyunde.com/oyun_oynah/<%# fonk.seo(Eval("baslik").ToString()) %>" title="<%#Eval("baslik") %> oyun haberi"><%#Eval("baslik") %></a></div>
    
    </ItemTemplate>
    </asp:Repeater>
    <!-- son haberler-->
     </div>
   <div class="oyunlardefault">
   <center>
   <table style="width:95%;"><tr><td align="left">
   <h1><asp:Label ID="baslik" runat="server"></asp:Label></h1><br />
   <h2><asp:Label ID="aciklama" runat="server"></asp:Label></h2><br />
   <h3><asp:Label ID="icerik" runat="server"></asp:Label></h3>
   </td></tr></table>
   </center>
          <br class="clear" />
    </div>

</asp:Content>

