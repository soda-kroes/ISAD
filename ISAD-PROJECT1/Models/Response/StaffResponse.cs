using ISAD_PROJECT1.Models.ViewModel;

namespace ISAD_PROJECT1.Models.Response
{
    public class StaffResponse
    {
        public int ErrCode { get; set; }
        public string ErrMsg { get; set; }
        public List<Staff> Staffs { get; set; }
    }
}
