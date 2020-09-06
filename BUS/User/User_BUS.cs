using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data;
using DAL;

namespace BUS.User
{
    public class User_BUS
    {
        ConnectionAccess obj = new ConnectionAccess();
        public DataTable first(int id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_User where Id='" + id + "'";
            tb = obj.getTable(sql);
            return tb;
        }

        public void update(Users user, int id)
        {
            string sql = "update tbl_User set Name = N'" + user.name + "', email =  N'" + user.email + "', phone = '" + user.phone + "', password='" + user.password + "' where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }

        public void Insert(Users user)
        {
            string sql = "insert tbl_User values(N'" + user.name + "',N'" + user.email + "', '" + user.phone + "', '" + user.password + "')";
        }
    }
}
