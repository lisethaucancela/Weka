$(document).ready(function () {
    $('#form1').bootstrapValidator({ 
        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },

        fields: {
            ctl00$ContentPlaceHolder1$txtNombre: {
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

            ctl00$ContentPlaceHolder1$txtDescripcion: {
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

            ctl00$ContentPlaceHolder1$txtitinerario: {
                validators: {
                    notEmpty: {
                        message: 'El campo itinerario es requerido'
                    },
                }
            },
            ctl00$ContentPlaceHolder1$txtincluye: {
                validators: {
                    notEmpty: {
                        message: 'El campo incluye es requerido'
                    },
                }
            },

            ctl00$ContentPlaceHolder1$txtnoincluye: {
                validators: {
                    notEmpty: {
                        message: 'El campo no incluye es requerido'
                    },
                }
            },

            ctl00$ContentPlaceHolder1$txtllevar: {
                validators: {
                    notEmpty: {
                        message: 'El campo llevar es requerido'
                    },
                }
            },
            ctl00$ContentPlaceHolder1$txtPrecio: {
                validators: {
                    notEmpty: {
                        message: 'El campo Precio es requerido'
                    },
                    digits: {
                        message: 'El campo Precio debe contener solamente dígitos'
                    },
                }
            },

            ctl00$ContentPlaceHolder1$txtminimo: {
                validators: {
                    notEmpty: {
                        message: 'El campo mínimo es requerido'
                    },
                }
            },

            ctl00$ContentPlaceHolder1$txtdistancia: {
                validators: {
                    notEmpty: {
                        message: 'El campo distancia es requerido'
                    },
                }
            },

            ctl00$ContentPlaceHolder1$txtcolor: {
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
            ctl00$ContentPlaceHolder1$txtmts: {
                validators: {
                    notEmpty: {
                        message: 'El campo mts es requerido'
                    },
                    digits: {
                        message: 'El campo mts debe contener solamente dígitos'
                    },
                }
            },

            ctl00$ContentPlaceHolder1$txttemperatura: {
                validators: {
                    notEmpty: {
                        message: 'El campo temperatura es requerido'
                    },
                }
            },

            ctl00$ContentPlaceHolder1$txtLatitud: {
                validators: {
                    notEmpty: {
                        message: 'El campo Latitud es requerido'
                    },

                }
            },

            ctl00$ContentPlaceHolder1$txtLongitud: {
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

            ctl00$ContentPlaceHolder1$txtfoto1: {
                validators: {
                    notEmpty: {
                        message: 'El campo foto1 es requerido'
                    },
                    uri: {
                        message: 'La dirección web no es válida'
                    }
                }
            },

            ctl00$ContentPlaceHolder1$txtfoto2: {
                validators: {
                    notEmpty: {
                        message: 'El campo foto2 es requerido'
                    },
                    uri: {
                        message: 'La dirección web no es válida'
                    }
                }
            },


            ctl00$ContentPlaceHolder1$txtUrl: {
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