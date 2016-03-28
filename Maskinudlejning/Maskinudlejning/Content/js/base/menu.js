$('#menu').on('click', function (e) {
    $('#mobile').toggle();
    e.stopPropagation();
});
$(document).on('click', function () {
    $('#mobile').hide();
});