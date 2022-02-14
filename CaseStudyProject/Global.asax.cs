


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Management;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace CaseStudyProject
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

           /* HttpRuntimeSection runTime = (HttpRuntimeSection)WebConfigurationManager.GetSection("system.web/httpRuntime");
            //Approx 100 Kb(for page content) size has been deducted because the maxRequestLength proprty is the page size, not only the file upload size
            int maxRequestLength = (runTime.MaxRequestLength - 100) * 1024;

            //This code is used to check the request length of the page and if the request length is greater than 
            //MaxRequestLength then retrun to the same page with extra query string value action=exception

            HttpContext context = ((HttpApplication)sender).Context;
            if (context.Request.ContentLength > maxRequestLength)
            {
                IServiceProvider provider = (IServiceProvider)context;
                HttpWorkerRequest workerRequest = (HttpWorkerRequest)provider.GetService(typeof(HttpWorkerRequest));
                // Check if body contains data
                if (workerRequest.HasEntityBody())
                {
                    // get the total body length
                    int requestLength = workerRequest.GetTotalEntityBodyLength();
                    // Get the initial bytes loaded
                    int initialBytes = 0;
                    if (workerRequest.GetPreloadedEntityBody() != null)
                        initialBytes = workerRequest.GetPreloadedEntityBody().Length;
                    if (!workerRequest.IsEntireEntityBodyIsPreloaded())
                    {
                        byte[] buffer = new byte[512000];
                        // Set the received bytes to initial bytes before start reading
                        int receivedBytes = initialBytes;
                        while (requestLength - receivedBytes >= initialBytes)
                        {
                            // Read another set of bytes
                            initialBytes = workerRequest.ReadEntityBody(buffer, buffer.Length);
                            // Update the received bytes
                            receivedBytes += initialBytes;
                        }
                        initialBytes = workerRequest.ReadEntityBody(buffer, requestLength - receivedBytes);
                    }
                }
                // Redirect the user to the same page with querystring action=exception. 
                context.Response.Redirect("~/Login.aspx");
            }*/

        }

        





    }
}