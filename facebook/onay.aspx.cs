using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Facebook;
using Facebook.Web;
using Facebook.Schema;
using Facebook.Session;
using Facebook.Rest;

public partial class facebook_onay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string UserFbId;

    #region Page_PreInit
 
    #endregion

    #region Page_Load
    new protected void Page_Load(object sender, EventArgs e)
    {
        CanvasSession fs = new Facebook.Session.FBMLCanvasSession(
            ConfigurationSettings.AppSettings["APIKey"].ToString(),
            ConfigurationSettings.AppSettings["Secret"].ToString()
        );
        Api api = new Facebook.Rest.Api(fs);
        user fbUser = api.Users.GetInfo();	// Uygulamayi kullanan kullanicinin bilgileri

        UserFbId = fbUser.uid.ToString();
    }
    #endregion
}