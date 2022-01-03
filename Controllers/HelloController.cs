using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;

namespace WebAPIdemo.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    // https://localhost:44361/api/hello
    public class HelloController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("hello World!");
        }

        [HttpPost]
        //JObject means Json object from Newton package manager installed
        public IActionResult Post(JObject payload)
        {
            return Ok(payload);
        }  
    }  

}
  