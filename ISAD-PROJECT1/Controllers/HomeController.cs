using ISAD_PROJECT1.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace ISAD_PROJECT1.Controllers
{
    public class HomeController : Controller
    {

       public IActionResult index()
        {
            return View();
        }

        
    }
}