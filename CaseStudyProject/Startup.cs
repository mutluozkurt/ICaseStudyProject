using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CaseStudyProject.Startup))]
namespace CaseStudyProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
