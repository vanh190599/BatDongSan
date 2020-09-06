using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data;
using DAL;

namespace BUS.Admin
{
    public class Admin_BUS
    {
        ConnectionAccess obj = new ConnectionAccess();
        public DataTable first(int id)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_Admin where Id='" + id + "'";
            tb = obj.getTable(sql);
            return tb;
        }

        public DataTable getAdmin(string email)
        {
            DataTable tb = new DataTable();
            string sql = "select * from tbl_Admin where email='"+email+"'";
            tb = obj.getTable(sql);
            return tb;
        }

        public void update(Admins admin, int id)
        {
            string sql = "update tbl_Admin set Name = N'" + admin.name + "', email =  N'" + admin.email + "', phone = '" + admin.phone + "', password='"+admin.password+"', role = '"+admin.role+"' where id = '" + id + "'";
            obj.ExecuteNonQuery(sql);
        }

        public void Insert(Admins admin)
        {
            string sql = "insert tbl_Admin values(N'"+admin.name+"',N'"+admin.email+"','"+admin.phone+"', '"+ admin.password+"', '"+admin.role+"')";
            obj.ExecuteNonQuery(sql);
        }
    }
}
