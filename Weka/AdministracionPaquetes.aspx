<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="AdministracionPaquetes.aspx.cs" Inherits="Weka.Formulario.AdministracionPaquetes" %>

<%@ Register Assembly="DevExpress.XtraReports.v19.2.Web.WebForms, Version=19.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/validator.js" type="text/javascript"></script>

    <link href="estilos/css/bootstrapValidator.min.css" rel="stylesheet" />
    <script src="//oss.maxcdn.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript"> 
        function ShowModal(varTitulo) {
            var varModal = $('.modal');
            varModal.modal('show');
            varModal.find('.modal-title').text(varTitulo);
        }
        $("#btnNuevoP").click(function () {// Verifique después de hacer clic en el botón de no enviar, si está enviado, no necesita verificar directamente
            $('#form1').data("bootstrapValidator").resetForm();// Restablece todas las reglas de validación del formulario y luego activa la validación en el siguiente paso
            $("#form1").data("bootstrapValidator").validate();// Activar manualmente toda la verificación
            $("#form1").bootstrapValidator('validate');// Enviar verificación
            if ($("#form1").data('bootstrapValidator').isValid()) {// Obtenga el resultado de la verificación, si tiene éxito, ejecute el siguiente código

                btnNuevo_Click();
            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container" style="width: 100%">
                <div class="card">
                    <div class="card-body">
                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" class="btn btn-success" OnClick="btnModal_Click" />

                        <asp:Button runat="server" ID="btnAceptarEliminar" ClientIDMode="Static" OnClick="btnAceptarEliminar_Click" Style="display: none;" Text="ACEPTAR"
                            CssClass="btn btn-outline-primary" />

                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                CssClass="table table-bordered table-condensed table-striped table-hover"
                                AllowPaging="true" PageSize="20" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Id"
                                OnRowCommand="GridView1_RowCommand" Font-Size="X-Small">

                                <Columns>
                                    <asp:BoundField HeaderText="Id" DataField="Id" Visible="false" />
                                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" >
                                        <ItemStyle Width="20%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Descripcion" DataField="Descripcion"    >
                                          <ItemStyle Width="20%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Titulo" DataField="Titulo"  >
                                          <ItemStyle Width="20%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Latitud" DataField="latitud"   >
                                          <ItemStyle Width="5%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Longitud" DataField="longitud"   >
                                          <ItemStyle Width="5%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="url" DataField="url"   >  
                                        <ItemStyle Width="10%" Wrap="true" />
                                    </asp:BoundField>

                                    <asp:ButtonField Text="Editar" CommandName="Editar" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" />

                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade bg-dark" id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" runat="server">
                <div class="modal-dialog " role="document" style="height: 900px">
                    <div class="modal-content">
                        <div class="modal-header alert-secondary">
                            <h5 class="modal-title" style="font-size: 1.1rem;" id="ModalLabel"></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:TextBox runat="server" ID="dataKey" Visible="false"></asp:TextBox>

                            <div class="form-group col-md-5">
                                <label for="Nombre">Nombre</label>
                                <asp:TextBox runat="server" ID="txtNombre" class="form-control" aria-describedby="Nombre"
                                    placeholder="Nombre"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-5">
                                <label for="Titulo">Titulo</label>
                                <asp:TextBox runat="server" ID="txtTitulo" class="form-control" aria-describedby="Titulo"
                                    placeholder="Titulo"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="Descripcion">Descripcion</label>
                                <asp:TextBox runat="server" ID="txtDescripcion" class="form-control" aria-describedby="Descripcion"
                                    placeholder="Descripcion"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-5">
                                <label for="latitud">Latitud</label>
                                <asp:TextBox runat="server" ID="txtLatitud" class="form-control" aria-describedby="Latitud"
                                    placeholder="Latitud" type="number"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-5">
                                <label for="longitud">Longitud</label>
                                <asp:TextBox runat="server" ID="txtLongitud" class="form-control" aria-describedby="Longitud"
                                    placeholder="Longitud"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="url">Url</label>
                                <asp:TextBox runat="server" ID="txtUrl" class="form-control" aria-describedby="Url"
                                    placeholder="Url" type="url"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 150px;">Cerrar</button>
                            <asp:Button ID="btnNuevoP" runat="server" Text="Crear" class="btn btn-primary" OnClick="btnNuevo_Click" Style="width: 150px;"
                                type="submit" CausesValidation="False" />
                            <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-primary" OnClick="btnEditar_Click1" Style="width: 150px;"
                                type="submit" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

