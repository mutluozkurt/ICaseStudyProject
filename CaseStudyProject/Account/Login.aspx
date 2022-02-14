<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CaseStudyProject.Account.Login" Async="true" %>


<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<!doctype html>
<html lang="en">


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
       
       <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><span class="splash-description">Please enter your user information.</span></div>
            <div runat="server"  ID="ErrorMessage" Visible="false">
            <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                </div>
            <div class="card-body">
                <h3 class="mb-1">LOGIN</h3>
                <form>
                    <div class="form-group">
                     <asp:Label runat="server" AssociatedControlID="Email"  CssClass="col-md-2 control-label"></asp:Label>
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
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
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
                     <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                </form>
            </div>
            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink></div>
            
            </div>

            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                   <div><span>Username: poweruser@gmail.com</span></div>
                    <div><span> Password: Pp.123</span></div>
            </div>
                 </div>

            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                   <div><span>Username: user@gmail.com</span></div>
                   <div><span>Password: Uu.123</span></div>
            </div>
                 </div>

        </div>

        
      
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
 


        <script src="../Content/assets/vendor/jquery/jquery-3.3.1.min.js"></script>

        <script src="../Content/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    </form>
</body>
</html>
