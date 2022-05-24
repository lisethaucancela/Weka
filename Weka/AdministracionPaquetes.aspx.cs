using Firebase.Database;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Weka.Database;
using Weka.Model;

namespace Weka.Formulario
{
    public partial class AdministracionPaquetes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDatos();

        }
        protected void CargarDatos()
        {
            //ScriptManager.GetCurrent(this).RegisterPostBackControl();
            try
            {
                // FirebaseDB firebaseDB = new FirebaseDB("https://weka-53642-default-rtdb.firebaseio.com/");
                // FirebaseDB firebaseDBTeams = firebaseDB.Node("Paquete");

                // FirebaseResponse getResponse = firebaseDBTeams.Get();
                //var dt = (DataTable)JsonConvert.DeserializeObject(getResponse.JSONContent, (typeof(DataTable)));

                //IFirebaseConfig config = new FirebaseConfig
                //{
                //    AuthSecret = "WtyRxZxUb94IPMpd0ho9VlCdvpTDz7yO7dGCY42F",
                //    BasePath = "https://globaltechsupport.firebaseio.com/"
                //};

                // FirebaseClient firebase = new FirebaseClient(config);

                var firebase = new FirebaseClient("https://weka-53642-default-rtdb.firebaseio.com/");

                var students = firebase
               .Child("Paquete")
               .OnceAsync<Object>().Result;

                DataTable dtLista = new DataTable();
                dtLista.Columns.Add("Id");
                dtLista.Columns.Add("Descripcion");
                dtLista.Columns.Add("Nombre");
                dtLista.Columns.Add("Precio");
                dtLista.Columns.Add("color1");
                dtLista.Columns.Add("distancia");
                dtLista.Columns.Add("foto1");
                dtLista.Columns.Add("foto2");
                dtLista.Columns.Add("incluye");
                dtLista.Columns.Add("itinerario");
                dtLista.Columns.Add("latitud");
                dtLista.Columns.Add("llevar");
                dtLista.Columns.Add("longitud");
                dtLista.Columns.Add("minimo");
                dtLista.Columns.Add("mts");
                dtLista.Columns.Add("no_incluye");
                dtLista.Columns.Add("temperatura");
                dtLista.Columns.Add("url");

                

                var list = new List<PaqueteModel>();
                foreach (var dino in students)
                {
                    var data = JsonConvert.DeserializeObject<dynamic>(dino.Object.ToString());

                    DataRow dr = dtLista.NewRow();
                    dr["Id"] = dino.Key.ToString();
                    dr["Descripcion"] = data["Descripcion"].ToString();
                    dr["Nombre"] = data["Nombre"].ToString();
                    dr["Precio"] = data["Precio"].ToString();
                    dr["color1"] = data["color1"].ToString();
                    dr["distancia"] = data["distancia"].ToString();
                    dr["foto1"] = data["foto1"].ToString();
                    dr["foto2"] = data["foto2"].ToString();
                    dr["incluye"] = data["incluye"].ToString();
                    dr["itinerario"] = data["itinerario"].ToString();
                    dr["latitud"] = data["latitud"].ToString();
                    dr["llevar"] = data["llevar"].ToString();
                    dr["longitud"] = data["longitud"].ToString();
                    dr["minimo"] = data["minimo"].ToString();
                    dr["mts"] = data["mts"].ToString();
                    dr["no_incluye"] = data["no_incluye"].ToString();
                    dr["temperatura"] = data["temperatura"].ToString();
                    dr["url"] = data["url"].ToString();

                    dtLista.Rows.Add(dr);
                }

                GridView1.DataSource = dtLista;
                Session["dtLista"] = dtLista;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        [WebMethod]
        protected void btnNuevoP_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            { 
                Nuevo();
            }
        }

        [System.Web.Services.WebMethod]
        public void Nuevo()
        {
            try
            {
                var model = new
                {
                    Descripcion = txtDescripcion.Text,
                    Nombre = txtNombre.Text,
                    itinerario = txtitinerario.Text,
                    incluye = txtincluye.Text,
                    no_incluye = txtnoincluye.Text,
                    llevar = txtllevar.Text,
                    Precio = txtPrecio.Text,
                    minimo = txtminimo.Text,
                    distancia = txtdistancia.Text,
                    color1 = txtcolor.Text,
                    mts = txtmts.Text,
                    temperatura = txttemperatura.Text,
                    latitud = txtLatitud.Text,
                    longitud = txtLongitud.Text,
                    foto1 = txtfoto1.Text,
                    foto2 = txtfoto2.Text,
                    url = txtUrl.Text,
                };

                string json = JsonConvert.SerializeObject(model);

                var firebase = new FirebaseClient("https://weka-53642-default-rtdb.firebaseio.com/");

                var observable = firebase
                .Child("Paquete")
               .PostAsync(json);

                SweetAlert("Mensaje", "Se ingresó exitosamente el regitro", "success");
                modalBackdropRemove();
                CargarDatos();
            }
            catch (Exception ex)
            {

            }

        }
        protected void btnEditar_Click1(object sender, EventArgs e)
        {
            try
            {
             
                if (Page.IsValid)
                {
                    var firebase = new FirebaseClient("https://weka-53642-default-rtdb.firebaseio.com/");
                    var model = new
                    {
                        Descripcion = txtDescripcion.Text,
                        Nombre = txtNombre.Text,
                        itinerario = txtitinerario.Text,
                        incluye = txtincluye.Text,
                        no_incluye = txtnoincluye.Text,
                        llevar = txtllevar.Text,
                        Precio = txtPrecio.Text,
                        minimo = txtminimo.Text,
                        distancia = txtdistancia.Text,
                        color1 = txtcolor.Text,
                        mts = txtmts.Text,
                        temperatura = txttemperatura.Text,
                        latitud = txtLatitud.Text,
                        longitud = txtLongitud.Text,
                        foto1 = txtfoto1.Text,
                        foto2 = txtfoto2.Text,
                        url = txtUrl.Text,

                    };

                    string json = JsonConvert.SerializeObject(model);

                    var observable = firebase
                    .Child("Paquete/" + dataKey.Text)
                    .PutAsync(json);

                    SweetAlert("Mensaje", "Se guardó exitosamente la información", "success");

                    modalBackdropRemove();
                    CargarDatos();
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void btnAceptarEliminar_Click(object sender, EventArgs e)
        {
            var firebase = new FirebaseClient("https://weka-53642-default-rtdb.firebaseio.com/");

            var observable = firebase
            .Child("Paquete/" + dataKey.Text)
            .DeleteAsync();

            SweetAlert("Mensaje", "Se eliminó exitosamente la información", "success");
            CargarDatos();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Editar")
            {
                RowEditing(index);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = int.Parse(e.RowIndex.ToString());
            dataKey.Text = GridView1.DataKeys[index].Value.ToString();
            SweetAlertConfirm("", "¿Desea eliminar la información seleccionada?", "Aceptar", "btnAceptarEliminar", "question");
        }

        protected void modalBackdropRemove()
        {
            Response.Redirect(Request.RawUrl);
            string javaScript = "$('.modal-backdrop').remove()";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "script", javaScript, true);

        }

        protected void btnModal_Click(object sender, EventArgs e)
        { 

            string javaScript = "ShowModal('Crear Registro');";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "script", javaScript, true);
            btnEditar.Visible = false;
            btnNuevoP.Visible = true;

            txtNombre.Text = "";
            txtDescripcion.Text = "";
            txtitinerario.Text = "";
            txtincluye.Text = "";
            txtnoincluye.Text = "";
            txtllevar.Text = "";
            txtPrecio.Text = "";
            txtminimo.Text = "";
            txtdistancia.Text = "";
            txtcolor.Text = "";
            txtmts.Text = "";
            txttemperatura.Text = "";
            txtLatitud.Text = "";
            txtLongitud.Text = "";
            txtfoto1.Text = "";
            txtfoto2.Text = "";
            txtUrl.Text = "";
          
        }

        protected void RowEditing(int index)
        {
            Session["DataKeys"] = GridView1.DataKeys[index].Value.ToString();
            Session["index"] = index;
            Response.Redirect("FormularioPaquete.aspx");
            try
            {
                //btnEditar.Visible = true;
                //btnNuevoP.Visible = false;
                //string javaScript = "ShowModal('Editar Registro');";
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "script", javaScript, true);

                //dataKey.Text = GridView1.DataKeys[index].Value.ToString();
             

                //txtNombre.Text = ((Label)GridView1.Rows[index].Cells[1].FindControl("Nombre")).Text;
                //txtDescripcion.Text = ((Label)GridView1.Rows[index].Cells[2].FindControl("Descripcion")).Text;
                //txtitinerario.Text = ((Label)GridView1.Rows[index].Cells[3].FindControl("itinerario")).Text;
                //txtincluye.Text = ((Label)GridView1.Rows[index].Cells[4].FindControl("incluye")).Text;
                //txtnoincluye.Text = ((Label)GridView1.Rows[index].Cells[5].FindControl("no_incluye")).Text;
                //txtllevar.Text = ((Label)GridView1.Rows[index].Cells[6].FindControl("llevar")).Text;
                //txtPrecio.Text = ((Label)GridView1.Rows[index].Cells[7].FindControl("Precio")).Text;
                //txtminimo.Text = ((Label)GridView1.Rows[index].Cells[8].FindControl("minimo")).Text;
                //txtdistancia.Text = ((Label)GridView1.Rows[index].Cells[9].FindControl("distancia")).Text;
                //txtcolor.Text = ((Label)GridView1.Rows[index].Cells[10].FindControl("color1")).Text;
                //txtmts.Text = ((Label)GridView1.Rows[index].Cells[11].FindControl("mts")).Text;
                //txttemperatura.Text = ((Label)GridView1.Rows[index].Cells[12].FindControl("temperatura")).Text;
                //txtLatitud.Text = ((Label)GridView1.Rows[index].Cells[13].FindControl("latitud")).Text;
                //txtLongitud.Text = ((Label)GridView1.Rows[index].Cells[14].FindControl("longitud")).Text;
                //txtfoto1.Text = ((Label)GridView1.Rows[index].Cells[15].FindControl("foto1")).Text;
                //txtfoto2.Text = ((Label)GridView1.Rows[index].Cells[16].FindControl("foto2")).Text;
                //txtUrl.Text = ((Label)GridView1.Rows[index].Cells[17].FindControl("url")).Text;
                //javaScript = "nuevoClick();";
                //ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "script", javaScript, true);

            }
            catch (Exception ex)
            {

            }
        }

        protected bool ValidarCampos()
        {
            if (string.IsNullOrEmpty(Request.Form["txtTitulo"]))
            {
                SweetAlert("Mensaje", "Por favor ingresar los datos correctamente", "");
                return false;
            }
            return true;
        }

        public void SweetAlert(string strTitulo, string strMensaje, string strIcono)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Swal.fire(");
            sb.Append("'" + strTitulo + "',");
            sb.Append("'" + strMensaje + "',");
            sb.Append("'" + strIcono + "' )");
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, GetType(), "SweetAlert", sb.ToString(), true);
        }
        public void SweetAlertConfirm(string strTitulo, string strHtml, string strConfirmBtn, string strButton, string strIcono)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Swal.fire({");
            sb.Append("title: '" + strTitulo + "',");
            sb.Append("html: '" + strHtml + "',");
            sb.Append("icon: '" + strIcono + "',");
            sb.Append("showCancelButton: true,");
            sb.Append("confirmButtonColor: '#007bff',");
            sb.Append("cancelButtonColor: '#6c757d',");
            sb.Append("confirmButtonText: '" + strConfirmBtn + "',");
            sb.Append("cancelButtonText: 'Cancelar'");
            sb.Append("}).then((result) => {");
            sb.Append("if (result.value){");
            sb.Append("document.getElementById('" + strButton + "').click(); }})");

            ScriptManager.RegisterClientScriptBlock(this, GetType(), "SweetAlertConfirm", sb.ToString(), true);
        }
 
    }
}