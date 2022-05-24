$(document).ready(function () {
    $('#form1').bootstrapValidator({ 
        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },

        fields: {
            
           txtNombre: {
                validators: {
                    notEmpty: {
                        message: 'El campo Nombre es requerido'
                    },
                    stringLength: {
                        message: "¡La longitud mínima del Nombre es 3!",
                        min: 3
                    },

                }
            },

            
             txtDescripcion: {
                feedbackIcons: true,
                validators: {
                    notEmpty: {
                        message: 'El campo Descripcion es requerido'
                    },
                    stringLength: {
                        message: "¡La longitud mínima de la Descripcion es 3!",
                        min: 3
                    },
                }
            },
            
            txtitinerario: {
                validators: {
                    notEmpty: {
                        message: 'El campo itinerario es requerido'
                    },
                }
            },
             
            txtincluye: {
                validators: {
                    notEmpty: {
                        message: 'El campo incluye es requerido'
                    },
                }
            },
            
            txtnoincluye: {
                validators: {
                    notEmpty: {
                        message: 'El campo no incluye es requerido'
                    },
                }
            },
             
            txtllevar: {
                validators: {
                    notEmpty: {
                        message: 'El campo llevar es requerido'
                    },
                }
            },
             
            txtPrecio: {
                validators: {
                    notEmpty: {
                        message: 'El campo Precio es requerido'
                    },
                    digits: {
                        message: 'El campo Precio debe contener solamente dígitos'
                    },
                }
            },
            
            txtminimo: {
                validators: {
                    notEmpty: {
                        message: 'El campo mínimo es requerido'
                    },
                }
            },
            
            txtdistancia: {
                validators: {
                    notEmpty: {
                        message: 'El campo distancia es requerido'
                    },
                }
            },
             
            txtcolor: {
                validators: {
                    notEmpty: {
                        message: 'El campo color es requerido'
                    },
                    regexp: {
                        enabled: false,
                        regexp: /^[a-zA-Z\s]+$/,
                        message: 'El campo color debe consistir de caracteres alfanumericos'
                    },
                   
                }
            },
            txtmts: {
                validators: {
                    notEmpty: {
                        message: 'El campo mts es requerido'
                    },
                    digits: {
                        message: 'El campo mts debe contener solamente dígitos'
                    },
                }
            },
             
            txttemperatura: {
                validators: {
                    notEmpty: {
                        message: 'El campo temperatura es requerido'
                    },
                }
            },

           
             txtLatitud: {
                validators: {
                    notEmpty: {
                        message: 'El campo Latitud es requerido'
                    },

                }
            },
             
             txtLongitud: {
                validators: {
                    notEmpty: {
                        message: 'El campo Longitud es requerido'
                    },
                    stringLength: {
                        message: "¡La longitud de la Longitud es 6!",
                        min: 3
                    },
                }
            },
           
             txtfoto1: {
                validators: {
                    notEmpty: {
                        message: 'El campo foto1 es requerido'
                     },
                     uri: {
                         message: 'La dirección web no es válida'
                     }
                }
            },
            
            txtfoto2: {
                validators: {
                    notEmpty: {
                        message: 'El campo foto2 es requerido'
                    },
                    uri: {
                        message: 'La dirección web no es válida'
                    }
                }
            },

             
            txtUrl: {
                validators: {
                    notEmpty: {
                        message: 'El campo Url es requerido'
                    },
                    uri: {
                        message: 'La dirección web no es válida'
                    }
                }
            },
        }

    });
      
});