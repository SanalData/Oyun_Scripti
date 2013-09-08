<%@ Page Language="C#" AutoEventWireup="true" CodeFile="oran.aspx.cs" Inherits="oran" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register src="~/FacebookShare.ascx" tagname="FacebookShare" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ajax" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="panle" runat="server"><ContentTemplate>
          <asp:SliderExtender  ID="slider"  TargetControlID="oranlar" runat="server"  Minimum="1" Maximum="100"></asp:SliderExtender>

        <asp:TextBox ID="oranlar" OnTextChanged="oranlar_TextChanged" AutoPostBack="true" Text="2" runat="server"></asp:TextBox>
            <asp:Label ID="r" runat="server" Text="Değer"></asp:Label>
            </ContentTemplate>
         </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
