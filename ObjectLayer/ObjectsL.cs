using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static DatabaseLayer.DatabaseOperations;

namespace ObjectLayer
{
    public class ObjectsL
    {
        DatabaseOperations op = new DatabaseOperations();

        public string GetBarChartData()
        {
            return op.GetBarChartData();
        }

        public LineCharts GetLineChartData()
        {
            return op.GetLineChartData();
        }

        public LineCharts GetTopLineChartData()
        {
            return op.GetTopLineChartData();
        }

        public void ImportData(String conString)
        {

            op.ImportData(conString);
        }
    }
}
