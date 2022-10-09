using Microsoft.AspNetCore.Mvc;

namespace WilWa.Website.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TestController : ControllerBase
    {
        [HttpGet]
        public string Get()
        {
            return "Test";
        }
    }
}