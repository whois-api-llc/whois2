using System;

namespace Whois2ApiKeyExample
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            string apiKey = "Your whois API 2.0 API key";
            string domain = "google.com";

            string url = "http://www.whoisxmlapi.com/whoisserver/WhoisService?domainName=" 
                         + domain + "&apiKey=" + apiKey + "&outputFormat=JSON";
            
            try
            {
                dynamic result = new System.Net.WebClient().DownloadString(url);

                Console.WriteLine(result);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}