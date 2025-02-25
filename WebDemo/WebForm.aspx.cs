using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text.RegularExpressions;

public partial class WebForm : System.Web.UI.Page
{
    long pNumber;
    DateTime dob;
    string fName, mName, lName;
    string connectionString = "Data Source=HEMANSHU\\SQLEXPRESS;Initial Catalog =WebForm; User ID = sa; Password=Miscot;TrustServerCertificate=True;Trusted_Connection=Yes";   // Update this with your actual DB connection string

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            LoadDataGrid();
        }
    }

    protected void submitButton_Click(object sender, EventArgs e)
    {
        fName = firstName.Text;
        mName = middleName.Text;
        lName = lastName.Text;

        DateTime dob;
        if (DateTime.TryParse(DOB.Text, out dob))
        {
            if (dob > DateTime.Now)
            {
                Response.Write("<script>alert('DOB should be before today')</script>");
                return;  // Exit the function if DOB is in the future
            }
        }
        else
        {
            Response.Write("<script>alert('Invalid DOB format')</script>");
            return;  // Exit the function if the DOB is not valid
        }

        string gen = gender.SelectedItem.Value;

        try
        {
            pNumber = Convert.ToInt64(phoneNumber.Text);
            string regEx = "^[6-9]\\d{9}$";  // Regex for validating phone number
            Regex reg = new Regex(regEx);
            string regString = Convert.ToString(pNumber);

            if (!reg.IsMatch(regString))
            {
                Response.Write("<script>alert('Phone number should start with 6-9 and contain 10 digits')</script>");
            }
            else
            {
                dob.ToString();
                string strNumber = pNumber.ToString();
                // Proceed with adding user info
                AddUserInfoToDatabase(fName, mName, lName, dob, gen, strNumber);
            }
        }
        catch
        {
            Response.Write("<script>alert('Invalid input, please enter numeric values for the phone number')</script>");
        }
    }

    protected void addInfo()
    {
        Response.Write("");
    }

    protected void LoadDataGrid()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM UserInfo";
            //SqlCommand cmd = new SqlCommand(query);
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            UserGrid.DataSource = dt;
            UserGrid.DataBind();
        }
    }
    protected void AddUserInfoToDatabase(string fName, string mName, string lName, DateTime dob, string gen, string phone)
    {
        string query = "INSERT INTO UserInfo (FirstName, MiddleName, LastName, DOB, Gender, PhoneNumber) " +
                       "VALUES ('" + fName + "', '" + mName + "', '" + lName + "', '" + dob + "', '" + gen + "', '" + pNumber + "')";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            ConnectionState state = con.State;

            if (state == ConnectionState.Open)
            {
                SqlCommand cmd = new SqlCommand(query, con);
                try
                {
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Response.Write("<script>alert('Data inserted successfully')</script>");
                        LoadDataGrid();  // Refresh the data grid after insertion
                    }
                    else
                    {
                        Response.Write("<script>alert('Data insertion failed')</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}')</script>");
                }
            }

        }

    }
}




//public partial class WebForm : System.Web.UI.Page
//{
//    long pNumber;
//    DateTime dob;
//    string fName, mName, lName;
//    string connectionString = "Data Source=HEMANSHU\\SQLEXPRESS;Initial Catalog =WebForm; User ID = sa; Password=Miscot;TrustServerCertificate=True;Trusted_Connection=Yes";   // Update this with your actual DB connection string

//    protected void Page_Load(object sender, EventArgs e)
//    {
//        if (IsPostBack)
//        {
//            LoadDataGrid();
//        }
//    }

//    protected void submitButton_Click(object sender, EventArgs e)
//    {
//        fName = firstName.Text;
//        mName = middleName.Text;
//        lName = lastName.Text;

//        dob = Convert.ToDateTime(DOB.Text);
//        if (dob > DateTime.Now)
//        {
//            Response.Write("<script>alert('DOB should be greater than today')</script>");
//        }

//        string gen = gender.SelectedItem.Value;

//        try
//        {
//            pNumber = Convert.ToInt64(phoneNumber.Text);
//            //string regEx = "^[6-9]" + "'\'" + "d{9}$";
//            string regEx = "^[6-9]\\d{9}$";
//            Regex reg = new Regex(regEx);
//            string regString = Convert.ToString(pNumber);
//            if (!reg.IsMatch(regString))
//            {
//                //Response.Write(reg.IsMatch(regString));
//                Response.Write("<script>alert('Indian Phone number starts from 6')</script>");
//            }
//            else
//            {
//                addInfo();
//            }
//        }
//        catch
//        {
//            Response.Write("<script>alert('Invalid Phone format')</script>");
//        }

//        //open Database Connection and execute query
//        using (SqlConnection con = new SqlConnection(connectionString))
//        {
//            con.Open();
//            ConnectionState state = con.State;

//            if (state == ConnectionState.Open)
//            {
//                string query = "INSERT INTO UserInfo (FirstName, MiddleName, LastName, DOB, Gender, PhoneNumber) " +
//                          "VALUES ('" + fName + "', '" + mName + "', '" + lName + "', '" + dob + "', '" + gen + "', '" + pNumber + "')";
//                //"VALUES (@FirstName, @MiddleName, @LastName, @DOB, @Gender, @PhoneNumber)";
//                SqlCommand cmd = new SqlCommand(query, con);

//                try
//                {
//                    int cnt = cmd.ExecuteNonQuery();
//                    if (cnt > 0)
//                    {
//                        Response.Write("<script>alert('Data inserted successfully')</script>");
//                    }
//                }
//                catch
//                {
//                    Response.Write("<script>alert('Data insertion failed due to invalid format')</script>");
//                }
//            }
//            else
//            {
//                Response.Write("Error");
//            }
//            //con.Close();
//        }
//        LoadDataGrid();
//    }

//    protected void addInfo()
//    {
//        Response.Write("");
//    }

//    protected void LoadDataGrid()
//    {
//        using (SqlConnection conn = new SqlConnection(connectionString))
//        {
//            string query = "SELECT * FROM UserInfo";
//            //SqlCommand cmd = new SqlCommand(query);
//            SqlDataAdapter da = new SqlDataAdapter(query, conn);
//            DataTable dt = new DataTable();
//            da.Fill(dt);
//            UserGrid.DataSource = dt;
//            UserGrid.DataBind();
//        }
//    }
//}

