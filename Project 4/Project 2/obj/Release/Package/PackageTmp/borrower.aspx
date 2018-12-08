<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="borrower.aspx.cs" Inherits="Project_2.borrower" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Disk Hut</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       
	<main>
    <h1 style = "color:rgb(19, 194, 218)">Please enter your information below.</h1>
    <!-- <form action="contact_thanks.html" method="get"
        name="registration_form" id="registration_form"> -->
    <form id="artist_form" runat="server">
    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="edit" runat="server" HeaderText="* means that this field is required" CssClass="text-danger"></asp:ValidationSummary>
        <br />
        <label for="firstName">First Name:</label>
       <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="edit" runat="server" ControlToValidate="firstName" CssClass="text-danger">*</asp:RequiredFieldValidator>
        <br />
        <label for="lastName">Last Name:</label>
        <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="edit" runat="server" ControlToValidate="lastName" CssClass="text-danger">*</asp:RequiredFieldValidator>
        <br />
        <label for="phone">Phone Number:</label>
        <asp:TextBox ID="phone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="edit" runat="server" 
        ControlToValidate="phone" CssClass="text-danger">*</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  CssClass="text-danger" ControlToValidate="phone" ValidationExpression="^([0-9\(\)\/\+ \-]*)$">Use this format: 9999999999</asp:RegularExpressionValidator>
         <br />    
        <asp:Button id="submitButton" Text="Submit" runat="server" ValidationGroup="edit" OnClick="submitButton_Click"/>
        <asp:Button id="resetButton" Text="Reset" runat="server" OnClick="resetButton_Click" CausesValidation="false"/>
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
        <br />
		<br />
		<br />
		<br />
		<br />
		<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" HorizontalAlign="Center" AllowPaging="True" ValidationGroup="edit" AutoGenerateColumns="False"  DataKeyNames="borrower_ID" Width="662px">
			<PagerStyle HorizontalAlign="Center" />
			<Columns>
				<asp:BoundField DataField="borrower_ID" HeaderText="borrower_ID" InsertVisible="False" ReadOnly="True" SortExpression="borrower_ID" />
				<asp:TemplateField HeaderText="borrowerfName" SortExpression="borrowerfName">
					<EditItemTemplate>
						<asp:TextBox ID="borrowerfName" runat="server" Text='<%# Bind("borrowerfName") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" ErrorMessage="Please enter first name." ControlToValidate="borrowerfName" ValidationGroup="edit"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("borrowerfName") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="borrowerlName" SortExpression="borrowerlName">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("borrowerlName") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*" ErrorMessage="Please enter last name." ControlToValidate="TextBox2" ValidationGroup="edit"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("borrowerlName") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="borrower_phone_number" SortExpression="borrower_phone_number">
					<EditItemTemplate>
						<asp:TextBox ID="phone" runat="server" Text='<%# Bind("borrower_phone_number") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="edit" runat="server" 
						ControlToValidate="phone" CssClass="text-danger">*</asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  CssClass="text-danger" ControlToValidate="phone" ValidationExpression="^([0-9\(\)\/\+ \-]*)$">Use this format: 9999999999</asp:RegularExpressionValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Bind("borrower_phone_number") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:CommandField ShowEditButton="True" />
				<asp:CommandField ShowDeleteButton="True" />
			</Columns>
		</asp:GridView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" 
			DeleteCommand="DELETE FROM checkout_sheet WHERE checkout_sheet.borrower_ID = @borrower_ID
DELETE FROM borrower WHERE borrower_ID = @borrower_ID" 
			InsertCommand="INSERT INTO [borrower] ([borrowerfName], [borrowerlName], [borrower_phone_number]) 
			VALUES (@borrowerfName, @borrowerlName, @borrower_phone_number)" 
			SelectCommand="SELECT [borrower].[borrower_ID], [borrower].[borrowerfName], [borrower].[borrowerlName], [borrower].[borrower_phone_number]
FROM [borrower]
" 
			UpdateCommand="UPDATE [borrower] SET [borrowerfName] = @borrowerfName, [borrowerlName] = @borrowerlName, [borrower_phone_number] = @borrower_phone_number WHERE [borrower_ID] = @borrower_ID">
			<DeleteParameters>
				<asp:Parameter Name="borrower_ID" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="borrowerfName" Type="String" />
				<asp:Parameter Name="borrowerlName" Type="String" />
				<asp:Parameter Name="borrower_phone_number" Type="String" />
			</InsertParameters>
			<UpdateParameters>
				<asp:Parameter Name="borrowerfName" Type="String" />
				<asp:Parameter Name="borrowerlName" Type="String" />
				<asp:Parameter Name="borrower_phone_number" Type="String" />
				<asp:Parameter Name="borrower_ID" Type="Int32" />
			</UpdateParameters>
		</asp:SqlDataSource>
        </form>
</main>
</asp:Content>