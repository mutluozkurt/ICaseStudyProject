using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.OleDb;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;




namespace DatabaseLayer
{
    public class DatabaseOperations
    {
        CaseStudyProjectDatabaseEntities context = new CaseStudyProjectDatabaseEntities();

        #region BarChart
        public string GetBarChartData()
        {
            DataTable table;
            table = new DataTable();

            var query = context.CSProjectTables
             .GroupBy(p => p.Marka)
             .Select(g => new { name = g.Key, count = g.Sum(w => w.Tuketim) }).ToArray();

            for (var i = 0; i < query.Length; i++)
            {
                table.Columns.Add(query[i].name);
            }

            DataRow row = table.NewRow();

            for (var i = 0; i < query.Length; i++)
            {
                row[query[i].name] = query[i].count;
            }

            table.Rows.Add(row);

            string JSONdata = JsonConvert.SerializeObject(table);
            return JSONdata;
        }
        #endregion


        #region LineChart
        public LineCharts GetLineChartData()
        {
            int a = 0;
            List<SeriesItem> series = new List<SeriesItem>();

            var query = context.CSProjectTables
               .Select(g => new { tuketim = g.Tuketim.ToString(), marka = g.Marka, donem = g.Donem.ToString() }).ToArray();

            var brandQuery = context.CSProjectTables.Select(m => m.Marka).Distinct().ToArray();

            var periodQuery = context.CSProjectTables.Select(m => m.Donem.ToString()).Distinct().ToArray();


            for (var i = 0; i < brandQuery.Length; i++)
            {
                float[] temp = new float[periodQuery.Length];

                for (var j = 0; j < periodQuery.Length; j++)
                {                 
                    temp[j] = float.Parse(query[a].tuketim, CultureInfo.InvariantCulture.NumberFormat);
                    a++;
                }

                series.Add(new SeriesItem()
                {
                    name = brandQuery[i],
                    data = temp

                });
            }

            float[] periodArray = new float[periodQuery.Length];

            for (var j = 0; j < periodQuery.Length; j++)
            {
                periodArray[j] = float.Parse(periodQuery[j], CultureInfo.InvariantCulture.NumberFormat);
            }

            return new LineCharts(series, periodArray);
        }
        #endregion

        #region Top5LineChart
        public LineCharts GetTopLineChartData()
        {
            int a = 0;
            List<SeriesItem> series = new List<SeriesItem>();

            var AvgQuery = context.CSProjectTables
               .GroupBy(p => p.Marka)
                .Select(g => new { name = g.Key, avg = g.Average(w => w.Tuketim) })
                   .OrderByDescending(d => new { ord = d.avg }).Take(5)
                   .OrderBy((m => new { Mord = m.name })).ToArray();

            var TopBrands = new string[AvgQuery.Length];

            for (var i = 0; i < AvgQuery.Length; i++)
            {
                TopBrands[i] = AvgQuery[i].name;
            }

            var TopQuery = context.CSProjectTables
              .Where(t => TopBrands.Contains(t.Marka))
               .Select(g => new { tuketim = g.Tuketim.ToString(), marka = g.Marka, donem = g.Donem.ToString() })
               .OrderBy(d => new { ord = d.marka }).ToArray();

            var periodQuery = context.CSProjectTables.Select(m => m.Donem.ToString()).Distinct().ToArray();

            for (var i = 0; i < AvgQuery.Length; i++)
            {
                float[] temp = new float[periodQuery.Length];

                for (var j = 0; j < periodQuery.Length; j++)
                {
                    temp[j] = float.Parse(TopQuery[a].tuketim, CultureInfo.InvariantCulture.NumberFormat);
                    a++;
                }

                series.Add(new SeriesItem()
                {
                    name = AvgQuery[i].name,
                    data = temp

                });
            }

            float[] periodArray = new float[periodQuery.Length];

            for (var j = 0; j < periodQuery.Length; j++)
            {
                periodArray[j] = float.Parse(periodQuery[j], CultureInfo.InvariantCulture.NumberFormat);
            }

            return new LineCharts(series, periodArray);
        }
        #endregion

        #region ImportExcelFile
        public void ImportData(String conString)
        {

            string query = "Select [Donem],[Marka],[Tuketim] from [Sheet1$]";
            OleDbConnection con = new OleDbConnection(conString);
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            OleDbCommand cmd = new OleDbCommand(query, con);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            da.Dispose();
            con.Close();
            con.Dispose();

            context.Database.ExecuteSqlCommand("DELETE FROM [CSProjectTable]");

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                context.CSProjectTables.Add(new CSProjectTable
                {
                    Donem = Convert.ToDouble(dr["Donem"]),
                    Marka = dr["Marka"].ToString(),
                    Tuketim = Convert.ToDouble(dr["Tuketim"])
                });
            }

            context.SaveChanges();
        } 
        #endregion



        public class SeriesItem
        {
            public string name { get; set; }
            public float[] data { get; set; }

        }

        public class LineCharts
        {
            public List<SeriesItem> series { get; set; }
            public float[] period { get; set; }

            public LineCharts(List<SeriesItem> iSeries, float[] iPeriod)
            {
                series = iSeries;
                period = iPeriod;
            }

            public LineCharts()
            {

            }
        }



    }
}
