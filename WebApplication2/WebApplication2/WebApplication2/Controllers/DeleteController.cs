using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApplication2.Models;

namespace WebApplication5.Controllers
{
    [Route("delete-user/{id}")]
    public class DeleteController : ApiController
    {
        [HttpDelete]
        [EnableCors(origins: "http://localhost:44355/", headers: "application/json; charset=utf-8", methods: "*")]
        public async Task<object> Delete([FromUri] int id)
        {

            DHelperDB2 entities = new DHelperDB2();

            try
            {

                var usuario = entities
                .Usuario
                .FirstOrDefault(x => x.ID == id);


                if (usuario == null)
                    return "Usuario não encontrado";

                else
                {
                    entities.Usuario.Remove(usuario);
                    await entities.SaveChangesAsync();
                    return "Deletada com Sucesso";
                }

            }
            catch (DbUpdateException)
            {
                return "01X04 - Não foi possivel deletar usuario";
            }
            catch
            {
                return "01X05 - Falha interna no servidor";
            }
        }
    }
}