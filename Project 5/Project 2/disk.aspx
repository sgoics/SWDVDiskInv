<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="disk.aspx.cs" Inherits="Project_2.disk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Disk Hut</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<main>
            <h1 style = "color: rgb(19, 194, 218)">Disk Information</h1>
            <!-- form to receive and store user entry -->
            <form id="disk_form" runat="server">
            <asp:ValidationSummary ID="ValidationSummary1" Validationgroup="input" runat="server" HeaderText="* means that this field is required" CssClass="text-danger"></asp:ValidationSummary>
                <label for="disk_name">Disk Name:</label>
               <asp:TextBox ID="disk_name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Validationgroup="input" runat="server" ControlToValidate="disk_name" CssClass="text-danger">*</asp:RequiredFieldValidator>
            <br />
            <label for="release_date">Release Date:</label>
            <%--<asp:Calendar ID="Calendar1" runat="server" SelectionMode="DayWeekMonth"></asp:Calendar>--%>
			<asp:TextBox ID="release_date" runat="server" TextMode="Date"></asp:TextBox>				
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  Validationgroup="input" runat="server" Operator="DataTypeCheck" ControlToValidate="release_date" CssClass="text-danger">*</asp:RequiredFieldValidator>
            	<br />

				<label for="status_ID">Status ID:</label>
				<asp:DropDownList ID="status_ID" runat="server" DataSourceID="SqlDataSource2" DataTextField="status_ID" DataValueField="status_ID">
				</asp:DropDownList>
				<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT [status_ID] FROM [Disk]"></asp:SqlDataSource>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" Validationgroup="input" runat="server" ControlToValidate="status_ID" CssClass="text-danger">*</asp:RequiredFieldValidator>
				<br />
			<label for="genre_ID">Genre ID:</label>
				<asp:DropDownList ID="genre_ID" runat="server" DataSourceID="SqlDataSource3" DataTextField="genre_ID" DataValueField="genre_ID">
				</asp:DropDownList>
				<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT [genre_ID] FROM [Disk]"></asp:SqlDataSource>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" Validationgroup="input" runat="server" ControlToValidate="genre_ID" CssClass="text-danger">*</asp:RequiredFieldValidator>
				<br />
			<label for="disk_type_ID">Disk Type ID:</label>
				<asp:DropDownList ID="disk_type_ID" runat="server" DataSourceID="SqlDataSource4" DataTextField="disk_type_ID" DataValueField="disk_type_ID">
				</asp:DropDownList>
				<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT [disk_type_ID] FROM [Disk]"></asp:SqlDataSource>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator5" Validationgroup="input" runat="server" ControlToValidate="disk_type_ID" CssClass="text-danger">*</asp:RequiredFieldValidator>
            <br />
            <label>&nbsp;</label>
        <asp:Button id="submitButton" Text="Submit" ValidationGroup="input" runat="server" OnClick="submitButton_Click"/>
        <asp:Button id="resetButton" Text="Reset" runat="server"  CausesValidation="false"/>
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>
        		<br />
				<div style="margin-left: auto; margin-right: auto; text-align: center;">
					<label for="inventory">Disk Inventory:</label>
					</div>
        		<br />
				<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"  HorizontalAlign="Center" AllowPaging="True" AutoGenerateColumns="False" Width="662px" Height="10px" DataKeyNames="disk_ID">
					<PagerStyle HorizontalAlign="Center" />
					<Columns>
						<asp:BoundField DataField="disk_ID" HeaderText="disk_ID" InsertVisible="False" ReadOnly="True" SortExpression="disk_ID" />
						<asp:BoundField DataField="release_date" HeaderText="release_date" SortExpression="release_date" />
						<asp:BoundField DataField="status_ID" HeaderText="status_ID" SortExpression="status_ID" />
						<asp:BoundField DataField="genre_ID" HeaderText="genre_ID" SortExpression="genre_ID" />
						<asp:BoundField DataField="disk_type_ID" HeaderText="disk_type_ID" SortExpression="disk_type_ID" />
						<asp:BoundField DataField="disk_name" HeaderText="disk_name" SortExpression="disk_name" />
						<asp:CommandField ShowDeleteButton="True" />
					</Columns>
				</asp:GridView>
				<br />
				<div style="margin-left: auto; margin-right: auto; text-align: center;">
				<label for="on_loan">On Loan: </label>
					</div>
				<div style="margin-left: auto; margin-right: auto; text-align: center;">
						<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" DataSourceID="SqlDataSource5" ValidationGroup="edit" Width="662px" Height="10px" AllowPaging="True" DataKeyNames="checkout_ID">
							<PagerStyle HorizontalAlign="Center" />
							<Columns>
								<asp:BoundField DataField="checkout_ID" HeaderText="checkout_ID" SortExpression="checkout_ID" InsertVisible="False" ReadOnly="True" />
								<asp:TemplateField HeaderText="disk_name" SortExpression="disk_name">
									<EditItemTemplate>
										<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("disk_name") %>'></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" ErrorMessage="Please enter disk name." ControlToValidate="TextBox2" ValidationGroup="edit"></asp:RequiredFieldValidator>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# Bind("disk_name") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="borrow_date" SortExpression="borrow_date">
									<EditItemTemplate>
										<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("borrow_date") %>'></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Text="*" ErrorMessage="Must be a valid date." ControlToValidate="TextBox2" ValidationGroup="edit"></asp:RequiredFieldValidator>
								<asp:CompareValidator ID="CompareValidator1" runat="server" Type="Date" Display="Dynamic" Operator="DataTypeCheck" ControlToValidate="TextBox2" ValidationGroup="edit" ErrorMessage="Must be a valid date."></asp:CompareValidator>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label2" runat="server" Text='<%# Bind("borrow_date") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="borrowerfName" SortExpression="borrowerfName">
									<EditItemTemplate>
										<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("borrowerfName") %>'></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" ErrorMessage="Please enter first name." ControlToValidate="TextBox3" ValidationGroup="edit"></asp:RequiredFieldValidator>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label3" runat="server" Text='<%# Bind("borrowerfName") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="borrowerlName" SortExpression="borrowerlName">
									<EditItemTemplate>
										<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("borrowerlName") %>'></asp:TextBox>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="*" ErrorMessage="Please enter last name." ControlToValidate="TextBox4" ValidationGroup="edit"></asp:RequiredFieldValidator>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label4" runat="server" Text='<%# Bind("borrowerlName") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:CommandField ShowDeleteButton="True" />
							</Columns>
						</asp:GridView>
					<br />
					<label for="disk_borrow">Disk:</label>	
					<asp:DropDownList ID="txtdiskName" runat="server" DataSourceID="SqlDataSource6" DataTextField="disk_name" DataValueField="disk_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
					</asp:DropDownList>
					<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" SelectCommand="SELECT [disk_ID], [disk_name] FROM [Disk]
