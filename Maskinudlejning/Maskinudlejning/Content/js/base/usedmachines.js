var $img = $('.machines ul li img');
var maxHeight = 0;
$img.each(function (data) {

    if(this.height > maxHeight)
    {
        maxHeight = this.height;
    }

})

$img.height(maxHeight);

function GetMachine($data) {
    var $this = $(this),
        modal = $('.modal'),
        overlay = $('.overlay-modal');
    modal.css('top', event.pageY - scrollY)
    $.get($data, function (data) {
        modal.html(data);
        overlay.show();
        modal.show();
        $('body').addClass('stop-scrolling');

    });
    event.preventDefault();
}
$('.modal').on('click', function (e) {
    e.stopPropagation();
})
$(document).on('click', function (e) {

    var modal = $('.modal'),
        overlay = $('.overlay-modal');
    if(modal.is(':visible'))
    {
        modal.hide();
        overlay.hide();
        $('body').removeClass('stop-scrolling');
    }
})