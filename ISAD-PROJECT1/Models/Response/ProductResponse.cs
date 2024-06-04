using ISAD_PROJECT1.Models.ViewModel;

namespace ISAD_PROJECT1.Models.Response
{
    public class ProductResponse
    {
        public int ErrCode { get; set; }
        public string ErrMsg { get; set; }
        public List<Product> Products { get; set; }
    }
}
