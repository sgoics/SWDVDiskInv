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
				<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"  HorizontalAlign="Center" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="disk_ID" Width="662px" Height="10px">
					<PagerStyle HorizontalAlign="Center" />
					<Columns>
						<asp:BoundField DataField="disk_ID" HeaderText="Disk ID" InsertVisible="False" ReadOnly="True" SortExpression="disk_ID" />
						<asp:TemplateField HeaderText="Release Date" SortExpression="release_date">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("release_date") %>'></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Text="*" ErrorMessage="Must be a valid date." ControlToValidate="TextBox1" ValidationGroup="edit"></asp:RequiredFieldValidator>
								<asp:CompareValidator ID="CompareValidator1" runat="server" Type="Date" Display="Dynamic" Operator="DataTypeCheck" ControlToValidate="TextBox1" ValidationGroup="edit" ErrorMessage="Must be a valid date."></asp:CompareValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Bind("release_date") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Status ID" SortExpression="status_ID">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("status_ID") %>'></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Text="*" ErrorMessage="Must be a 1 for IN, 2 for OUT." ControlToValidate="TextBox2" ValidationGroup="edit"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox2" ValidationGroup="edit" ValidationExpression="^[1-2]{1}$" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Bind("status_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Genre ID" SortExpression="genre_ID">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("genre_ID") %>'></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Text="*" ErrorMessage="Must be a number between 1 and 4." ControlToValidate="TextBox3" ValidationGroup="edit"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="TextBox3" ValidationGroup="edit" ValidationExpression="^[1-4]{1}$" ErrorMessage="Must be a number between 1 and 4."></asp:RegularExpressionValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Bind("genre_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Disk Type ID" SortExpression="disk_type_ID">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("disk_type_ID") %>'></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Text="*" ErrorMessage="Must enter a 1 or a 2." ControlToValidate="TextBox4" ValidationGroup="edit"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ControlToValidate="TextBox4" ValidationGroup="edit" ValidationExpression="^[1-2]{1}$" ErrorMessage="Must enter a 1 or a 2."></asp:RegularExpressionValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label4" runat="server" Text='<%# Bind("disk_type_ID") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Disk Name" SortExpression="disk_name">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("disk_name") %>'></asp:TextBox>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" Text="*" ErrorMessage="Disk name is required." ControlToValidate="TextBox5" ValidationGroup="edit"></asp:RequiredFieldValidator>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label5" runat="server" Text='<%# Bind("disk_name") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:CommandField ShowEditButton="True" />
						<asp:CommandField ShowDeleteButton="True" />
					</Columns>
				</asp:GridView>
				<br />
				<div style="margin-left: auto; margin-right: auto; text-align: center;">
				<label for="on_loan">On Loan: </label>
					</div>
				<div style="margin-left: auto; margin-right: auto; text-align: center;">
						<asp:GridView ID="GridView2" runat="server" OnRowUpdating="GridView2_RowUpdating" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="borrow_date" DataSourceID="SqlDataSource5" Width="662px" Height="10px" AllowPaging="True">
							<PagerStyle HorizontalAlign="Center" />
							<Columns>
								<asp:BoundField DataField="borrower_ID" HeaderText="borrower_ID" SortExpression="borrower_ID" />
								<asp:TemplateField HeaderText="disk_name" SortExpression="disk_name">
									<EditItemTemplate>
										<asp:TextBox ID="txtdisc_name" runat="server" Text='<%# Bind("disk_name") %>'></asp:TextBox>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label1" runat="server" Text='<%# Bind("disk_name") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="borrow_date" SortExpression="borrow_date">
									<EditItemTemplate>
										<asp:TextBox ID="txtborrow_date" runat="server" Text='<%# Bind("borrow_date") %>'></asp:TextBox>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label2" runat="server" Text='<%# Bind("borrow_date") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="borrowerfName" SortExpression="borrowerfName">
									<EditItemTemplate>
										<asp:TextBox ID="txtborrowerfName" runat="server" Text='<%# Bind("borrowerfName") %>'></asp:TextBox>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label3" runat="server" Text='<%# Bind("borrowerfName") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="borrowerlName" SortExpression="borrowerlName">
									<EditItemTemplate>
										<asp:TextBox ID="txtborrowerlName" runat="server" Text='<%# Bind("borrowerlName") %>'></asp:TextBox>
									</EditItemTemplate>
									<ItemTemplate>
										<asp:Label ID="Label4" runat="server" Text='<%# Bind("borrowerlName") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:CommandField ShowEditButton="True" />
								<asp:CommandField ShowDeleteButton="True" />
							</Columns>
						</asp:GridView>
					<br />
					<label for="disk_borrow">Disk:</label>	
					<asp:DropDownList ID="txtdiskName" runat="server" DataSourceID="SqlDataSource6" DataTextField="disk_name" DataValueField="disk_ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
					</asp:DropDownList>
					<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" SelectCommand="SELECT [disk_ID], [disk_name] FROM [Disk]"></asp:SqlDataSource>
					<label for="disk_borrower">Borrower:</label>
					<asp:DropDownList ID="borrower_ID" runat="server" DataSourceID="SqlDataSource7" DataTextField="Name" DataValueField="borrower_ID">
					</asp:DropDownList>
					<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" SelectCommand="SELECT [borrower_ID], [borrowerfName] + ' ' + [borrowerlName] AS Name FROM [borrower]"></asp:SqlDataSource>
					<label for="date_borrowed">Borrowered Date:</label>
					<asp:TextBox ID="borrow_date" TextMode="Date" runat="server"></asp:TextBox>
					<asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
					</div>
					<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" SelectCommand="SELECT [disk_name], [borrow_date], [borrowerfName], [borrowerlName], [borrower_ID] FROM [disk_borrower]"></asp:SqlDataSource>
				<br />				
				<asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Please correct the following errors;" ValidationGroup="edit" CssClass="text-danger"/>
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventory %>" DeleteCommand="DELETE FROM [Disk] WHERE [disk_ID] = @disk_ID" InsertCommand="INSERT INTO [Disk] ([release_date], [status_ID], [genre_ID], [disk_type_ID], [disk_name]) VALUES (@release_date, @status_ID, @genre_ID, @disk_type_ID, @disk_name)" SelectCommand="SELECT [disk_ID], [release_date], [status_ID], [genre_ID], [disk_type_ID], [disk_name] FROM [Disk]" UpdateCommand="UPDATE [Disk] SET [release_date] = @release_date, [status_ID] = @status_ID, [genre_ID] = @genre_ID, [disk_type_ID] = @disk_type_ID, [disk_name] = @disk_name WHERE [disk_ID] = @disk_ID">
					<DeleteParameters>
						<asp:Parameter Name="disk_ID" Type="Int32" />
					</DeleteParameters>
					<InsertParameters>
						<asp:Parameter Name="release_date" DbType="String" />
						<asp:Parameter Name="status_ID" Type="Int32" />
						<asp:Parameter Name="genre_ID" Type="Int32" />
						<asp:Parameter Name="disk_type_ID" Type="Int32" />
						<asp:Parameter Name="disk_name" Type="String" />
						<asp:Parameter Name="disk_ID" Type="Int32" />
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

  
