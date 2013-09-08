<%@ Page Language="C#" AutoEventWireup="true" CodeFile="onay.aspx.cs" Inherits="facebook_onay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="container">

	<p>
		<fb:profile-pic uid="<%= UserFbId %>" linked="true" size="small" />
		Merhaba <fb:name uid="<%= UserFbId %>" useyou="false" />,<br />
		Orangeplus.Blog; ASP.NET ile Facebook uygulaması nasıl yapılırla ilgili örnek bir uygulama aslında.
	</p>


</div>
    </div>
    </form>
</body>
</html>
