using ObjectLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DatabaseLayer.DatabaseOperations;

namespace CaseStudyProject
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static ObjectsL obj = new ObjectsL();

        #region GetBarChartData
        [WebMethod]
        public static string GetBarChartData()
        {
            return obj.GetBarChartData();
        }
        #endregion

        #region GetLineChartData
        [WebMethod]
        public static LineCharts GetLineChartData()
        {
            return obj.GetLineChartData();
        }
        #endregion

        #region GetTopLineChartData
        [WebMethod]
        public static LineCharts GetTopLineChartData()
        {
            return obj.GetTopLineChartData();
        }
        #endregion
    }
}