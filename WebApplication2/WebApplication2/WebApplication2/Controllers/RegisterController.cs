using System;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApplication2.Models;

namespace WebApplication1.Controllers
{
    [Route("register")]
    [EnableCors(origins: "http://localhost:44301/", headers: "", methods: "*")]
    public class RegisterController : ApiController
    {
        [HttpPost]
        public async Task<object> Register([FromBody] Usuario user)
        {
            DHelperDB2 entities = new DHelperDB2();

            var usuario = new Usuario
            {

                Email = user.Email,
                Nome = user.Nome,
                Senha = user.Senha,
                Sobrenome = user.Sobrenome

            };

            try
            {
                var exist = entities.Usuario.FirstOrDefault(x => x.Email == usuario.Email);

                if (exist != null)
                {
                    return "04X00 - Este E-mail já está cadastrado";
                }
                entities.Usuario.Add(user);
                await entities.SaveChangesAsync();
                return "Usuário registrado com sucesso!";
            }
            catch (DbUpdateException ex)
            {
                return "04X00 - Este E-mail já está cadastrado";
            }
            catch (Exception ex)
            {
                return "04X01 - Falha interna no servidor";
            }
        }
    }
}