<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="oyun_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    fonksiyonlar fonk = new fonksiyonlar();
    Int32 i = 0;
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oyunde | Facebook Uygulaması</title>
   
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div ><center>
 <table style="width: 100%;">
 <tr class="ust"><td  align="left"><img src="http://www.oyunde.com/images/logo.png" /></td></tr>
 <tr><td align="center"><asp:Repeater ID="oyunlar" runat="server">
     <ItemTemplate>
       
              <div class="oyunkutu"  align="center"><div class="yeni">Yeni</div><div class="kutuyazi">www.OyunDe.com</div><a href="http://www.oyunde.com/oyun_oyna/<%#fonk.seo(Eval("adi").ToString()) %>" title="<%#Eval("adi")%> oyunu oyna"><img border="0" src="http://www.oyunde.com/uploads/images/<%#Eval("resim")%>" height="150" width="146" title="<%#Eval("adi") %> oyunu oyna" alt="<%#Eval("adi") %> oyunu oyna" /></a><br /><%#Eval("adi") %><br /><div style="width:100%; margin-top: 2px;" align="left"><div class="oyunkutuhit"><div class="joysitk"><b><%#Eval("hit") %></b> kere oynandı</div></div></div></div>
    </ItemTemplate>
         </asp:Repeater></td></tr>

 </table>
        <asp:Panel ID="oyunpnl" runat="server" Visible="false">
            <center>Oyun</center>
        </asp:Panel>
   </center> </div>
    </form>
</body>
</html>
