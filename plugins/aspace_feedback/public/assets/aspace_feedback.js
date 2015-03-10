$(function() {

    var $crclink = $("#crcConsultationLink");

    $crclink.click(function() {
        var $consultationForm = $(AS.renderTemplate("template_consultation_form"));

        AS.openCustomModal("aspaceFeedbackModal", $link.text(), $consultationForm, "container", {}, $link);
    });

});