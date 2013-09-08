<%@ Page Title="" Language="C#" MasterPageFile="~/tasarim.master" AutoEventWireup="true" CodeFile="iletisim.aspx.cs" Inherits="iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <% fonksiyonlar fonk = new fonksiyonlar(); %>
     <div class="kategoriler">
<asp:Repeater ID="kategoriler" runat="server">

    <ItemTemplate><div class="ksecenekler"><a href="http://www.oyunde.com/oyun_oynak/<%#Eval("isapi") %>" title="<%#Eval("kad") %> oyunları oyna"><%#Eval("kad") %></a></div></ItemTemplate>
</asp:Repeater>
     </div>
      <div class="oyunlardefault"><br />Her türlü görüş , düşünce ve oyun isteklerinizi burdan bizlere bildirebilirsiniz.<br /><br /><br />
      <asp:Label ID="durum" runat="server"></asp:Label>
            <asp:Label ID="a11" runat="server" Text="<b>Ad soyad</b>"></asp:Label><br /><asp:TextBox ID="ad" CssClass="textbox1" runat="server"></asp:TextBox><br />
           <asp:Label ID="a2" runat="server" Text="<b>Mail</b>"></asp:Label><br /><asp:TextBox ID="mail" CssClass="textbox1" runat="server"></asp:TextBox><br />
           <asp:Label ID="a3" runat="server" Text="<b>Mesajınız</b>"></asp:Label><br /><asp:TextBox ID="mesaj" CssClass="textbox1" Height="250" Width="500" TextMode="MultiLine" runat="server"></asp:TextBox>
       
          <br />  <asp:Button ID="iletiismgonder" runat="server" OnClick="iletiismgonder_Click" Text="Gönder" />      
               <br class="clear" />
    </div>
</asp:Content>

