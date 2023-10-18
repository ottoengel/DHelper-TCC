using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApplication2;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{

    [Route("login")]
    [EnableCors(origins: "http://localhost:44332/", headers: "", methods: "*")]
    public class LoginController : ApiController
    {
        [HttpPost]
        public async Task<object> Login([FromBody] Usuario user)
        {

            DHelperDB2 entitie = new DHelperDB2();

            var usuario = entitie.Usuario.FirstOrDefault(x => x.Email == user.Email);

            if (user == null)
                return "Usuário ou senha incorretos";
            else if (usuario.Senha == user.Senha)
            {
                return "Login feito com sucesso";
            }
            else

                return "Usuário ou senha incorretos";

        }

    }
}
