<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/tasarim.master" AutoEventWireup="true" CodeFile="encokoynananoyunlar.aspx.cs" Inherits="_Default" %>
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
     </div>
      <div class="oyunlardefault">
          <br />
    <asp:Repeater ID="oyunlar1" runat="server">
        <ItemTemplate>            <div class="oyunkutu"  align="center"><div class="yeni">Yeni</div><div class="kutuyazi">www.OyunDe.com</div><a href="http://www.oyunde.com/oyun_oyna/<%#fonk.seo(Eval("adi").ToString()) %>" title="<%#Eval("adi")%> oyunu oyna"><img border="0" src="http://www.oyunde.com/uploads/images/<%#Eval("resim")%>" height="150" width="146" title="<%#Eval("adi") %> oyunu oyna" alt="<%#Eval("adi") %> oyunu oyna" /></a><br /><%#Eval("adi") %><br /><div style="width:100%; margin-top: 2px;" align="left"><div class="oyunkutuhit"><div class="joysitk"><b><%#Eval("hit") %></b> kere oynandı</div></div></div></div></ItemTemplate>
    </asp:Repeater>
          <br class="clear" />
    </div>

</asp:Content>

