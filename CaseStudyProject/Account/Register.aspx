<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CaseStudyProject.Account.Register" %>

<!DOCTYPE html>
<html lang="en"

<head runat="server">
       <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
<link href="../Content/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="../Content/assets/vendor/fonts/circular-std/style.css" rel="stylesheet" />
<link href="../Content/assets/libs/css/style.css" rel="stylesheet" />
<link href="../Content/assets/vendor/fonts/fontawesome/css/fontawesome-all.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
      
      

    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><span class="splash-description">Please enter your user information.</span></div>
       
            <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
             
            <div class="card-body">
                 <h3 class="mb-1">Registrations Form</h3>
                <form>
                    <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" placeholder="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                         
                    </div>
                    <div class="form-group">
    <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" placeholder="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>

                         <div class="form-group">
   <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" placeholder="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
            </div>

                    </div>
                    <div class="form-group">
                          <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                           <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
            </div>
                </form>
            </div>
            
        </div>

        
      <div class="card-footer bg-white">
                <p>Already member? <a href="/Account/Login" class="text-secondary">Login Here.</a></p>
            </div>
    </div>
        
  




    </form>
</body>
</html>
