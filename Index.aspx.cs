using CapaDatos;
using System;
using System.Drawing;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratorio7_8
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cargarGrid();
                cargarDDL_Pais();
                cargarDDL_Idioma();
            }
        }
        public void cargarGrid()
        {
            using (CapaDatos.Lab7_8Entities1 gestionPrestamo = new CapaDatos.Lab7_8Entities1())
            {
                
                    var data = (from gp in gestionPrestamo.GestionPrestamoes
                                  join p in gestionPrestamo.Pais on gp.id_Pais equals p.id_Pais
                                  join i in gestionPrestamo.Idiomas on gp.id_Idioma equals i.id_Idioma
                                                                
                                  select new
                                  {
                                      id_GestionPrestamo = gp.id_GestionPrestamo,
                                      id_Pais = p.Nombre_Pais,
                                      Habitantes = gp.Habitantes,
                                      id_Idioma = i.Descripcion_Idioma,
                                      PIB = gp.PIB,
                                      Superficie = gp.Superficie,
                                      RiesgoSeguridad = gp.RiesgoSeguridad,
                                      Prestamo = gp.Prestamo
                                  }).ToList(); 
                GridGestionPrestamo.DataSource = data;
                GridGestionPrestamo.DataBind();
            }
        }
        public void cargarDDL_Pais()
        {
            using (CapaDatos.Lab7_8Entities1 gestionPais = new CapaDatos.Lab7_8Entities1())
            {
                DrpPais.DataSource = gestionPais.Pais.ToList();
                DrpPais.DataTextField = "Nombre_Pais";
                DrpPais.DataValueField = "id_Pais";
                DrpPais.DataBind();
            }
        }
        public void cargarDDL_Idioma()
        {
            using (CapaDatos.Lab7_8Entities1 gestionIdioma = new CapaDatos.Lab7_8Entities1())
            {
                DrpIdioma.DataSource = gestionIdioma.Idiomas.ToList();
                DrpIdioma.DataValueField = "id_Idioma";
                DrpIdioma.DataTextField = "Descripcion_Idioma";
                DrpIdioma.DataBind();
            }
        }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            using (CapaDatos.Lab7_8Entities1 gestionPrestamo = new CapaDatos.Lab7_8Entities1())
            {
                CapaDatos.GestionPrestamo objPrestamos = new CapaDatos.GestionPrestamo();
                objPrestamos.id_Pais = Convert.ToInt32(DrpPais.SelectedValue);
                objPrestamos.Habitantes = Convert.ToInt32(txtHabitantes.Text);
                objPrestamos.id_Idioma = Convert.ToInt32(DrpIdioma.SelectedValue);
                objPrestamos.PIB = Convert.ToInt32(txtPIB.Text.Replace("$","").Trim());
                objPrestamos.Superficie = Convert.ToInt32(txtSuperficie.Text);
                objPrestamos.RiesgoSeguridad = RDLriesgo.SelectedItem.Text;
                objPrestamos.Prestamo = chkPrestamo.Checked;

                gestionPrestamo.GestionPrestamoes.Add(objPrestamos);
                gestionPrestamo.SaveChanges();
                
                cargarGrid();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            using (CapaDatos.Lab7_8Entities1 gestionPrestamo = new CapaDatos.Lab7_8Entities1())
            {
                int modify = Convert.ToInt32(DrpPais.SelectedValue);

                CapaDatos.GestionPrestamo aux = gestionPrestamo.GestionPrestamoes.Where(x => x.id_Pais == modify).FirstOrDefault();
                if (aux == null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('El registro no se encontro')", true);
                    return;
                }

                aux.id_Pais = Convert.ToInt32(DrpPais.SelectedValue);
                aux.Habitantes = Convert.ToInt32(txtHabitantes.Text);
                aux.id_Idioma = Convert.ToInt32(DrpIdioma.SelectedValue);
                aux.PIB = Convert.ToInt32(txtPIB.Text.Replace("$", "").Trim());
                aux.Superficie = Convert.ToInt32(txtSuperficie.Text);
                aux.RiesgoSeguridad = RDLriesgo.SelectedItem.Text;
                aux.Prestamo = chkPrestamo.Checked;
                gestionPrestamo.SaveChanges();
                cargarGrid();
            }


        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            using (CapaDatos.Lab7_8Entities1 gestionPrestamo = new CapaDatos.Lab7_8Entities1())
            {
                int delete = Convert.ToInt32(DrpPais.SelectedValue);
                CapaDatos.GestionPrestamo aux =gestionPrestamo.GestionPrestamoes.Where(x => x.id_Pais == delete).FirstOrDefault();
                if (aux == null)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "s1", "alert('El registro no se encontro')", true);
                    return;
                }

               
                gestionPrestamo.GestionPrestamoes.Remove(aux);
                gestionPrestamo.SaveChanges();
                
                cargarGrid();
            }
        }

        protected void GridGestionPrestamo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //foreach (GridViewRow fila in GridGestionPrestamo.Rows)
            //{

            //    if (fila.RowIndex == GridGestionPrestamo.SelectedIndex)
            //    {
            //        DrpPais.SelectedValue = fila.Cells[0].Text;
            //        txtHabitantes.Text = fila.Cells[1].Text;
            //        DrpIdioma.SelectedValue = fila.Cells[2].Text;
            //        txtPIB.Text = fila.Cells[3].Text;
            //        txtSuperficie.Text = fila.Cells[4].Text;
            //        RDLriesgo.SelectedItem.Value = fila.Cells[5].Text;
            //        chkPrestamo.Checked = Convert.ToBoolean(fila.Cells[6].Text);
            //        fila.BackColor = ColorTranslator.FromHtml("#A1DCF2");
            //    }
            //    else
            //    {
            //        fila.BackColor = ColorTranslator.FromHtml("#FFFFFF");
            //    }

            //}

            //cargarGrid();
        
        }

        protected void GridGestionPrestamo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridGestionPrestamo, "Select$" + e.Row.RowIndex);
            }
        }
    }
}