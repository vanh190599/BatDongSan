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
    public class Login_BUS
    {
        admin_DAL obj = new admin_DAL();
        public List<Admins> Auth_login(string emai, string password)
        {
            List<Admins> list = new List<Admins>();
            list = obj.getAdmin("select * from tbl_Admin where email = '" + emai + "' and password = '" + password + "' ");
            return list;
        }
        user_DAL obj1 = new user_DAL();
        public List<Users> Auth_loginUser(string emai, string password)
        {
            List<Users> list = new List<Users>();
            list = obj1.getUser("select * from tbl_User where email = '" + emai + "' and password = '" + password + "' ");
            return list;
        }
    }
}