WHERE [disk_ID]
 NOT IN (
SELECT [Disk].[disk_ID]
FROM [Disk]
JOIN [checkout_sheet]
ON [Disk].[disk_ID] =  [checkout_sheet].[disk_ID]
WHERE [checkout_sheet].[return_date] IS NULL
)"></asp:SqlDataSource>
					<label for="disk_borrower">Borrower:</label>
					<asp:DropDownList ID="borrower_ID" runat="server" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="borrower_ID">
					</asp:DropDownList>
					<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" SelectCommand="SELECT [borrower_ID], [borrowerfName] + ' ' + [borrowerlName] AS Name FROM [borrower]"></asp:SqlDataSource>
					<label for="date_borrowed">Borrowered Date:</label>
					<asp:TextBox ID="borrow_date" TextMode="Date" runat="server"></asp:TextBox>
					<asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
					</div>
					<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" SelectCommand="SELECT [checkout_ID], [Disk].[disk_name], [checkout_sheet].[borrow_date], [borrower].[borrowerfName], [borrower].[borrowerlName]
FROM [checkout_sheet]
JOIN [borrower] 
ON [checkout_sheet].[borrower_ID] = [borrower].[borrower_ID]
JOIN [Disk]
ON [checkout_sheet].[disk_ID] = [Disk].[disk_ID]
WHERE [return_date]  IS NULL" DeleteCommand="DELETE FROM checkout_sheet WHERE checkout_ID = @checkout_ID">
						<DeleteParameters>
							<asp:Parameter Name="checkout_ID" />
						</DeleteParameters>
				</asp:SqlDataSource>
				<br />				
				<asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Please correct the following errors;" ValidationGroup="edit" CssClass="text-danger"/>
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" InsertCommand="INSERT INTO [Disk] ([release_date], [status_ID], [genre_ID], [disk_type_ID], [disk_name]) VALUES (@release_date, @status_ID, @genre_ID, @disk_type_ID, @disk_name)" SelectCommand="SELECT [disk_ID], [release_date], [status_ID], [genre_ID], [disk_type_ID], [disk_name] 
FROM [Disk]
WHERE [disk_ID]
 NOT IN (
SELECT [Disk].[disk_ID]
FROM [Disk]
JOIN [checkout_sheet]
ON [Disk].[disk_ID] =  [checkout_sheet].[disk_ID]
WHERE [checkout_sheet].[return_date] IS NULL
)" UpdateCommand="UPDATE [Disk] SET [release_date] = @release_date, [status_ID] = @status_ID, [genre_ID] = @genre_ID, [disk_type_ID] = @disk_type_ID, [disk_name] = @disk_name WHERE [disk_ID] = @disk_ID" DeleteCommand="DELETE FROM [checkout_sheet] WHERE [checkout_sheet].[disk_ID] = @disk_ID
delete from [Disk] where [Disk].[disk_ID] = @disk_ID">
					<DeleteParameters>
						<asp:Parameter Name="disk_ID" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Name="release_date" DbType="String" />
						<asp:Parameter Name="status_ID" Type="Int32" />
						<asp:Parameter Name="genre_ID" Type="Int32" />
						<asp:Parameter Name="disk_type_ID" Type="Int32" />
						<asp:Parameter Name="disk_name" Type="String" />
					</InsertParameters>
					<UpdateParameters>
						<asp:Parameter Name="release_date" DbType="String" />
						<asp:Parameter Name="status_ID" Type="Int32" />
						<asp:Parameter Name="genre_ID" Type="Int32" />
						<asp:Parameter Name="disk_type_ID" Type="Int32" />
						<asp:Parameter Name="disk_name" Type="String" />
						<asp:Parameter Name="disk_ID" Type="Int32" />
					</UpdateParameters>
				</asp:SqlDataSource>
				<br />
        </form>
        </main>
     </asp:Content>

  
