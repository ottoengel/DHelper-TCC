using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApplication2.Models;
using WebApplication2;



namespace WebApplication2.Controllers
{

    [Route("get-perfil/{id?}")]
    public class PerfilController : ApiController
    {
        [HttpGet]
        [EnableCors(origins: "http://localhost:44355/", headers: "", methods: "*")]
        public async Task<object> Perfil([FromUri] int? id)

        {
            DHelperDB2 entities = new DHelperDB2();

            try
            {
                var perfil = entities.
                    Usuario
                    .FirstOrDefault(x => x.ID == id);
                return perfil;
            }
            catch
            {
                return "01X00 - Falha interna no servidor";
            }
        }

    }
}