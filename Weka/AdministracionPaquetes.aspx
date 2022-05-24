<%@ Page Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="AdministracionPaquetes.aspx.cs" Inherits="Weka.Formulario.AdministracionPaquetes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/validator.js" type="text/javascript"></script>

     <link href="estilos/css/bootstrapValidator.min.css" rel="stylesheet" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript"> 


        function ShowModal(varTitulo) {
            var varModal = $('.modal');
            varModal.modal('show');
            varModal.find('.modal-title').text(varTitulo);

        };
        $(document).ready(function () {
            $('.input-validation-error').parents('.form-group').addClass('has-error');
            $('.help-block').addClass('text-danger');

            $('#form1').data("bootstrapValidator").resetForm();
        });
        function editarClick() {
            console.log($('#btnNuevoClick'));
            $('#form1').data("bootstrapValidator").resetForm();// Restablece todas las reglas de validación del formulario y luego activa la validación en el siguiente paso
            $("#form1").data("bootstrapValidator").validate();// Activar manualmente toda la verificación
            $("#form1").bootstrapValidator('validate');// Enviar verificación

            if ($("#form1").data('bootstrapValidator').isValid()) {// Obtenga el resultado de la verificación, si tiene éxito, ejecute el siguiente código

                console.log($('#btnNuevoClick'));
                //$('#btnNuevoClick').click();

                //PageMethods.Nuevo(onSuccess, onFailure);

            }
        };
        $('#btnEditar').click(function () {
            console.log($('#btnNuevoClick'));
            $('#form1').data("bootstrapValidator").resetForm();// Restablece todas las reglas de validación del formulario y luego activa la validación en el siguiente paso
            $("#form1").data("bootstrapValidator").validate();// Activar manualmente toda la verificación
            $("#form1").bootstrapValidator('validate');// Enviar verificación

            if ($("#form1").data('bootstrapValidator').isValid()) {// Obtenga el resultado de la verificación, si tiene éxito, ejecute el siguiente código

                console.log($('#btnNuevoClick'));

            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="card">
                    <div class="card-body">


                        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" class="btn btn-success" OnClick="btnModal_Click" />

                        <asp:Button runat="server" ID="btnAceptarEliminar" ClientIDMode="Static" OnClick="btnAceptarEliminar_Click" Style="display: none;" Text="ACEPTAR"
                            CssClass="btn btn-outline-primary" />

                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                CssClass="table table-bordered table-condensed table-striped table-hover"
                                AllowPaging="true" PageSize="20" DataKeyNames="Id"
                                OnRowDeleting="GridView1_RowDeleting"
                                OnRowCommand="GridView1_RowCommand" Font-Size="Small">
                                <RowStyle />
                                <PagerStyle />
                                <HeaderStyle />
                                <Columns>
                                    <asp:BoundField HeaderText="Id" DataField="Id" Visible="false" />


                                    <asp:TemplateField HeaderText="Nombre" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="Nombre" runat="server" Text='<%# Eval("Nombre")%>' Width="80"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Descripcion" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="Descripcion" runat="server" Text='<%#Eval("Descripcion")%>' Width="280px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="itinerario" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="itinerario" runat="server" Text='<%# Eval("itinerario")%>' Width="150px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="incluye" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="incluye" runat="server" Text='<%# Eval("incluye")%>' Width="80px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="no incluye" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="no_incluye" runat="server" Text='<%# Eval("no_incluye")%>' Width="80px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="llevar" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="llevar" runat="server" Text='<%# Eval("llevar")%>' Width="80px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Precio" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="Precio" runat="server" Text='<%# Eval("Precio")%>' Width="40px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="minimo" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="minimo" runat="server" Text='<%# Eval("minimo")%>' Width="80px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="distancia" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="distancia" runat="server" Text='<%# Eval("distancia")%>' Width="40px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="color" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="color1" runat="server" Text='<%# Eval("color1")%>' Width="70px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="mts" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="mts" runat="server" Text='<%# Eval("mts")%>' Width="40px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="temperatura" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="temperatura" runat="server" Text='<%# Eval("temperatura")%>' Width="60px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="latitud" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="latitud" runat="server" Text='<%# Eval("latitud")%>' Width="60px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="longitud" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="longitud" runat="server" Text='<%# Eval("longitud")%>' Width="60px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="foto1" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="foto1" runat="server" Text='<%# Eval("foto1")%>' Width="130px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="foto2" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="foto2" runat="server" Text='<%# Eval("foto2")%>' Width="130px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="url" ItemStyle-HorizontalAlign="center">
                                        <ItemTemplate>
                                            <asp:Label ID="url" runat="server" Text='<%# Eval("url")%>' Width="120px"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField Text="Editar" CommandName="Editar" ButtonType="Button" ControlStyle-CssClass="btn btn-primary" />
                                    <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" />

                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade " id="Modal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true" runat="server"
                data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-xl" role="document">
                    <div class="modal-content">
                        <div class="modal-header alert-secondary">
                            <h5 class="modal-title" style="font-size: 1.1rem;" id="ModalLabel"></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="font-size: 0.8rem;">
                            <asp:TextBox runat="server" ID="dataKey" Visible="false"></asp:TextBox>

                            <div class="form-group col-md-5">
                                <label for="Nombre">Nombre</label>

                                <asp:TextBox runat="server" ID="txtNombre" class="form-control " aria-describedby="Nombre"
                                    placeholder="ROUTE"></asp:TextBox>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="Descripcion">Descripcion</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    Style="height: 26px; width: 162px; color: red;"
                                    ErrorMessage="Campo Descripcion requerido" ControlToValidate="txtDescripcion">*
                                </asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="txtDescripcion" class="form-control" aria-describedby="Descripcion"
                                    placeholder="Descripcion" Wrap="true" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="itinerario">itinerario</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo itinerario requerido" ControlToValidate="txtitinerario">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtitinerario" class="form-control" aria-describedby="itinerario"
                                        placeholder="09:30 AM | Inicio del tour \n 10:00 AM | Caminata" TextMode="MultiLine"></asp:TextBox>

                                </div>
                                <div class="form-group col-md-3">
                                    <label for="incluye">incluye</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo incluye requerido" ControlToValidate="txtincluye">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtincluye" class="form-control" aria-describedby="incluye"
                                        placeholder="Transporte Interno \\n Guia" Wrap="true" TextMode="MultiLine"></asp:TextBox>

                                </div>
                                <div class="form-group col-md-3">
                                    <label for="noincluye">no incluye</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo no incluye requerido" ControlToValidate="txtnoincluye">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtnoincluye" class="form-control" aria-describedby="noincluye"
                                        placeholder="comida y bebidas" TextMode="MultiLine"></asp:TextBox>

                                </div>
                                <div class="form-group col-md-3">
                                    <label for="llevar">llevar</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo llevar requerido" ControlToValidate="txtllevar">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtllevar" class="form-control" aria-describedby="llevar"
                                        placeholder="Botella de agua \\n Ropa de ciclismo" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class=" form-group col-md-3">
                                    <label for="Precio">Precio</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo Precio requerido" ControlToValidate="txtPrecio">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtPrecio" class="form-control" aria-describedby="Precio"
                                        placeholder="22"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="minimo">mínimo</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo mínimo requerido" ControlToValidate="txtminimo">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtminimo" class="form-control" aria-describedby="minimo"
                                        placeholder="MÍNIMO DOS PERSONAS"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="distancia">distancia</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo distancia requerido" ControlToValidate="txtdistancia">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtdistancia" class="form-control" aria-describedby="distancia"
                                        placeholder="20km"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="color">color</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo color requerido" ControlToValidate="txtcolor">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtcolor" class="form-control" aria-describedby="color"
                                        placeholder="0xff383a0b" MaxLength="10"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="mts">mts</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo mts requerido" ControlToValidate="txtmts">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtmts" class="form-control" aria-describedby="mts"
                                        placeholder="2800" ></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="temperatura">temperatura</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo temperatura requerido" ControlToValidate="txttemperatura">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txttemperatura" class="form-control" aria-describedby="temperatura"
                                        placeholder="68°F \n 20°C"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="latitud">Latitud</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo Latitud requerido" ControlToValidate="txtLatitud">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtLatitud" class="form-control" aria-describedby="Latitud"
                                        placeholder="-2.30047"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="longitud">Longitud</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo Longitud requerido" ControlToValidate="txtLongitud">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtLongitud" class="form-control" aria-describedby="Longitud"
                                        placeholder="-78.11481"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="foto1">foto1</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo foto1 requerido" ControlToValidate="txtfoto1">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtfoto1" class="form-control" aria-describedby="foto1"
                                        placeholder="https://firebasestorage.googleapis.com/v0/b/weka-53642.appspot.com/"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="foto2">foto2</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo foto2 requerido" ControlToValidate="txtfoto2">*
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtfoto2" class="form-control" aria-describedby="foto2"
                                        placeholder="https://firebasestorage.googleapis.com/v0/b/weka-53642.appspot.com/"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="url">Url</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                    Style="height: 26px; width: 162px; color: red;"
                                    ErrorMessage="Campo Url requerido" ControlToValidate="txtUrl">*
                                </asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="txtUrl" class="form-control" aria-describedby="Url"
                                    placeholder="https://firebasestorage.googleapis.com/v0/b/weka" type="url"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">

                            <!--  <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width: 150px;">Cerrar</button>-->
                            <asp:Button ID="btnNuevoP" runat="server" Text="Crear" class="btn btn-primary" Style="width: 150px;"
                                type="submit" OnClick="btnNuevoP_Click" />

                            <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-primary" Style="width: 150px;"
                                type="submit" OnClick="btnEditar_Click1" CausesValidation="true" />

                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>


    </asp:UpdatePanel>

</asp:Content>

