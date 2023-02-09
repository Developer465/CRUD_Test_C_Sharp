<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUD_Test.aspx.cs" Inherits="CRUD_Test.CRUD_Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="nav-justified">
        <tr>
            <td colspan="2" style="height: 20px">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRUD TEST DATABASE</td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="width: 179px; height: 39px">
                <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            </td>
            <td style="height: 39px">
                <asp:TextBox ID="txtname" runat="server" Width="177px" Height="21px"></asp:TextBox>
            </td>
            <td colspan="2" rowspan="7">
                    <asp:Label ID="check" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 179px; height: 36px">
                <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            </td>
            <td style="height: 36px">
                <asp:TextBox ID="txtEmail" runat="server" Width="181px" Height="22px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 179px; height: 37px">
                <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
            </td>
            <td style="height: 37px">
                <asp:DropDownList ID="txtbox" runat="server">
                    <asp:ListItem>Choose Any</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 179px; height: 38px">
                <asp:Label ID="Label5" runat="server" Text="Birth Date" ></asp:Label>
            </td>
            <td style="height: 38px">
                <asp:TextBox ID="txtdob" runat="server" Width="180px" TextMode = "Date" Height="22px" style="margin-left: 0"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 179px; height: 33px"></td>
            <td style="height: 33px">
                <asp:CheckBox ID="chkboxagree" runat="server" Text="Yes, I Agree" />
            </td>
        </tr>
        <tr>
            <td style="width: 179px; height: 42px">
                <asp:Label ID="iblsid" runat="server"></asp:Label>
            </td>
            <td style="height: 42px">
                <asp:Button ID="addbtn" runat="server" Text="Add" Width="73px" OnClick="addbtn_Click" />
                <asp:Button ID="updatebtn" runat="server" Text="Update" Width="73px" OnClick="updatebtn_Click" />
                <asp:Button ID="deletebtn" runat="server" Text="Delete" Width="73px" OnClick="deletebtn_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 179px; height: 37px"></td>
            <td style="height: 37px">
                <asp:Button ID="cancelbtn" runat="server" Height="37px" Text="Cancel" Width="222px" OnClick="cancelbtn_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 179px; height: 63px;">
                <asp:Label runat="server" Text="Search"></asp:Label>
            </td>
            <td style="height: 63px">
                <asp:TextBox ID="search" runat="server" Height="24px" Width="176px"></asp:TextBox>
            </td>
            <td style="height: 63px"></td>
            <td style="height: 63px"></td>
        </tr>
        <tr>
            <td style="width: 179px; height: 72px;">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CRUD_Test]"></asp:SqlDataSource>
            </td>
            <td style="height: 72px">
                <asp:Button ID="btnsearch" runat="server" Height="28px" OnClick="btnsearch_Click" Text="Search" Width="182px" />
            </td>
            <td style="height: 72px"></td>
            <td style="height: 72px"></td>
        </tr>
        <tr>
            <td style="height: 20px;" colspan="2">
                    <asp:GridView ID="seendata" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StdentID" Height="414px" OnSelectedIndexChanged="seendata_SelectedIndexChanged" Width="936px">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="StdentID" HeaderText="StdentID" InsertVisible="False" ReadOnly="True" SortExpression="StdentID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                        </Columns>
                    </asp:GridView>
                    </td>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="width: 179px">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br /> <br />
</asp:Content>
