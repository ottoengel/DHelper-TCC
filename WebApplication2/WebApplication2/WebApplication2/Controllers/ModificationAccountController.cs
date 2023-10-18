using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApplication2.Models;

namespace WebApplication1.Controllers
{
    [Route("update-user/{id}")]
    [EnableCors(origins: "http://localhost:44332/", headers: "", methods: "*")]
    public class ModificationAccountController : ApiController
    {
        [HttpPut]
        public async Task<object> Change([FromBody] Usuario user, [FromUri] int id)
        {

            DHelperDB2 entitie = new DHelperDB2();

            try
            {
                var usuario = entitie
                    .Usuario
                    .First(x => x.ID == id);

                usuario.Email = user.Email;
                usuario.Senha = user.Senha;

                await entitie.SaveChangesAsync();

                return "Alterações realizadas com sucesso!";
            }
            catch (DbUpdateException)
            {
                return "01X04 - Não foi possível alterar as informações de usuário";
            }
            catch
            {
                return "01X05 - Falha interna no servidor";
            }
        }
    }
}