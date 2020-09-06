using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using DTO;

namespace DAL
{
    public class admin_DAL
    {
        public SqlConnection getConnect()
        {
            string strConn = @"Data Source=DESKTOP-L18J255\SQLEXPRESS;Initial Catalog=BatDongSan;Integrated Security=True";
            return new SqlConnection(strConn);
        }

        public DataTable getTable(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            SqlDataAdapter adt = new SqlDataAdapter(sql, conn);
            DataTable tb = new DataTable();
            adt.Fill(tb);

            return tb;
        }

        public void ExecuteNonQuery(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.Clone();
        }

        public List<Admins> getAdmin(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            List<Admins> dsQTV = new List<Admins>();
            SqlCommand command = new SqlCommand(sql, conn);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Admins ad = new Admins();

                ad.ID =  reader.GetInt32(0);
                ad.name = reader.GetString(1);
                ad.email = reader.GetString(2);
                ad.phone = reader.GetString(3);
                ad.password = reader.GetString(3);

                dsQTV.Add(ad);
            }
            conn.Close();

            return dsQTV;
        }
    }
}
