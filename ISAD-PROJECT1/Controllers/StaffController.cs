using ISAD_PROJECT1.Models.DBConnection;
using ISAD_PROJECT1.Models.Response;
using ISAD_PROJECT1.Models.ViewModel;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using ISAD_PROJECT1.Utils;

namespace ISAD_PROJECT1.Controllers
{
    public class StaffController : Controller
    {
        public IActionResult ViewStaff()
        {
            return View();
        }
        public IActionResult PostStaff(Staff objStaff)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {
                try
                {
                    objStaff.DateOfBirth = (DateTime)FormateDate.ServerFormatDate(objStaff.DateOfBirthStr);

                    //prevent duplicate user
                    bool find = false;
                    DataTable table = new DataTable();
                    string Query = @"SELECT * FROM [dbo].[tblStaff] WHERE FullName = @FullName";
                    con._Ad = new SqlDataAdapter(Query, con._Con);
                    con._Ad.SelectCommand.Parameters.AddWithValue("@FullName", objStaff.FullName);
                    con._Ad.Fill(table);
                    foreach (DataRow row in table.Rows)
                    {
                        find = true;
                    }
                    if (!find)
                    {
                        con._Cmd = new SqlCommand("SP_INSERT_STAFF", con._Con);
                        con._Cmd.CommandType = CommandType.StoredProcedure;
                        con._Cmd.Parameters.AddWithValue("@FullName", objStaff.FullName);
                        con._Cmd.Parameters.AddWithValue("@DateOfBirth", objStaff.DateOfBirth);
                        con._Cmd.Parameters.AddWithValue("@Position", objStaff.Position);
                        con._Cmd.Parameters.AddWithValue("@Salary", objStaff.Salary);
                        con._Cmd.Parameters.AddWithValue("@Gender", objStaff.Gender);
                        con._Cmd.Parameters.AddWithValue("@Stopwork", 1);
                        con._Cmd.ExecuteNonQuery();

                        response.ErrCode = 0;
                        response.ErrMsg = "Staff create success.";
                    }
                    else
                    {
                        response.ErrCode = 1;
                        response.ErrMsg = "Staff name is not available.";
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

        public IActionResult GetStaff(string staffName)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            StaffResponse response = new StaffResponse();

            if (con._ErrCode == 0)
            {
                List<Staff> list = new List<Staff>();
                Staff obj;

                try
                {
                    DataTable table = new DataTable();
                    string query = " SELECT *,  CASE WHEN Stopwork = 1 THEN 'Working' WHEN Stopwork = 0 THEN 'Stopwork' ELSE 'Unknown' END AS Status FROM [dbo].[tblStaff]";

                    if (!string.IsNullOrEmpty(staffName))
                    {
                        query += " WHERE FullName = @FullName";
                        con._Cmd.Parameters.AddWithValue("@FullName", staffName);
                    }

                    con._Cmd.CommandText = query;
                    con._Cmd.Connection = con._Con;
                    con._Ad = new SqlDataAdapter(con._Cmd);
                    con._Ad.Fill(table);

                    foreach (DataRow row in table.Rows)
                    {
                        obj = new Staff();
                        obj.Id = Convert.ToInt32(row["Id"]);
                        obj.FullName = row["FullName"].ToString();
                        obj.Gender = row["Gender"].ToString();
                        obj.Position = row["Position"].ToString();
                        obj.Salary = Convert.ToDecimal(row["Salary"]);
                        obj.DateOfBirth = Convert.ToDateTime(row["DateOfBirth"]);
                        obj.DateOfBirthStr = FormateDate.ClientFormatDate(obj.DateOfBirth);
                        obj.Stopwork = Convert.ToInt32(row["Stopwork"]);
                        obj.Status = row["Status"].ToString();
                        list.Add(obj);
                    }

                    response.ErrCode = 0;
                    response.ErrMsg = "Success";
                    response.Staffs = list.ToList();
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }

            return Ok(response);
        }

        public IActionResult DeleteStaff(int staffId)
        {

            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {
                try
                {

                    con._Cmd = new SqlCommand("SP_DELETE_STAFF", con._Con);
                    con._Cmd.CommandType = CommandType.StoredProcedure;
                    con._Cmd.Parameters.AddWithValue("@StaffId", staffId);
                    con._Cmd.ExecuteNonQuery();
                    response.ErrCode = 0;
                    response.ErrMsg = "Staff Delete Successfully";
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

        public IActionResult UpdateStaff(Staff objStaff)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            StatusResponse response = new StatusResponse();
            if (con._ErrCode == 0)
            {

                try
                {
                    objStaff.DateOfBirth = (DateTime)FormateDate.ServerFormatDate(objStaff.DateOfBirthStr);
                    //prevent duplicate user
                    con._Cmd = new SqlCommand("SP_UPDATE_STAFF", con._Con);
                    con._Cmd.CommandType = CommandType.StoredProcedure;
                    con._Cmd.Parameters.AddWithValue("@StaffId", objStaff.Id);
                    con._Cmd.Parameters.AddWithValue("@FullName", objStaff.FullName);
                    con._Cmd.Parameters.AddWithValue("@DateOfBirth", objStaff.DateOfBirth);
                    con._Cmd.Parameters.AddWithValue("@Position", objStaff.Position);
                    con._Cmd.Parameters.AddWithValue("@Salary", objStaff.Salary);
                    con._Cmd.Parameters.AddWithValue("@Stopwork", objStaff.Stopwork);
                    con._Cmd.Parameters.AddWithValue("@Gender", objStaff.Gender);
                    con._Cmd.ExecuteNonQuery();

                    response.ErrCode = 0;
                    response.ErrMsg = "Staff update success.";
                }
                catch (Exception ex)
                {
                    response.ErrCode = ex.HResult;
                    response.ErrMsg = ex.Message;
                }
            }
            return Ok(response);
        }

        public IActionResult GetStaffById(int StaffId)
        {
            ClsSqlConnection con = new ClsSqlConnection();
            StaffResponse response = new StaffResponse();

            if (con._ErrCode == 0)
            {
                List<Staff> list = new List<Staff>();
                Staff obj;

                try
                {
                    DataTable table = new DataTable();
                    string query = " SELECT *,  CASE WHEN Stopwork = 1 THEN 'Working' WHEN Stopwork = 0 THEN 'Stopwork' ELSE 'Unknown' END AS Status FROM [dbo].[tblStaff] WHERE Id = @staffId";
                    con._Cmd.CommandText = query;
                    con._Cmd.Connection = con._Con;
                    con._Ad = new SqlDataAdapter(con._Cmd);
                    con._Ad.SelectCommand.Parameters.AddWithValue("@staffId", StaffId);
                    con._Ad.Fill(table);

                    foreach (DataRow row in table.Rows)
                    {
                        obj = new Staff();
                        obj.Id = Convert.ToInt32(row["Id"]);
                        obj.FullName = row["FullName"].ToString();
                        obj.Gender = row["Gender"].ToString();
                        obj.Position = row["Position"].ToString();
                        obj.Salary = Convert.ToDecimal(row["Salary"]);
                        obj.DateOfBirth = Convert.ToDateTime(row["DateOfBirth"]);
                        obj.DateOfBirthStr = FormateDate.ClientFormatDate(obj.DateOfBirth);
                        obj.Stopwork = Convert.ToInt32(row["Stopwork"]);
                        obj.Status = row["Status"].ToString();
                        list.Add(obj);
                    }

                    response.ErrCode = 0;
                    response.ErrMsg = "Success";
                    response.Staffs = list.ToList();
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
