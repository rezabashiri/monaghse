
function ShowPopUp(url, width, height) {
    $.fancybox({
        'width': width,
        'height': height,
        'href': url,
        'transitionIn': 'elastic',
        'transitionOut': 'elastic',
        'type': 'iframe',
        'autoDimensions': true,
        'centerOnScroll': true,
        'margin': 0,
        'padding': 0,
        'titlePosition': 'inside',
        'overlayOpacity': '0.9',
        'showCloseButton': true,
        'hideOnOverlayClick': false,
        'autoSize': false
    });
}
function ShowMessage(msg) {
    $.fancybox({
   
        'href': '/Messages/Message.aspx',
        'transitionIn': 'elastic',
        'transitionOut': 'elastic',
        'type': 'iframe',
        'autoDimensions': true,
        'centerOnScroll': true,
        'margin-top': '50px',
        'padding': 0,
        'titlePosition': 'inside',
        'overlayOpacity': '0.9',
        'showCloseButton': true,
        'hideOnOverlayClick': true,
        'autoSize': true
    });
}