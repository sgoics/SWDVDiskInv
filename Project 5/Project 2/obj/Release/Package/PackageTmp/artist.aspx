<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="artist.aspx.cs" Inherits="Project_2.artist1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<title>Disk Hut</title>
    <style>
        #date {
            width: 284px;
            height: 25px;
            background: #ccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<main>
        
       <div>
        <h1 style = "color: rgb(19, 194, 218)">Artist Information</h1>
        <!-- form to receive and store user entry -->
            <form id="artist_form" runat="server">
            <asp:ValidationSummary ID="ValidationSummary1" Validationgroup="input" runat="server" HeaderText="* means that this field is required" CssClass="text-danger"></asp:ValidationSummary>
        <br />
            <label for="artistFname">Artist First Name:</label>
            <asp:TextBox ID="artistFname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Validationgroup="input" runat="server" ControlToValidate="artistFname" CssClass="text-danger">*If no first name, type "NA".</asp:RequiredFieldValidator>
        <br />
            <label for="artistLname">Artist Last Name:</label>
            <asp:TextBox ID="artistLname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Validationgroup="input" runat="server" ControlToValidate="artistLname" CssClass="text-danger">*If no last name, type "NA".</asp:RequiredFieldValidator>
       <br />
            <label for="groupName">Artist Group Name:</label>
           <asp:TextBox ID="groupName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Validationgroup="input" runat="server" ControlToValidate="groupName" CssClass="text-danger">*If no group name, type "NA".</asp:RequiredFieldValidator>
        <label>&nbsp;</label>
				<br/>
        <asp:Button id="submitButton" Text="Add" runat="server" ValidationGroup="input" OnClick="submitButton_Click"/>
        <asp:Button id="resetButton" Text="Reset" runat="server" OnClick="resetButton_Click" CausesValidation="false"/>
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
    </main>
		<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="artist_ID" DataSourceID="SqlDataSource1" Height="299px" HorizontalAlign="Center" Width="847px" AllowPaging="True">
			<PagerStyle HorizontalAlign="Center" />
			<Columns>
				<asp:BoundField DataField="artist_ID" HeaderText="Artist ID" ReadOnly="True" SortExpression="artist_ID" InsertVisible="False" />
				<asp:TemplateField HeaderText="First Name" SortExpression="artistfName">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("artistfName") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" ErrorMessage="Please enter a valid name." ControlToValidate="TextBox1" ValidationGroup="input"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("artistfName") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Last Name" SortExpression="artistlName">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("artistlName") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Text="*" ErrorMessage="Please enter a valid name." ControlToValidate="TextBox2" ValidationGroup="input"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label2" runat="server" Text='<%# Bind("artistlName") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField HeaderText="Group Name" SortExpression="groupName">
					<EditItemTemplate>
						<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("groupName") %>'></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Text="*" ErrorMessage="Please enter a valid name." ControlToValidate="TextBox3" ValidationGroup="input"></asp:RequiredFieldValidator>
					</EditItemTemplate>
					<ItemTemplate>
						<asp:Label ID="Label3" runat="server" Text='<%# Bind("groupName") %>'></asp:Label>
					</ItemTemplate>
				</asp:TemplateField>
				<asp:CommandField ShowEditButton="True" />
				<asp:CommandField ShowDeleteButton="True" />
			</Columns>
			<SelectedRowStyle BackColor="#13C2DA" />
		</asp:GridView>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" DeleteCommand="DELETE FROM [Artist] WHERE [artist_ID] = @artist_ID" InsertCommand="INSERT INTO [Artist] ([artistfName], [artistlName], [groupName]) VALUES (@artistfName, @artistlName, @groupName)" SelectCommand="SELECT [artist_ID], [artistfName], [artistlName], [groupName] FROM [Artist]" UpdateCommand="UPDATE [Artist] SET [artistfName] = @artistfName, [artistlName] = @artistlName, [groupName] = @groupName WHERE [artist_ID] = @artist_ID">
			<DeleteParameters>
				<asp:Parameter Name="artist_ID" Type="Int32" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="artistfName" Type="String" />
				<asp:Parameter Name="artistlName" Type="String" />
				<asp:Parameter Name="groupName" Type="String" />
			</InsertParameters>
			<UpdateParameters>
				<asp:Parameter Name="artistfName" Type="String" />
				<asp:Parameter Name="artistlName" Type="String" />
				<asp:Parameter Name="groupName" Type="String" />
				<asp:Parameter Name="artist_ID" Type="Int32" />
			</UpdateParameters>

		</asp:SqlDataSource>
	</form>
</asp:Content>
