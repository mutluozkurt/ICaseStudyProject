<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="LoadData.aspx.cs" Inherits="CaseStudyProject.LoadData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body" runat="server">
        <asp:FileUpload type="file"  class="btn btn-outline-primary" ID="FileUpload1" runat="server" />

    <asp:Button type="button" class="btn btn-sm btn-outline-secondary" ID="btnImport" runat="server" Text="Import Data" OnClick="btnImport_Click" />


    
    <div>
        <br />
        <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>
        <br />
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Script" runat="server">
</asp:Content>
