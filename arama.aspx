<%@ Page Title="" Debug="true" Language="C#" MasterPageFile="~/tasarim.master" AutoEventWireup="true" CodeFile="arama.aspx.cs" Inherits="_Default" %>
<script runat="server">
    fonksiyonlar fonk = new fonksiyonlar();
    Int32 top = 0;
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
  
    <asp:Repeater ID="oyunlar1" runat="server">
        <ItemTemplate><%top = top + 1; %><div class="oyunkutu" align="center"><a href="http://www.oyunde.com/oyun_oyna/<%#fonk.seo(Eval("adi").ToString()) %>" title="<%#Eval("adi")%> oyunu oyna"><img border="0" src="http://www.oyunde.com/uploads/images/<%#Eval("resim")%>" height="150" width="150" title="<%#Eval("adi") %> oyunu oyna" alt="<%#Eval("adi") %> oyunu oyna" /></a><br /><%#Eval("adi") %></div></ItemTemplate>
    </asp:Repeater>
    
 <br class="clear" />
        </div>
</asp:Content>

