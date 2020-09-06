using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BUS
{
    public class Register_BUS
    {
        ConnectionAccess obj = new ConnectionAccess();
        public void create(DTO.Users c)
        {
            string sql = "insert tbl_User values(N'" + c.name + "' , N'" + c.email + "', '" + c.phone + "','" + c.password + "','" + c.created_at + "')";
            obj.ExecuteNonQuery(sql);
        }
    }
}
