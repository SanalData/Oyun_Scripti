<% 
Server.ScriptTimeout=9000
if request.QueryString("islem")="" then%>
<form method="post" action="bot.asp?islem=cek" >
<table  width="600">111
<tr><td>Link Url: <input  name="link" id="link"width="600"  style="width:700px;" /></td></tr>
<tr><td>Döngü: <input  name="dongu" id="dongu" width="600"  style="width:700px;" /></td></tr>
<tr><td><input type="submit" value="Yolla Haci" /></td></tr>
</table>
</form>
<%else

dim mysql_server,mysql_user,mysql_pass,mysql_db,baglanti,Connection_DSN
	 mysql_server = "server"
     mysql_user = "user"
     mysql_pass = "pass"
     mysql_db = "db"


     Connection_DSN= "DRIVER={MySQL ODBC 3.51 Driver}; SERVER="&mysql_server&"; UID="&mysql_user&"; pwd="&mysql_pass&";db="&mysql_db&";"
     Set Baglanti= Server.CreateObject("ADODB.Connection")
     Baglanti.Open Connection_DSN
	 Baglanti.Execute "SET NAMES 'latin5'"
Baglanti.Execute "SET CHARACTER SET latin5"
Baglanti.Execute "SET COLLATION_CONNECTION = 'latin5_turkish_ci'" %>
<%

'--------------------------------------------------------------------------------
dim strKaynakUrl
 strKaynakUrl ="http://www.gamezhero.com/tag/action/#page/4"
'--------------------------------------------------------------------------------
dim strVeri
 strVeri = fonkXmlHttp(strKaynakUrl)
'--------------------------------------------------------------------------------
'--------------------------------------------------------------------------------

' fonkVeriCek(strVeri, strBaslamaEtiket, strBitisEtiket) þeklinde veri çekilebilir...
'--------------------------------------------------------------------------------
'--------------------------------------------------------------------------------
function fonkXmlHttp(strUrl)
dim objXmlHttp
set objXmlHttp = Server.CreateObject("Microsoft.XMLHTTP") 
 objXmlHttp.Open "GET", strUrl, false
 objXmlHttp.SetRequestHeader "Pragma", "no-cache"
 objXmlHttp.SetRequestHeader "Cache-control", "no-cache"
 
on error Resume next
 objXmlHttp.Send
if Err.Number<>0 then
 fonkXmlHttp = ""
exit function
end If
on error Goto 0
if (objXmlHttp.Status = 200) then
 fonkXmlHttp = objXmlHttp.ResponseText
 fonkXmlHttp = fonkStream(objXmlHttp.ResponseBody,"windows-1254")
else
 fonkXmlHttp = "Hata : " & objXmlHttp.StatusText
end if
end function

'--------------------------------------------------------------------------------
function fonkStream(Veri,KarakterSet)
dim objStream
set objStream = Server.CreateObject("ADODB.Stream")
 objStream.Type = 1
 objStream.Mode = 3
 objStream.Open
 objStream.Write Veri
 objStream.Position = 0
 objStream.Type = 2
 objStream.Charset = KarakterSet
 fonkStream = objStream.ReadText 
 objStream.Close
set objStream = Nothing
end function
'--------------------------------------------------------------------------------
Function fonkVeriCek(strVeri, strBaslamaEtiket, strBitisEtiket)
dim intBaslama
 intBaslama = InStr(1, strVeri, strBaslamaEtiket, vbTextCompare)
if intBaslama then
 intBaslama = intBaslama + Len(strBaslamaEtiket)
 intBitis = InStr(intBaslama + 1, strVeri, strBitisEtiket, vbTextCompare)
 fonkVeriCek = CStr(Mid(strVeri, intBaslama, intBitis - intBaslama))
else
 fonkVeriCek = " " 
end if
End Function
'--------------------------------------------------------------------------------
function seo(icerik11)
icerik=lcase(icerik11)
icerik=replace(icerik,"ö","o")
icerik=replace(icerik,"s","s")
icerik=replace(icerik,"ç","c")
icerik=replace(icerik,"g","g")
icerik=replace(icerik,"ü","u")
icerik=replace(icerik,"'","")
icerik=replace(icerik,":","")
end function
'response.Write(strveri)
 'baslik okuma


