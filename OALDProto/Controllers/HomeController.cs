using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Microsoft.IdentityModel.Tokens.Saml2;
using Microsoft.SharePoint.Client;
using System.IO;
using System.Net;


namespace OALDProto.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(String usr)
        {
            ViewBag.Message = !String.IsNullOrWhiteSpace(usr) ? String.Format("Hi, {0}!", usr) : String.Empty;

            return View();
        }

        public ActionResult Results(String q)
        {
            // return query as:  oup | 04ld
            // should be: /api/v1/dictionaries/{dictionaryCode}/search/first/?q={searchWord}&format={format}
            // demo: /wrapper/dictionaries/{dictionaryCode}/search/first/?siteName=02.%20OALD%20demo%20API&q={searchWord}&format={format}&acceptedFormat=application/json&page=1&start=0&limit=25

            String sAddress = String.Format("http://skpublishapi-oupelt.demo.cw.idm.fr/wrapper/dictionaries/{0}/search/first/?siteName=02.%20OALD%20demo%20API&q={1}&format={2}&acceptedFormat=application/json&page=1&start=0&limit=25", "oald", q, "html");
            String sResponse = String.Empty;
            HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", Convert.ToBase64String(Encoding.ASCII.GetBytes("oup" + ":" + "04ld")));
            
            sResponse = client.GetAsync(sAddress).ContinueWith((r) =>
                {
                    return r.Result.Content.ReadAsStringAsync();
                }).Unwrap().Result;

            ViewBag.Query = q;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            var kvs = jss.Deserialize<dynamic>(sResponse);
            ViewBag.DictionaryCode = kvs["dictionaryCode"];
            ViewBag.Entry = kvs["entryContent"];
            
            return View();
        }

        public ActionResult Partial(String usr)
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your quintessential app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your quintessential contact page.";

            return View();
        }
    }
}
