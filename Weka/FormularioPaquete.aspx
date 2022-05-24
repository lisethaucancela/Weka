<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioPaquete.aspx.cs" Inherits="Weka.FormularioPaquete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="estilos/StyleMaster.css" rel="stylesheet" type="text/css" />
    <link href="estilos/menu.css" rel="stylesheet" />
    <link href="estilos/css/bootstrap.min.css" rel="stylesheet" />
    <link href="estilos/css/styleMp.css" rel="stylesheet" />
    <script type="text/javascript" src="Scripts/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="Scripts/js/sweetalert2.all.min.js"></script>
    <script type="text/javascript" src="Scripts/js/jquery-ui.min.js"></script>
    <%--<script type="text/javascript" src="Scripts/JsValidaciones.js"></script>--%>
    <script type="text/javascript" src="Scripts/ScriptMaster.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>

    <script type="text/javascript" src="Scripts/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/css/bootstrapValidator.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.min.js"></script>
    
   <script type="text/javascript" src="Scripts/validator2.js" ></script>
    <script type="text/javascript"> 
        $(document).ready(function () {
            $('.input-validation-error').parents('.form-group').addClass('has-error');
            $('.help-block').addClass('text-danger');

            $('#form1').data("bootstrapValidator").resetForm();  
        });
          <%--function editarClick() {
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
        });--%>
    </script>
    <title>Editar</title>
</head>

<body> 
     <a href="AdministracionPaquetes.aspx">
         <img  src="imagenes/regresar.png"
       />
     </a>

    <form id="form1" runat="server" method="post" class="form-horizontal req">
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate> 
                      
                <div class="container"  style="margin:20px">

                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" ScriptMode="Release" AsyncPostBackTimeout="3600">
                    </asp:ScriptManager> 
                    <div class="card" style="font-size: 0.8rem;">
                        <div class="card-body">

                            <div class="form-group col-md-5">
                                <label for="Nombre">Nombre</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    Style="height: 26px; width: 162px; color: red;"
                                    ErrorMessage="Campo Nombre requerido" ControlToValidate="txtNombre" ValidationGroup="Save"> 
                                </asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="txtNombre" class="form-control " aria-describedby="Nombre"
                                    placeholder="ROUTE">
                                </asp:TextBox>

                            </div>

                            <div class="form-group col-md-12">
                                <label for="Descripcion" style="font-weight: bolder">Descripcion</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    Style="height: 26px; width: 162px; color: red;"
                                    ErrorMessage="Campo Descripcion requerido" ControlToValidate="txtDescripcion">
                                *
                                </asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="txtDescripcion" class="form-control" aria-describedby="Descripcion"
                                    placeholder="Descripcion" Wrap="true" TextMode="MultiLine" Rows="4">
                                </asp:TextBox>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="itinerario">itinerario</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo itinerario requerido" ControlToValidate="txtitinerario">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtitinerario" class="form-control" aria-describedby="itinerario"
                                        placeholder="09:30 AM | Inicio del tour \n 10:00 AM | Caminata" TextMode="MultiLine">
                                    </asp:TextBox>

                                </div>
                                <div class="form-group col-md-3">
                                    <label for="incluye">incluye</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo incluye requerido" ControlToValidate="txtincluye">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtincluye" class="form-control" aria-describedby="incluye"
                                        placeholder="Transporte Interno \\n Guia" Wrap="true" TextMode="MultiLine">
                                    </asp:TextBox>

                                </div>
                                <div class="form-group col-md-3">
                                    <label for="noincluye">no incluye</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo no incluye requerido" ControlToValidate="txtnoincluye">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtnoincluye" class="form-control" aria-describedby="noincluye"
                                        placeholder="comida y bebidas" TextMode="MultiLine">
                                    </asp:TextBox>

                                </div>
                                <div class="form-group col-md-3">
                                    <label for="llevar">llevar</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo llevar requerido" ControlToValidate="txtllevar">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtllevar" class="form-control" aria-describedby="llevar"
                                        placeholder="Botella de agua \\n Ropa de ciclismo" TextMode="MultiLine">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class=" form-group col-md-3">
                                    <label for="Precio">Precio</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo Precio requerido" ControlToValidate="txtPrecio">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtPrecio" class="form-control" aria-describedby="Precio"
                                        placeholder="22">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="minimo">mínimo</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo mínimo requerido" ControlToValidate="txtminimo">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtminimo" class="form-control" aria-describedby="minimo"
                                        placeholder="MÍNIMO DOS PERSONAS">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="distancia">distancia</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo distancia requerido" ControlToValidate="txtdistancia">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtdistancia" class="form-control" aria-describedby="distancia"
                                        placeholder="20km">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="color">color</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo color requerido" ControlToValidate="txtcolor">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtcolor" class="form-control" aria-describedby="color"
                                        placeholder="0xff383a0b">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="mts">mts</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo mts requerido" ControlToValidate="txtmts">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtmts" class="form-control" aria-describedby="mts"
                                        placeholder="2800" type="number">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="temperatura">temperatura</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo temperatura requerido" ControlToValidate="txttemperatura">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txttemperatura" class="form-control" aria-describedby="temperatura"
                                        placeholder="68°F \n 20°C">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="latitud">Latitud</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo Latitud requerido" ControlToValidate="txtLatitud">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtLatitud" class="form-control" aria-describedby="Latitud"
                                        placeholder="-2.30047" >
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="longitud">Longitud</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo Longitud requerido" ControlToValidate="txtLongitud">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtLongitud" class="form-control" aria-describedby="Longitud"
                                        placeholder="-78.11481">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="foto1">foto1</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo foto1 requerido" ControlToValidate="txtfoto1">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtfoto1" class="form-control" aria-describedby="foto1"
                                        placeholder="https://firebasestorage.googleapis.com/v0/b/weka-53642.appspot.com/">
                                    </asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="foto2">foto2</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                                        Style="height: 26px; width: 162px; color: red;"
                                        ErrorMessage="Campo foto2 requerido" ControlToValidate="txtfoto2">
                                    *
                                    </asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="txtfoto2" class="form-control" aria-describedby="foto2"
                                        placeholder="https://firebasestorage.googleapis.com/v0/b/weka-53642.appspot.com/">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="url">Url</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                    Style="height: 26px; width: 162px; color: red;"
                                    ErrorMessage="Campo Url requerido" ControlToValidate="txtUrl">
                                *
                                </asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="txtUrl" class="form-control" aria-describedby="Url"
                                    placeholder="https://firebasestorage.googleapis.com/v0/b/weka" type="url">
                                </asp:TextBox>
                            </div>

                        </div>
                        <div class="">

                            <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-primary" Style="width: 150px;"
                                type="submit"   OnClick="btnEditar_Click" />

                        </div>

                    </div>

                </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
