using Firebase.Database;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weka
{
    public partial class FormularioPaquete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["PreviousPage"] = Request.UrlReferrer;

                var index = Session["index"];
                if (index != null)
                {
                    CargarInfo();

                }
                
            }
           
        }

        protected void CargarInfo()
        {
            var dtLista = (DataTable)Session["dtLista"];
            var index = (int) Session["index"];
            txtNombre.Text = dtLista.Rows[index]["Nombre"].ToString();
            txtDescripcion.Text = dtLista.Rows[index]["Descripcion"].ToString();
            txtitinerario.Text = dtLista.Rows[index]["itinerario"].ToString();
            txtincluye.Text = dtLista.Rows[index]["incluye"].ToString();
            txtnoincluye.Text = dtLista.Rows[index]["no_incluye"].ToString();
            txtllevar.Text = dtLista.Rows[index]["llevar"].ToString();
            txtPrecio.Text = dtLista.Rows[index]["Precio"].ToString();
            txtminimo.Text = dtLista.Rows[index]["minimo"].ToString();
            txtdistancia.Text = dtLista.Rows[index]["distancia"].ToString();
            txtcolor.Text = dtLista.Rows[index]["color1"].ToString();
            txtmts.Text = dtLista.Rows[index]["mts"].ToString();
            txttemperatura.Text = dtLista.Rows[index]["temperatura"].ToString();
            txtLatitud.Text = dtLista.Rows[index]["latitud"].ToString();
            txtLongitud.Text = dtLista.Rows[index]["longitud"].ToString();
            txtfoto1.Text = dtLista.Rows[index]["foto1"].ToString();
            txtfoto2.Text = dtLista.Rows[index]["foto2"].ToString();
            txtUrl.Text = dtLista.Rows[index]["url"].ToString();
        }
        protected void btnNuevoP_Click(object sender, EventArgs e)
        {
          var index =  2;
          var GridView_prev = (GridView) PreviousPage.FindControl("GridView1");

            txtNombre.Text = ((Label) GridView_prev.Rows[index].Cells[1].FindControl("Nombre")).Text;
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                var index = (int)Session["index"];
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
                    string DataKeys = Session["DataKeys"].ToString();
                    var observable = firebase
                    .Child("Paquete/" + DataKeys)
                    .PutAsync(json);
                    SweetAlert("Mensaje", "Se guardó exitosamente la información", "success");

                    Session["index"] = null;

                    //if (ViewState["PreviousPage"] != null)
                    //{
                    //    Response.Redirect(ViewState["PreviousPage"].ToString()); 
                    //}

                    //Response.Redirect("~/AdministracionPaquetes.aspx", true);
                    HttpContext.Current.Response.Redirect("~/AdministracionPaquetes.aspx", false);
                     HttpContext.Current.ApplicationInstance.CompleteRequest();
                    //Response.End();

                }
            }
            catch (Exception ex)
            {

            }
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

        

        protected void Link_regresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionPaquetes.aspx");
        }
    }
}