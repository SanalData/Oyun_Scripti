<html>
<head>
<META http-equiv=Content-Language content=tr>
<meta http-equiv=Content-Type content="text/html; charset=windows-1254">
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-9">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<%

dim mysql_server,mysql_user,mysql_pass,mysql_db,baglanti,Connection_DSN
	 mysql_server = "localhost"
     mysql_user = "oyunde"
     mysql_pass = "873679787"
     mysql_db = "oyunde"


     Connection_DSN= "DRIVER={MySQL ODBC 3.51 Driver}; SERVER="&mysql_server&"; UID="&mysql_user&"; pwd="&mysql_pass&";db="&mysql_db&";"
     Set Baglanti= Server.CreateObject("ADODB.Connection")
     Baglanti.Open Connection_DSN
	 Baglanti.Execute "SET NAMES 'latin5'"
Baglanti.Execute "SET CHARACTER SET latin5"
Baglanti.Execute "SET COLLATION_CONNECTION = 'latin5_turkish_ci'" %>
<%

'--------------------------------------------------------------------------------
dim strKaynakUrl
 strKaynakUrl ="http://www.oyunskor.com/ameliyat.html"
'--------------------------------------------------------------------------------
dim strVeri
 strVeri = fonkXmlHttp(strKaynakUrl)
'--------------------------------------------------------------------------------
'--------------------------------------------------------------------------------

' fonkVeriCek(strVeri, strBaslamaEtiket, strBitisEtiket) şeklinde veri çekilebilir...
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


temizlik=split(strveri,"<div id=""oyunAlan"">")
'response.write(temizlik(1))
a=5
for i=1 to 15
'BAŞLIK
baslik22=split(temizlik(1),"alt=""")
baslik11=split(baslik22(i),"""")
baslik=baslik11(0)
response.write("<br>"+baslik+"<br>")

'LİNK

link22=split(temizlik(1),"href=""")
link11=split(link22(a),"""")
link=link11(0)
a=a+1

'SAYFA 2
icerik2=fonkXmlHttp(link)

'RESİM

resim44=split(icerik2,"<span class=""item"">")
resim33=split(resim44(1),"<img src=""")
resim22=split(resim33(1),"""")
response.write(resim22(0)+"<br>")


'ACIKLAMA KISMI
aciklama3=split(icerik2,"</strong><br />")
aciklama2=split(aciklama3(1),"</p>")
aciklama=aciklama2(0)
response.write(aciklama)


'2.LİNK
link4=split(icerik2,"<!--categories column-->")
link3=split(link4(1),"<a href=""")
link2=split(link3(1),"""")
'response.write(link2(0))

' SAYFA 3
icerik3=fonkXmlHttp("http://www.oyunskor.com/"&link2(0))


'SWF
swf22=split(icerik3,"name=""movie"" value=""")
swf11=split(swf22(1),"""")
swf=swf11(0)
response.write(swf)

'SWF KAYDETME
baslik11=baslik

icerik=replace(baslik11," ","-")
icerik=replace(icerik,"_","-")
icerik=replace(icerik,"ö","o")
icerik=replace(icerik,"s","s")
icerik=replace(icerik,"ç","c")
icerik=replace(icerik,"g","g")
icerik=replace(icerik,"ü","u")
icerik=replace(icerik,"'","")
icerik=replace(icerik,":","")
icerik=replace(icerik,".","")
url = swf
swfadresi= "/uploads/flash/"+icerik+".swf"

Set XmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
XmlHttp.Open "GET", url, False
XmlHttp.send
KK = XmlHttp.ResponseBody
Set XmlHttp = Nothing

Set BinaryStrea = server.CreateObject("ADODB.Stream")
BinaryStrea.Type = 1 
BinaryStrea.Open
BinaryStrea.Write KK
BinaryStrea.SaveToFile server.MapPath(swfadresi), 2 
Set BinaryStrea = Nothing

'SWF KAYDETME BITIS

'RESIM KAYDETME BASLA



url = resim22(0)
resimadresi= "/uploads/images/"+icerik+".jpg"

Set XmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
XmlHttp.Open "GET", url, False
XmlHttp.send
KK = XmlHttp.ResponseBody
Set XmlHttp = Nothing

Set BinaryStrea1 = server.CreateObject("ADODB.Stream")
BinaryStrea1.Type = 1 
BinaryStrea1.Open
BinaryStrea1.Write KK
BinaryStrea1.SaveToFile server.MapPath(resimadresi), 2 
Set BinaryStrea1 = Nothing



'RESIM KAYDEMET BITIS
baslik1=baslik
baslik11=baslik1

icerik=replace(baslik11," ","-")
icerik=replace(icerik,"_","-")
icerik=replace(icerik,"ö","o")
icerik=replace(icerik,"s","s")
icerik=replace(icerik,"ç","c")
icerik=replace(icerik,"g","g")
icerik=replace(icerik,"ü","u")
icerik=replace(icerik,"'","")
icerik=replace(icerik,":","")
icerik=replace(icerik,".","")




'db de varmi yok diye bas


'db kayit

'Baglanti.execute("insert into oyunlar(kategori,tanitim,isapi,flash,onay,adi,resim,orj) values('ameliyat','"+aciklama+"','"+icerik+"','"+icerik+".swf','0','"+baslik+"','"+icerik+".jpg','"+baslik+"')")


next


%>

</body>
</html>
