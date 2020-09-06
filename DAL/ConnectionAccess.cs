using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;

namespace DAL
{
    public class ConnectionAccess
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

        //lay 1 ban ghi danh muc voi ten bang va id duoc truyen vao
        public string[] firstCategory(string table_name, int id)
        {
            SqlConnection conn = getConnect();
            conn.Open();

            string sql = "select * from "+ table_name + " where id = '"+id+"'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            string[] param = new string[3];
            while (reader.Read())
            {
                param[0] = reader.GetString(1); //name
                param[1] = reader.GetString(2); //desc
                param[2] = reader.GetBoolean(3).ToString();//status
            }
            return param;
        }

        public string[] firstCategory1(string table_name, int id)
        {
            SqlConnection conn = getConnect();
            conn.Open();

            string sql = "select * from " + table_name + " where id = '" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            string[] param = new string[10];
            while (reader.Read())
            {
                param[0] = reader.GetString(1); //name
                param[1] = reader.GetString(2); //desc
                                                // param[2] = reader.GetString(3);
                param[3] = reader.GetString(4); //desc
                param[4] = reader.GetString(5); //desc
                param[5] = reader.GetInt32(6).ToString(); //desc
                param[6] = reader.GetString(7); //desc
                param[7] = reader.GetInt32(8).ToString(); //desc
                param[8] = reader.GetString(9); //desc

                param[9] = reader.GetBoolean(10).ToString();//status
            }
            return param;
        }
    }
}
