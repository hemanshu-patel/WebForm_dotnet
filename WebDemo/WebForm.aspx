<%-- Styles using bootstrap --%>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebForm.aspx.cs" Inherits="WebForm" ValidateRequest="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web Form</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function clearForm() {
            document.getElementById("firstName").value = "";
            document.getElementById("middleName").value = "";
            document.getElementById("lastName").value = "";
            document.getElementById("DOB").value = "";
            document.getElementById("gender").selectedIndex = "";
            document.getElementById("phoneNumber").value = "";
        }
    </script>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">User Information Form</h2>
    <form id="form2" runat="server">
        <div class="form-group">
            <label for="firstName" class="col-form-label">First Name:</label>
            <asp:TextBox ID="firstName" runat="server" class="form-control" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="middleName" class="col-form-label">Middle Name:</label>
            <asp:TextBox ID="middleName" runat="server" class="form-control" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="lastName" class="col-form-label">Last Name:</label>
            <asp:TextBox ID="lastName" runat="server" class="form-control" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="DOB" class="col-form-label">Date Of Birth:</label>
            <asp:TextBox ID="DOB" runat="server" TextMode="Date" class="form-control" required="required"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="gender" class="col-form-label">Gender:</label>
            <asp:DropDownList runat="server" ID="gender" class="form-control">
                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="phoneNumber" class="col-form-label">Phone Number:</label>
            <asp:TextBox ID="phoneNumber" runat="server" MaxLength="10" class="form-control" required="required" 
                         onkeydown="return ((event.keyCode>=48 && event.keyCode<=57) || event.keyCode==8) && event.keyCode!=32;"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                            ControlToValidate="phoneNumber"
                                            ErrorMessage="Not a valid format"
                                            ForeColor="Red"
                                            ValidationExpression="^[6-9]\d{9}$" 
                                            ValidationGroup="NumericValidate">
            </asp:RegularExpressionValidator>
        </div>

        <div class="form-group text-center">
            <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" class="btn btn-success btn-lg" Text="Save" />
            <asp:Button ID="clearButton" runat="server" Text="Clear" OnClientClick="clearForm(); return false;" 
                        class="btn btn-danger btn-lg mx-2" />
        </div>

        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Grid View" class="h4 mb-3"></asp:Label>
            <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="True" class="table table-bordered table-striped" />
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
