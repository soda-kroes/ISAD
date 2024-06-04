using ISAD_PROJECT1.Models.DBConnection;
using ISAD_PROJECT1.Models.Response;
using ISAD_PROJECT1.Models.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace ISAD_PROJECT1.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult ViewProduct()
        {
            return View();
        }

        public IActionResult PostProduct(Product objProduct)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {
                try
                {

                    //prevent duplicate user
                    bool find = false;
                    DataTable table = new DataTable();
                    string Query = @"SELECT * FROM [dbo].[tblProduct] WHERE Code = @productCode";
                    con._Ad = new SqlDataAdapter(Query, con._Con);
                    con._Ad.SelectCommand.Parameters.AddWithValue("@productCode", objProduct.Code);
                    con._Ad.Fill(table);
                    foreach (DataRow row in table.Rows)
                    {
                        find = true;
                    }
                    if (!find)
                    {
                        con._Cmd = new SqlCommand("SP_INSERT_PRODUCT", con._Con);
                        con._Cmd.CommandType = CommandType.StoredProcedure;
                        con._Cmd.Parameters.AddWithValue("@code", objProduct.Code);
                        con._Cmd.Parameters.AddWithValue("@name", objProduct.Name);
                        con._Cmd.Parameters.AddWithValue("@quantity", objProduct.Quantity);
                        con._Cmd.Parameters.AddWithValue("@price", objProduct.Price);
                        con._Cmd.Parameters.AddWithValue("@description", objProduct.Description);
                        con._Cmd.ExecuteNonQuery();

                        response.ErrCode = 0;
                        response.ErrMsg = "Product create successfully.";
                    }
                    else
                    {
                        response.ErrCode = 1;
                        response.ErrMsg = "Product code is not available.";
                    }
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }
            return Ok(response);
        }

        public IActionResult GetProduct(string productCode)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            ProductResponse response = new ProductResponse();

            if (con._ErrCode == 0)
            {
                List<Product> list = new List<Product>();
                Product obj;

                try
                {
                    DataTable table = new DataTable();
                    string query = "SELECT * FROM [dbo].[tblProduct]";

                    if (!string.IsNullOrEmpty(productCode))
                    {
                        query += " WHERE Code = @productCode";
                        con._Cmd.Parameters.AddWithValue("@productCode", productCode);
                    }

                    con._Cmd.CommandText = query;
                    con._Cmd.Connection = con._Con;
                    con._Ad = new SqlDataAdapter(con._Cmd);
                    con._Ad.Fill(table);

                    foreach (DataRow row in table.Rows)
                    {
                        obj = new Product();
                        obj.Id = Convert.ToInt32(row["Id"]);
                        obj.Code = row["Code"].ToString();
                        obj.Name = row["Name"].ToString();
                        obj.Quantity = Convert.ToInt32(row["Quantity"].ToString());
                        obj.Price = Convert.ToDecimal(row["Price"].ToString());
                        obj.Description = row["Description"].ToString();
                        list.Add(obj);
                    }

                    response.ErrCode = 0;
                    response.ErrMsg = "Success";
                    response.Products = list.ToList();
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }

            return Ok(response);
        }

        public IActionResult GetProductById(int productId)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            ProductResponse response = new ProductResponse();

            if (con._ErrCode == 0)
            {
                List<Product> list = new List<Product>();
                Product obj;

                try
                {
                    DataTable table = new DataTable();
                    string query = "SELECT * FROM [dbo].[tblProduct] WHERE Id = @productId";
                    con._Cmd.CommandText = query;
                    con._Cmd.Connection = con._Con;
                    con._Ad = new SqlDataAdapter(con._Cmd);
                    con._Ad.SelectCommand.Parameters.AddWithValue("@productId", productId);
                    con._Ad.Fill(table);

                    foreach (DataRow row in table.Rows)
                    {
                        obj = new Product();
                        obj.Id = Convert.ToInt32(row["Id"]);
                        obj.Code = row["Code"].ToString();
                        obj.Name = row["Name"].ToString();
                        obj.Quantity = Convert.ToInt32(row["Quantity"].ToString());
                        obj.Price = Convert.ToDecimal(row["Price"].ToString());
                        obj.Description = row["Description"].ToString();
                        list.Add(obj);
                    }

                    response.ErrCode = 0;
                    response.ErrMsg = "Success";
                    response.Products = list.ToList();
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }

            return Ok(response);
        }
        public IActionResult DeleteProduct(int productId)
        {

            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {
                try
                {

                    con._Cmd = new SqlCommand("SP_DELETE_PRODUCT", con._Con);
                    con._Cmd.CommandType = CommandType.StoredProcedure;
                    con._Cmd.Parameters.AddWithValue("@id", productId);
                    con._Cmd.ExecuteNonQuery();
                    response.ErrCode = 0;
                    response.ErrMsg = "Product Delete Successfully";
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }
            else
            {

                response.ErrCode = con._ErrCode;
                response.ErrMsg = con._ErrMsg;
            }


            return Ok(response);
        }

        public IActionResult UpdateProduct(Product objProduct)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {
                try
                {

                    //prevent duplicate user
                    con._Cmd = new SqlCommand("SP_UPDATE_PRODUCT", con._Con);
                    con._Cmd.CommandType = CommandType.StoredProcedure;
                    con._Cmd.Parameters.AddWithValue("@id", objProduct.Id);
                    con._Cmd.Parameters.AddWithValue("@code", objProduct.Code);
                    con._Cmd.Parameters.AddWithValue("@name", objProduct.Name);
                    con._Cmd.Parameters.AddWithValue("@quantity", objProduct.Quantity);
                    con._Cmd.Parameters.AddWithValue("@price", objProduct.Price);
                    con._Cmd.Parameters.AddWithValue("@description", objProduct.Description);
                    con._Cmd.ExecuteNonQuery();

                    response.ErrCode = 0;
                    response.ErrMsg = "Product update successfully.";
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }
            return Ok(response);
        }
    }
}
