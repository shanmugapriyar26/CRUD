<%@ Page Title="Product Master" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductMaster.aspx.cs" Inherits="CRUDOperations.ProductMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hfProductID" runat="server" />
    <div>
        <asp:Table ID="tblProducts" runat="server" BorderColor="Black" BorderWidth="1" BorderStyle="Double" HorizontalAlign="Center" Width="470px">
           <asp:TableHeaderRow>
                <asp:TableHeaderCell ColumnSpan="2">
                    <b>Product Master</b><hr />
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell>
                    <b>Product Code</b><span style="color:red">*</span>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtProductCode" runat="server" ControlToValidate="txtProductCode" Display="Dynamic"
                        ErrorMessage="Enter Product Code" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <b>Product Name</b><span style="color:red">*</span>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtProductName" runat="server" ControlToValidate="txtProductName" Display="Dynamic"
                        ErrorMessage="Enter Product Name" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <b>Quantity</b><span style="color:red">*</span>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtQty" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtQty" runat="server" ControlToValidate="txtQty" Display="Dynamic"
                        ErrorMessage="Enter Quantity" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <b>Product Price</b><span style="color:red">*</span>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtProductPrice" runat="server" ControlToValidate="txtPrice" Display="Dynamic"
                        ErrorMessage="Enter Product Price" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <b>Remarks</b><span style="color:red">*</span>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvtxtRemarks" runat="server" ControlToValidate="txtRemarks" Display="Dynamic"
                        ErrorMessage="Enter Remarks" SetFocusOnError="true" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Submit" OnClick="btnSave_Click"/>&nbsp;&nbsp;
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>&nbsp;&nbsp;
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableFooterRow>
                <asp:TableCell ColumnSpan="2">
                    <asp:Label ID="lblSuccessMessage" runat="server" style="color:green"></asp:Label><br />
                    <asp:Label ID="lblErrorMessage" runat="server" style="color:red"></asp:Label>
                </asp:TableCell>
            </asp:TableFooterRow>
        </asp:Table>
        <br />
        <asp:GridView ID="gvProducts" runat="server" HorizontalAlign="Center" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="ProductID" ShowHeaderWhenEmpty="True" OnRowEditing="gvProducts_RowEditing" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
            <Columns> 
                <asp:TemplateField HeaderText="Product Code" ItemStyle-HorizontalAlign="Center"> 
                    <ItemTemplate> 
                        <asp:Label ID="lblProductCode" runat="server" Text='<%# Bind("ProductCode") %>'></asp:Label>  
                    </ItemTemplate> 

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Product Name" ItemStyle-HorizontalAlign="Center"> 
                     <ItemTemplate> 
                            <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label> 
                        </ItemTemplate> 

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField> 
                <asp:TemplateField HeaderText="Qty" ItemStyle-HorizontalAlign="Center"> 
                    <ItemTemplate> 
                        <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label> 
                    </ItemTemplate> 

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center"> 
                    <ItemTemplate> 
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label> 
                    </ItemTemplate> 

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center"> 
                    <ItemTemplate> 
                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label> 
                    </ItemTemplate> 

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
