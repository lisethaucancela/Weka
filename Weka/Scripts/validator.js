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
            ctl00$ContentPlaceHolder1$txtTitulo: {
                validators: {
                    notEmpty: {
                        message: 'El campo Titulo es requerido'
                    },
                    stringLength: {
                        message: "¡La longitud mínima del Titulo es 3!",
                        min: 3 
                    },
                }
            },
            ctl00$ContentPlaceHolder1$txtDescripcion: {
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
            ctl00$ContentPlaceHolder1$txtLatitud: {
                validators: {
                    notEmpty: {
                        message: 'El campo Latitud es requerido'
                    },
                    stringLength: {
                        message: "¡La longitud de la Latitud es 6!",
                        min: 6 
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
                        min: 6 
                    },
                }
            },
            ctl00$ContentPlaceHolder1$txtUrl: {
                validators: {
                    notEmpty: {
                        message: 'El campo Url es requerido'
                    }, 
                }
            },
        }

    });
});