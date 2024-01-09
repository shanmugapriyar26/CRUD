using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace CRUDOperations
{
    public class BLL_ProductMaster
    {
        public static string ConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["myConnectionstring"].ConnectionString;
        }

        public static SqlConnection SqlConnectionObject()
        {
            return new SqlConnection(ConnectionString());
        }

        public DataTable GetProductData(int ProductID)
        {
            DataTable dtProducts = new DataTable();

            using (SqlConnection connection = SqlConnectionObject())
            using (SqlCommand command = connection.CreateCommand())
            {
                try
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "USP_GetData_ProductMaster";
                    command.Parameters.Add(new SqlParameter("@ProductID", SqlDbType.Int) { Value = ProductID });

                    using (SqlDataAdapter sqlDA = new SqlDataAdapter(command))
                    {
                        sqlDA.Fill(dtProducts);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error in GetProductData: " + ex.Message);
                }
            }

            return dtProducts;
        }

        public string Insert_Update_Product(int ProductID, string ProductCode, string ProductName, int Qty, decimal Price, string Remarks)
        {
            string message = string.Empty;

            using (SqlConnection connection = SqlConnectionObject())
            using (SqlCommand command = connection.CreateCommand())
            {
                try
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "USP_CREATE_UPDATE_PRODUCTS";
                    command.Parameters.Add(new SqlParameter("@ProductID", SqlDbType.Int) { Value = ProductID });
                    command.Parameters.Add(new SqlParameter("@ProductCode", SqlDbType.VarChar) { Value = ProductCode });
                    command.Parameters.Add(new SqlParameter("@ProductName", SqlDbType.VarChar) { Value = ProductName });
                    command.Parameters.Add(new SqlParameter("@Qty", SqlDbType.Int) { Value = Qty });
                    command.Parameters.Add(new SqlParameter("@Price", SqlDbType.Decimal) { Value = Price });
                    command.Parameters.Add(new SqlParameter("@Remarks", SqlDbType.VarChar) { Value = Remarks });
                    command.Parameters.Add(new SqlParameter("@message", SqlDbType.VarChar, 250) { Direction = ParameterDirection.Output });

                    connection.Open();
                    command.ExecuteNonQuery();
                    message = command.Parameters["@message"].Value.ToString();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error in Insert_Update_Product: " + ex.Message);
                }
            }

            return message;
        }

        public string Delete_Product(int ProductID)
        {
            string message = string.Empty;

            using (SqlConnection connection = SqlConnectionObject())
            using (SqlCommand command = connection.CreateCommand())
            {
                try
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "USP_DELETE_PRODUCTS";
                    command.Parameters.Add(new SqlParameter("@ProductID", SqlDbType.Int) { Value = ProductID });
                    command.Parameters.Add(new SqlParameter("@message", SqlDbType.VarChar, 250) { Direction = ParameterDirection.Output });

                    connection.Open();
                    command.ExecuteNonQuery();
                    message = command.Parameters["@message"].Value.ToString();
                }
                catch (Exception ex)
                {
                    // Handle or log the exception as needed
                    Console.WriteLine("Error in Delete_Product: " + ex.Message);
                }
            }

            return message;
        }
    }
}

/*namespace CRUDOperations
{
    public class BLL_ProductMaster
    {
        public static string Connectionstring()
        {
            string cstr = ConfigurationManager.ConnectionStrings["myConnectionstring"].ConnectionString;
            return cstr;
        }
        public static SqlConnection sqlConnectionString()
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = Connectionstring();
            return conn;
        }
        public DataTable GetProductData(int ProductID)
        {
            SqlConnection connection = null;
            SqlCommand command = null;
            SqlDataAdapter sqlDA = null;
            DataTable dtProducts = null;

            using (connection = sqlConnectionString())
            {
                command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "USP_GetData_ProductMaster";
                command.Parameters.Add("@ProductID",SqlDbType.Int).Value=ProductID;
                sqlDA = new SqlDataAdapter(command);
                dtProducts = new DataTable();
                sqlDA.Fill(dtProducts);
            }
            return dtProducts;
        }
        public string Insert_Update_Product(int ProductID, string ProductCode, string ProductName, int Qty, decimal Price,string Remarks)
        {
            string message = string.Empty;
            SqlConnection connection = null;
            SqlCommand command = null;

            using (connection = sqlConnectionString())
            {
                command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "USP_CREATE_UPDATE_PRODUCTS";
                command.Parameters.Add("@ProductID", SqlDbType.Int).Value = ProductID;
                command.Parameters.Add("@ProductCode", SqlDbType.VarChar).Value = ProductCode;
                command.Parameters.Add("@ProductName", SqlDbType.VarChar).Value = ProductName;
                command.Parameters.Add("@Qty", SqlDbType.Int).Value = Qty;
                command.Parameters.Add("@Price", SqlDbType.Decimal).Value = Price;
                command.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = Remarks;
                command.Parameters.Add("@message", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
                connection.Open();
                command.ExecuteNonQuery();
                message = command.Parameters["@message"].Value.ToString();
                connection.Close();
            }
            return message;
        }

        public string Delete_Product(int ProductID)
        {
            string message = string.Empty;
            SqlConnection connection = null;
            SqlCommand command = null;

            using (connection = sqlConnectionString())
            {
                command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "USP_DELETE_PRODUCTS";
                command.Parameters.Add("@ProductID", SqlDbType.Int).Value = ProductID;
                command.Parameters.Add("@message", SqlDbType.VarChar, 250).Direction = ParameterDirection.Output;
                connection.Open();
                command.ExecuteNonQuery();
                message = command.Parameters["@message"].Value.ToString();
                connection.Close();
            }
            return message;
        }
    }
} */


