var $img = $('.machines ul li img'),
    $d = $('.machine-description'),
    mhD = 0;
    mhImg = 0;

function EqualHeights(list, maxHeight) {
    list.each(function () {
        console.log(this + ' ' + this.clientHeight)
        if (this.clientHeight > maxHeight) {
            maxHeight = this.clientHeight;
        }

    })
    return maxHeight;
}
$(document).ready(function () {
    $d.height(EqualHeights($d, mhD));
    $img.height(EqualHeights($img, mhImg));
})

function GetMachine($data) {
    var $this = $(this),
        modal = $('.modal'),
        overlay = $('.overlay-modal');
    console.log(scrollY - window.screen.height);
    modal.css('top', 50)
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