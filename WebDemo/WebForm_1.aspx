<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebForm_1.aspx.cs" Inherits="WebForm_1" ValidateRequest="true" %>

<!DOCTYPE html>
<html>
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
    <style>
        .firstName {
            border-bottom-left-radius: 40px;
            /*            margin-left:2rem;
            padding-left:2em;*/
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">User Information Form</h2>
        <form id="form1" runat="server">
            <div class="form-group">
                <asp:Label runat="server" class="col-form-label" Text="First Name:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="firstName" CssClass="Padding-left:40px" runat="server" Width="50%" required="required"></asp:TextBox>
                <br />
            </div>
            <div class="form-group">
                <asp:Label runat="server" class="col-form-label" Text="Middle Name:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="middleName" runat="server" Width="50%" required="required"></asp:TextBox>
                <br />
            </div>
            <div class="form-group">
                <asp:Label runat="server" class="col-form-label" Text="Last Name:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="lastName" runat="server" Width="50%" required="required"></asp:TextBox>
                <br />
            </div>
            <div class="form-group">
                <asp:Label runat="server" class="col-form-label" Text="Date Of Birth:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox Id="DOB" runat="server" TextMode="Date" Width="50%" type="datetime-local" required="required"></asp:TextBox>
                <asp:Calendar ID="calendar" runat="server" Visible="false"></asp:Calendar>
            </div>
            <div class="form-group">
                <asp:Label runat="server" class="col-form-label" Text="Gender:">
                    <asp:DropDownList Style="margin-left: 4.7rem" Width="50%" runat="server" ID="gender">
                        <asp:ListItem Text="Select" Value=""></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:DropDownList>
                </asp:Label>
            </div>
            <div>
                <asp:Label runat="server" class="col-form-label" Text="Phone Number:"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <%--<asp:TextBox ID="phoneNumber" runat="server" MaxLength="10" onkeydown="return (!(event.keyCode>=65 && event.keyCode<=122) && event.keyCode!=32);"></asp:TextBox>--%>
                <%-- Not able to type alphabets --%>
                <%--<asp:TextBox ID="phoneNumber" runat="server" width="50%" MaxLength="10" required="required" 
                    onkeydown="return ((event.keyCode>=48 && event.keyCode<=57) || event.keyCode==8) && event.keyCode!=32;"></asp:TextBox>--%>
                <%-- Able to type alphabets --%>
                <asp:TextBox ID="phoneNumber" runat="server" Width="50%" MaxLength="10" required="required"
                    onkeydown="return ((event.keyCode>=48 && event.keyCode<=57) || event.keyCode!=32;) && event.keyCode==8"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server"
                    ControlToValidate="phoneNumber"
                    ErrorMessage="Not a Valid Format"
                    ForeColor="Red"
                    ValidationExpression="^[6-9]\d{9}$" ValidationGroup="NumericValidate">
                </asp:RegularExpressionValidator>
            </div>
            <br />
            <div class="form-group text-center">
                <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" class="btn btn-success btn-lg"
                    BackColor="#33CC33" ForeColor="Black" Height="50px" Width="100px" Text="Save" />
                <asp:Button ID="clearButton" runat="server" Text="Clear" OnClientClick="clearForm(); return false;" class="btn btn-danger btn-lg mx-2"
                    BackColor="Red" ForeColor="White" Height="50px" Width="100px" />
            </div>
            <br />
            <asp:Label ID="Label2" runat="server" class="h4 mb-3" Text="Grid View"></asp:Label>
            <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="True" class="table table-bordered table-striped" />
        </form>

    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
