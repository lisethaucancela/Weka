/*var prevNowPlaying = null;

function pageLoad() {
    var timeOut = $("input:hidden[id*='hfTimeOut']").val();
    //alert(timeOut);
    if (prevNowPlaying) {
        clearInterval(prevNowPlaying);
    }
    prevNowPlaying = window.setInterval("TimeextendOrExpired()", ((timeOut) * 60 * 1000) - 60000); // 60000 milisegundos antes cierra sesión 
    //prevNowPlaying = window.setInterval("TimeextendOrExpired()", ((1) * 60 * 1000) - 55000);
}
function TimeextendOrExpired() {
    document.getElementById('Salir').click();
    console.log('La sesión se ha cerrado por inactividad!');
}*/

/*$(document).ready(function () {

    $('.ir-arriba').click(function () {
        $('body, html').animate({
            scrollTop: '0px'
        }, 300);
    });

    $(window).scroll(function () {
        if ($(this).scrollTop() > 0) {
            $('.ir-arriba').slideDown(300);
        } else {
            $('.ir-arriba').slideUp(300);
        };
    });

});*/


//DESHABILITA LA OPCIÓN DE ATRÁS
function DisableBackButton() {
    window.history.forward()
}
DisableBackButton();
window.onload = DisableBackButton;
window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
window.onunload = function () { void (0) }


//------------------------------16-04-2020-------------------------------------------
function SweetAlertConfirm(varBoton, varTitulo, varTexto, varIcono, varConfirmBtn) {
    if (varBoton.dataset.confirmed) {
        varBoton.dataset.confirmed = false;
        return true;
    } else {
        event.preventDefault();
        Swal.fire({
            title: varTitulo,
            text: varTexto,
            icon: varIcono,
            showCancelButton: true,
            confirmButtonColor: '#007bff',
            cancelButtonColor: '#6c757d',
            confirmButtonText: varConfirmBtn,
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.value) {
                varBoton.dataset.confirmed = true;
                varBoton.click();
            }
        })
    }
}
//------------------------------------------------------------------------------

function WebDocumentViewerControl(s, e) {
    s.previewModel.reportPreview.zoom(0.9); 
    var reportPreview = s.GetPreviewModel().reportPreview;
    var currentExportOptions = reportPreview.exportOptionsModel;
    var optionsUpdating = false;
    var fixExportOptions = function (options) {
        try {
            optionsUpdating = true;
            if (!options) {
                currentExportOptions(null);
            } else {
                delete options["xls"];
                delete options["mht"];
                delete options["html"];
                delete options["textExportOptions"];
                delete options["csv"];
                delete options["rtf"];
                delete options["docx"];
                delete options["image"];
                currentExportOptions(options);
            }
        } finally {
            optionsUpdating = false;
        }
    };
    currentExportOptions.subscribe(function (newValue) {
        !optionsUpdating && fixExportOptions(newValue);
    })
    fixExportOptions(currentExportOptions())
}

function WebDocumentViewerElement(s, e) {
  
    HideElement('Imprimir', e);
    HideElement('Imprimir página', e);
}

function HideElement(s, e) {
    var actionPrint = e.Actions.filter(function (action) { return action.text === s; })[0]
    var index = e.Actions.indexOf(actionPrint);
    e.Actions.splice(index, 1);
}

function WebDocumentViewerElementos(s, e) {
    HideElement('Export To', e);
    HideElement('Buscar', e);
    HideElement('Imprimir página', e);

    var printAction = e.Actions.filter(function (action) { return action.text === "Imprimir"; })[0];
    if (printAction) {
        var defaultPrintFunction = printAction.clickAction;
        printAction.clickAction = function () {
            ContadorImpresionActa();
            defaultPrintFunction();
            //documentViewer_Print();
        }
    } 
}


function ConfigureExportOptions(s, e) {
    e.HideExportOptionsPanel();
    var model = e.GetExportOptionsModel(DevExpress.Reporting.Viewer.ExportFormatID.XLS);
    model.xlsExportMode('SingleFilePageByPage');
}

