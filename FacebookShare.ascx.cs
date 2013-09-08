using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FacebookApplication.Controls
{
    public partial class FacebookShare : System.Web.UI.UserControl
    {
        public string Message { get; set; }
        public string Prompt { get; set; }
        public string Name { get; set; }
        public string Caption { get; set; }
        public string Description { get; set; }
        public string Href { get; set; }
        public string Image { get; set; }
        public string ApplicationId { get; set; }
    }
}
