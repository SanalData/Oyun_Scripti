<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminoyunduzenle.aspx.cs" Inherits="adminoyunduzenle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Oyun Düzenle</title>
    <link rel="stylesheet" type="text/css" href="css/tasarim.css" />
 
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ajax" runat="server"></asp:ScriptManager>
    <div>
    <h2>Oyun Düzenle</h2>
        <table style="width: 99%;">
            <tr><td>Oyun Adı</td><td>:</td><td><asp:TextBox ID="adi" runat="server"  Width="400"></asp:TextBox></td></tr>
            <tr><td>Etiket</td><td>:</td><td><asp:TextBox ID="etiket" runat="server"  Width="400"></asp:TextBox></td></tr>
            <tr><td>Oyun Açıklama</td><td>:</td><td><asp:TextBox TextMode="MultiLine" Height="160" Width="400" ID="aciklama" runat="server"></asp:TextBox></td></tr>
            <tr><td>Oyun Tarihi</td><td>:</td><td><asp:TextBox ID="tarih" runat="server"></asp:TextBox><asp:CalendarExtender ID="CalendarExtender1" TargetControlID="tarih"
                    runat="server"></asp:CalendarExtender>
            </td></tr>
            <tr><td>Oyun Resmi</td><td>:</td><td><asp:Image runat="server" ID="oresim" /></td></tr>
            <tr><td colspan="3"><center><asp:Button ID="guncelle" Text="Güncelle" OnClick="guncelle_Click"  runat="server"/></center></td></tr>
        </table>
    </div>
    </form>
</body>
</html>
