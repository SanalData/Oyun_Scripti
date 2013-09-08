using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class oyunlistem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 1; i <= Convert.ToInt32(Request.Cookies["toplamoyun"].Value); i++)
        {
            try
            {
                oyunlistesi.Text = oyunlistesi.Text + "" + "<a href='http://www.oyunde.com/oyun_oyna/" + Request.Cookies["oyunadi" + i.ToString()].Value + "'><div style='float:left; border:1px gray solid; padding:2px; margin-left:4px;' align=center ><img title='oyun oyna' height='70' width='70' src='http://www.oyunde.com/uploads/images/" + Request.Cookies["oyunresmi" + i.ToString()].Value + "'><br></div></a>";

            }
            catch
            {
            }
        }
    }
}