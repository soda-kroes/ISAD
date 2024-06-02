using ISAD_PROJECT1.Models.DBConnection;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using ISAD_PROJECT1.Models.ViewModel;
using ISAD_PROJECT1.Models.Response;

namespace ISAD_PROJECT1.Controllers
{
    public class SupplierController : Controller
    {
        public IActionResult ViewSupplier()
        {
            return View();
        }

        public IActionResult PostSupplier(Supplier objSupplier)
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
                    string Query = @"SELECT * FROM [dbo].[tblSupplier] WHERE Supplier = @SupplierName";
                    con._Ad = new SqlDataAdapter(Query, con._Con);
                    con._Ad.SelectCommand.Parameters.AddWithValue("@SupplierName",objSupplier.SupplierName);
                    con._Ad.Fill(table);
                    foreach (DataRow row in table.Rows)
                    {
                        find = true;
                    }
                    if (!find)
                    {
                        con._Cmd = new SqlCommand("SP_INSERT_SUPPLIER", con._Con);
                        con._Cmd.CommandType = CommandType.StoredProcedure;
                        con._Cmd.Parameters.AddWithValue("@Supplier", objSupplier.SupplierName);
                        con._Cmd.Parameters.AddWithValue("@Address", objSupplier.Address);
                        con._Cmd.Parameters.AddWithValue("@Contact", objSupplier.Contact);
                        con._Cmd.ExecuteNonQuery();

                        response.ErrCode = 0;
                        response.ErrMsg = "Supplier create success.";
                    }
                    else
                    {
                        response.ErrCode = 1;
                        response.ErrMsg = "Supplier is not available.";
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

        public IActionResult GetSupplier(string supplierName)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            SupplierResponse response = new SupplierResponse();

            if (con._ErrCode == 0)
            {
                List<Supplier> list = new List<Supplier>();
                Supplier obj;

                try
                {
                    DataTable table = new DataTable();
                    string query = "SELECT * FROM [dbo].[tblSupplier]";

                    if (!string.IsNullOrEmpty(supplierName))
                    {
                        query += " WHERE Supplier = @SupplierName";
                        con._Cmd.Parameters.AddWithValue("@SupplierName", supplierName);
                    }

                    con._Cmd.CommandText = query;
                    con._Cmd.Connection = con._Con;
                    con._Ad = new SqlDataAdapter(con._Cmd);
                    con._Ad.Fill(table);

                    foreach (DataRow row in table.Rows)
                    {
                        obj = new Supplier();
                        obj.Id = Convert.ToInt32(row["Id"]);
                        obj.SupplierName = row["Supplier"].ToString();
                        obj.Address = row["address"].ToString();
                        obj.Contact = row["Contact"].ToString();
                        list.Add(obj);
                    }

                    response.ErrCode = 0;
                    response.ErrMsg = "Success";
                    response.Suppliers = list.ToList();
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }

            return Ok(response);
        }

        public IActionResult DeleteSupplier(int SupplierId)
        {

            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {
                try
                {

                    con._Cmd = new SqlCommand("SP_DELETE_SUPPLIER", con._Con);
                    con._Cmd.CommandType = CommandType.StoredProcedure;
                    con._Cmd.Parameters.AddWithValue("@SupplierId", SupplierId);
                    con._Cmd.ExecuteNonQuery();
                    response.ErrCode = 0;
                    response.ErrMsg = "Supplier Delete Successfully";
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

        public IActionResult UpdateSupplier(Supplier objSupplier)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {
                try
                {

                    //prevent duplicate user
                    con._Cmd = new SqlCommand("SP_UPDATE_SUPPLIER", con._Con);
                    con._Cmd.CommandType = CommandType.StoredProcedure;
                    con._Cmd.Parameters.AddWithValue("@Id", objSupplier.Id);
                    con._Cmd.Parameters.AddWithValue("@Supplier", objSupplier.SupplierName);
                    con._Cmd.Parameters.AddWithValue("@Address", objSupplier.Address);
                    con._Cmd.Parameters.AddWithValue("@Contact", objSupplier.Contact);
                    con._Cmd.ExecuteNonQuery();

                    response.ErrCode = 0;
                    response.ErrMsg = "Supplier update success.";
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
