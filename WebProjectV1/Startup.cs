using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebProjectV1.Startup))]
namespace WebProjectV1
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