for i=1 to 16
'BASLIK
baslik11=split(strveri,"<div class=""game_name"">")
baslik12=split(baslik11(i),"""")
baslik=baslik12(1)





'RESIM


res11=split(strveri,"main_game_list")
resim11=split(res11(1),"image_src=""")


resim12=split(resim11(i),"""")






'LIKNK KISMI CEKME
link22=split(baslik11(i)," href=""")
link11=split(link22(1),"""")

'ICERIK KISMINI CEKMEE
icerik = fonkXmlHttp("http://www.gamezhero.com/"+link11(0))

'swf 

swfadres11=split(icerik,"swfurl: """)
swfadres12=split(swfadres11(1),"""")

'aciklama
aciklama11=split(icerik,"description: """)
aciklama12=split(aciklama11(1),"""")



'SWF KAYDETME BASLA




icerik=lcase(baslik12(1))

icerik=replace(icerik," ","-")
icerik=replace(icerik,"_","-")
icerik=replace(icerik,"ö","o")
icerik=replace(icerik,"s","s")
icerik=replace(icerik,"ç","c")
icerik=replace(icerik,"g","g")
icerik=replace(icerik,"ü","u")
icerik=replace(icerik,"'","")
icerik=replace(icerik,":","")
icerik=replace(icerik,".","")


url = swfadres12(0)
resim332= "/uploads/flash/"+icerik+".swf"

Set XmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
XmlHttp.Open "GET", url, False
XmlHttp.send
KK = XmlHttp.ResponseBody
Set XmlHttp = Nothing

Set BinaryStrea = server.CreateObject("ADODB.Stream")
BinaryStrea.Type = 1 
BinaryStrea.Open
BinaryStrea.Write KK
BinaryStrea.SaveToFile server.MapPath(resim332), 2 
Set BinaryStrea = Nothing

'SWF KAYDETME BITIS
'RESIM KAYDETME BASLA


icerik=lcase(icerik)
icerik=replace(icerik," ","-")
icerik=replace(icerik,"_","-")
icerik=replace(icerik,"ö","o")
icerik=replace(icerik,"s","s")
icerik=replace(icerik,"ç","c")
icerik=replace(icerik,"g","g")
icerik=replace(icerik,"ü","u")
icerik=replace(icerik,"'","")
icerik=replace(icerik,":","")
icerik=replace(icerik,".","")


url = resim12(0)
resim332= "/uploads/images/"+icerik+".jpg"

Set XmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
XmlHttp.Open "GET", url, False
XmlHttp.send
KK = XmlHttp.ResponseBody
Set XmlHttp = Nothing

Set BinaryStrea1 = server.CreateObject("ADODB.Stream")
BinaryStrea1.Type = 1 
BinaryStrea1.Open
BinaryStrea1.Write KK
BinaryStrea1.SaveToFile server.MapPath(resim332), 2 
Set BinaryStrea1 = Nothing



'RESIM KAYDEMET BITIS
'db de varmi yok diye bas
hak=0
Set rs = Server.CreateObject("ADODB.Recordset")
Sorgu = "Select orj from oyunlar where orj='"+baslik12(1)+"'"
rs.Open Sorgu,Baglanti,1,3
Do while not rs.EOF 

hak=1
rs.Movenext
  Loop 

'db kayit
if hak=0 then
Baglanti.execute("insert into oyunlar(kategori,tanitim,isapi,flash,onay,adi,resim,orj) values('aksiyon','"+seo(aciklama12(0))+"','"+seo(icerik)+"','"+seo(icerik)+".swf','0','"+baslik12(1)+"','"+seo(icerik)+".jpg','"+seo(baslik12(1))+"')")
end if


%>
<center>
<table style="width:1000px;">
<tr><td  width="500"><b>Oyun Adi</b></td><td  width="500" align="left"><b>Durum</b></td></tr>
<tr><td  width="500"><%response.Write(baslik12(1))%></td><td  width="500" align="left"><%=hak%></td></tr>
</table>
</center>
<%next
end if
%>  