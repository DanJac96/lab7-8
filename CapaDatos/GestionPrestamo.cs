//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaDatos
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;

    public partial class GestionPrestamo : DbContext
    {
        [Key]
        public int id_GestionPrestamo { get; set; }
        [ForeignKey("Pai")]
        public int id_Pais { get; set; }
        public int Habitantes { get; set; }
        [ForeignKey("Idioma")]
        public int id_Idioma { get; set; }
        public int PIB { get; set; }
        public int Superficie { get; set; }
        public string RiesgoSeguridad { get; set; }
        public bool Prestamo { get; set; }
    
        public virtual Idioma Idioma { get; set; }
        public virtual Pai Pai { get; set; }
        
    }
}

