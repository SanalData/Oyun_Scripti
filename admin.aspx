<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetici Paneli</title>
    <link rel="stylesheet" type="text/css" href="css/tasarim.css" />
    <style type="text/css">
        .auto-style1 {
            width: 327px;
        }
        .auto-style2 {
            width: 60px;
            height: 34px;
        }
        .auto-style3 {
            width: 1px;
            height: 34px;
        }
        .auto-style4 {
            width: 327px;
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    

      <asp:Panel ID="panel" runat="server" Visible="false">
            <h1>Yönetici Paneline Hoşgeldiniz</h1>
        <hr size="1" /><center>
        <asp:Button ID="yenioyunbutton" runat="server" Text="Yeni oyun kayıt et" OnClick="yenioyunpanel_Click" />
          | <asp:Button ID="botlarpanel" runat="server" Text="Yeni haber oluştur" OnClick="botlarpanel_Click" />| <asp:Button ID="oyunlarlistele" OnClick="oyunlarlistele_Click" runat="server" Text="Oyunlar" />
       </center>  <hr size="1" />
    <div>
        <br />
   
       
        <center>
   <asp:Repeater ID="oyunlarlistesi" OnItemCommand="oyunlarlistesi_ItemCommand" runat="server" Visible="false">
    <HeaderTemplate><div style=" width: 950px; background-color: white; font-family: Verdana; font-size: 11px; color:#000;" align="left"><h3>Kayıtlı Oyunlar</h3><table style="width: 98%;"><tr><td><b>Oyun Adı</b></td><td><b>Yayın Tarihi</b></td><td><b>Hit</b></td><td><b>Durum</b></td><td><b>İşlem</b></td></tr></HeaderTemplate>
          <ItemTemplate><tr style=""><td><%#Eval("adi") %></td><td><%#Eval("ytarih") %></td><td><%#Eval("hit") %></td><td><%#Eval("onay") %></td><td><asp:ImageButton ID="uduzenle" CommandName="duzenle" runat="server" CommandArgument='<%#Eval("id") %>'  ToolTip="Düzenle" Height="16" Width="16" ImageUrl="~/images/edit.png" />&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="osil" runat="server" CommandName="sil" CommandArgument='<%#Eval("id") %>'  ImageUrl="~/images/delete.png"  ToolTip="Sil" /></td></tr></ItemTemplate>
       <FooterTemplate></table></div></FooterTemplate>
   </asp:Repeater>


            <!--haberler-->
            <table id="botlar" runat="server" visible="false"  style=" width: 950px; background-color: white;">
            <tr><td>&nbsp;</td></tr>
            <tr><td colspan="3"><asp:Label ID="status" runat="server"></asp:Label></td></tr>
                <tr><td>Haber başlığı</td><td>:</td><td><asp:TextBox ID="baslik"  Height="24px" Width="441px" runat="server"></asp:TextBox></td> </tr>
                <tr><td>Haber içeriği</td><td>:</td><td><CKEditor:CKEditorControl ID="icerik" runat="server"></CKEditor:CKEditorControl></td></tr>
                <tr><td align="center" colspan="3"><asp:Button ID="buton" runat="server" Text="Haberi oluştur" OnClick="haberkayit" /> </td></tr>
            </table>
            <!--yeni oyun paneli-->
        <table id="yenioyunpanel"  runat="server" visible="false" style=" width: 950px; background-color: white;">
            <tr ><td align="left" class="auto-style2">&nbsp;</td><td class="auto-style3">&nbsp;</td>
                <td class="auto-style4" align="left"><asp:Label ID="oyundurum" runat="server"></asp:Label></td></tr>
            <tr ><td align="left" class="auto-style2">Oyun Adı</td><td class="auto-style3">:</td>
                <td class="auto-style4" align="left"><asp:TextBox ID="ad" runat="server" 
                        Height="24px" Width="441px"></asp:TextBox></td></tr>
            <tr><td align="left">Oyun Resmi</td><td>:</td><td class="auto-style1" align="left"> <asp:FileUpload ID="resim" runat="server" /></td></tr>
            <tr><td align="left">Oyun Kategorisi</td><td>:</td><td class="auto-style1" align="left"><asp:DropDownList Height="24px" Width="441px" ID="kategori" runat="server"> </asp:DropDownList></td></tr>
            <tr><td align="left">Oyun Etiketleri</td><td>:</td><td class="auto-style1" align="left"><asp:TextBox Height="24px" Width="441px"  ID="etiket" runat="server"></asp:TextBox> | Örn: etiket1,etiket2,etiket3</td></tr>
       <tr><td align="left">Oynanma Şekli</td><td>:</td><td><asp:DropDownList Height="24px" Width="441px" ID="oynama" runat="server">
          <asp:ListItem Text="Klavye" Value="klavye"></asp:ListItem>
            <asp:ListItem Text="Mouse" Value="mouse"></asp:ListItem>
            </asp:DropDownList></td></tr>
                 <tr><td align="left">Oyun Dosyası</td><td>:</td><td class="auto-style1" align="left"><asp:FileUpload ID="flash" runat="server" /></td></tr>
            <tr><td align="left">Oyun Tanıtımı</td><td>:</td><td >
               <asp:TextBox ID="tanitim" TextMode="MultiLine" runat="server" Height="203px" 
                    Width="534px"></asp:TextBox></td></tr>

            <tr><td colspan="3"><center> <asp:Button ID="oyunkayit"  runat="server" Text="Oyunu kayıt et"  OnClick="oyunkayit_Click"></asp:Button></center></td></tr>

        </table>
        </center>

    </div>

      </asp:Panel>
        <asp:Panel ID="giris" runat="server">
            <center><br /><br />
                <img src="http://www.oyunde.com/images/logo.png" />
            <table style="width: 200px;">
                <tr><td>Kad</td><td>:</td><td><asp:TextBox ID="kad"  runat="server"></asp:TextBox></td></tr>
                 <tr><td>Şifre</td><td>:</td><td><asp:TextBox TextMode="Password" ID="sifre"  runat="server"></asp:TextBox></td></tr>
                 <tr><td colspan="3"><asp:Button ID="girisler" OnClick="girisler_Click" runat="server" Text="Giriş Yap" /></td></tr>

            </table>
                </center>
        </asp:Panel>
    </form>
</body>
</html>
