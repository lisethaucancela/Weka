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
                dtLista.Columns.Add("Titulo");
                dtLista.Columns.Add("latitud");
                dtLista.Columns.Add("longitud");
                dtLista.Columns.Add("url");

                var list = new List<PaqueteModel>();


                foreach (var dino in students)
                {
                    var data = JsonConvert.DeserializeObject<dynamic>(dino.Object.ToString());

                    string datas = data["Nombre"].ToString();
                    DataRow dr = dtLista.NewRow();
                    dr["Id"] = dino.Key.ToString();
                    dr["Descripcion"] = data["Descripcion"].ToString();
                    dr["Nombre"] = data["Nombre"].ToString();
                    dr["Titulo"] = data["Titulo"].ToString();
                    dr["latitud"] = data["latitud"].ToString();
                    dr["longitud"] = data["longitud"].ToString();
                    dr["url"] = data["url"].ToString();

                    dtLista.Rows.Add(dr);
                }

                GridView1.DataSource = dtLista;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }


        protected void btnNuevo_Click(object sender, EventArgs e)
        { 
            var model = new
            {
                Descripcion = txtDescripcion.Text,
                Nombre =  txtNombre.Text,
                Titulo =  txtTitulo.Text,
                latitud = txtLatitud.Text,
                longitud = txtLongitud.Text,
                url = txtUrl.Text
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
        protected void btnEditar_Click1(object sender, EventArgs e)
        {
            var firebase = new FirebaseClient("https://weka-53642-default-rtdb.firebaseio.com/");
            var model = new
            {
                Descripcion = txtDescripcion.Text,
                Nombre = txtNombre.Text,
                Titulo =  txtTitulo.Text,
                latitud = txtLatitud.Text,
                longitud = txtLongitud.Text,
                url = txtUrl.Text
            };

            string json = JsonConvert.SerializeObject(model);

            var observable = firebase
            .Child("Paquete/" + dataKey.Text)
            .PutAsync(json);

            SweetAlert("Mensaje", "Se guardó exitosamente la información", "success");

            modalBackdropRemove();
            CargarDatos();
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
            txtTitulo.Text = "";
            txtDescripcion.Text = "";
            txtLatitud.Text = "";
            txtLongitud.Text = "";
            txtUrl.Text = "";
        }


        protected void RowEditing(int index)
        {
            btnEditar.Visible = true;
            btnNuevoP.Visible = false;
            string javaScript = "ShowModal('Editar Registro');";
            ScriptManager.RegisterStartupScript(this.UpdatePanel1, this.GetType(), "script", javaScript, true);

            dataKey.Text = GridView1.DataKeys[index].Value.ToString();

            txtNombre.Text = GridView1.Rows[index].Cells[1].Text;
            txtTitulo.Text = GridView1.Rows[index].Cells[2].Text;
            txtDescripcion.Text = GridView1.Rows[index].Cells[3].Text;
            txtLatitud.Text = GridView1.Rows[index].Cells[4].Text;
            txtLongitud.Text = GridView1.Rows[index].Cells[5].Text;
            txtUrl.Text = GridView1.Rows[index].Cells[6].Text;

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