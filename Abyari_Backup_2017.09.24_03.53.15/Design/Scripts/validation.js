var $ = jQuery.noConflict();
$(document).ready(function () {


    $('.LegalExtNationalCode').mask('?999999999999999');
    $('.LegalNationalCode').mask('9999999999');
    $('.phone').mask('9999999?9');
    $('.phonecode').mask('999?9');
    $('.mobile').mask('99999999999');
    $('.tell').mask('?99999999999');
    $('.sms').mask('?999999999999999');
    $('.code').mask('?9999');
    $('.postcode').mask('9999999999');
    $('.DocpostalCode').mask('99999999999999999999');
    $('.Time').mask('99:99');
    $('.DayNO').mask('9?9');
    $('.RegisterNo').mask('9?99999999999999');
    $('.nationalcode').mask('9999999999');
    $('.AccessNo').mask('9999999999999999999');
    $('.No').mask('999999999999999999');
    $('.date').mask('9999/99/99');
    $.mask.definitions['~'] = '([0-1])';
    $('.month').mask('~9');
    $.mask.definitions['#'] = '([0-3])';
    $('.day').mask('#9');
    $('.digit2').mask('99');
    //---------------------------------------------------------------------------------------------------------------------
    $('.fa-IR').keyup(function () { if (/[^\u0600-\u06FF ]/g.test($(this).val())) { MessageBlocker('فقط حروف فارسی مجاز است '); $(this).val(''); } });
    $('.fa-IR-No').keyup(function () { if (/[^\u0600-\u06FF ][^ 0-9 ]/g.test($(this).val())) { MessageBlocker('. فقط حروف فارسی , عدد مجاز است '); $(this).val(''); } });
    $('.en-US-No').keyup(function () { if (/[^ 0-9 ][^A-Za-z .]/g.test($(this).val())) { MessageBlocker(' فقط حروف انگلیسی , عدد مجاز است '); $(this).val(''); } });
    $('.en-US').keyup(function () { if (/[^A-Za-z]/g.test($(this).val())) { MessageBlocker(' فقط حروف انگلیسی  مجاز است '); $(this).val(''); } });
    $('.en-us-dot').keyup(function () { if (/[^A-Za-z .]/g.test($(this).val())) { MessageBlocker(' فقط حروف انگلیسی  مجاز است '); $(this).val(''); } });
    $('.number').keyup(function () { if (/[^ 0-9 ]/g.test($(this).val())) { MessageBlocker(' فقط عدد  مجاز است '); $(this).val(''); } });
    $('.currency').keyup(function () { if (/[^ 0-9 , .]/g.test($(this).val())) { MessageBlocker(' فقط عدد  مجاز است '); $(this).val(''); } });
    $('.nationalcode').keyup(function () { if (/[^ 0-9 ]/g.test($(this).val())) { MessageBlocker(' فقط عدد  مجاز است '); $(this).val(''); } });
    $('.mail').keyup(function () { if (/[^a-zA-Z-0-9-._]+[@]{1,1}[-_a-zA-Z0-9]*[.]?[-_a-zA-Z]*[.]?[-_a-zA-Z]*[.]?[-_a-zA-Z]/g.test($(this).val())) { MessageBlocker('.پست الکترونيکی نا معتبر است'); $(this).val(''); } });
    $('.float').keyup(function () { if (/[^ 0-9 / . ]/g.test($(this).val())) { MessageBlocker(' فقط عدد  مجاز است '); $(this).val(''); } });
    $('.showcurrency').after("<spam>ریال</spam>").css("float","right");
    //---------------------------------------------------------------------------------------------------------------------
    $(".currency").keydown(function (e) {
        var PureValue = $(this).val();
        for (var i = 0; i < $(this).val().length; i++) {
            PureValue = PureValue.replace(",", "");
        }
        if (PureValue.length > 14 && e.keyCode != 8) {
            event.returnValue = false;
        }
    });//---------------------------------------------------------------------------------------------------------------------
  
    //---------------------------------------------------------------------------------------------------------------------
    $(".currency").keyup(function () {
        if ($(this).val() != "") {
            $val = $(this).val().match(/[0-9]/g).reverse().join("").match(/[0-9]{1,3}/g).join(",").match(/./g).reverse().join("");
            $(this).val($val);
        }
    });
    //---------------------------------------------------------------------------------------------------------------------
    $("input[type='file']").bind('change', function () {
        var ext = $("input[type='file']").val().split('.').pop().toLowerCase();
        if ($.inArray(ext, ['gif', 'jpg', 'jpeg']) == -1) {
            alert("پسوند فایل ضمیمه شده میبایست \n{Ext1}\nو\n{Ext2}\n باشد , حجم آن نیز نمی تواند بیشتر از 100 کیلو بایت باشد.  ".format({ Ext1: 'jpg', Ext2: 'gif' }));
        }
    });
    //---------------------------------------------------------------------------------------------------------------------
    $('.Grid tr:has(td)').hover(function () { $(this).toggleClass('hovergrid'); });

});
//---------------------------------------------------------------------------------------------------------------------

function IsValidNationalCode(meli_code) {
    if (meli_code.length != null && meli_code.length == 10) {
        if (meli_code == '1111111111' || meli_code == '2222222222' || meli_code == '3333333333' || meli_code == '4444444444' || meli_code == '5555555555' || meli_code == '6666666666' || meli_code == '7777777777' || meli_code == '8888888888' || meli_code == '9999999999') {
            //alert(11);
            return false;

        } else {
            c = parseInt(meli_code.charAt(9));
            n = parseInt(meli_code.charAt(0)) * 10 + parseInt(meli_code.charAt(1)) * 9 + parseInt(meli_code.charAt(2)) * 8 + parseInt(meli_code.charAt(3)) * 7 + parseInt(meli_code.charAt(4)) * 6 + parseInt(meli_code.charAt(5)) * 5 + parseInt(meli_code.charAt(6)) * 4 + parseInt(meli_code.charAt(7)) * 3 + parseInt(meli_code.charAt(8)) * 2;
            r = n - parseInt(n / 11) * 11;
            if ((r == 0 && r == c) || (r == 1 && c == 1) || (r > 1 && c == 11 - r)) {
                //alert('sahih ast');
                return true;
            }
            else {
                return false;
                //alert('sahih nist');
            }
        }
    }
}
function IsValidLegalNationalCode(nationalCode) {
    if (nationalCode.length != 11)
        return false;

    var checkDigit = parseInt(nationalCode[10]);
    var dgt10th = parseInt(nationalCode[9]);

    var calc1th = (parseInt(nationalCode[0]) + dgt10th + 2) * 29;
    var calc2th = (parseInt(nationalCode[1]) + dgt10th + 2) * 27;
    var calc3th = (parseInt(nationalCode[2]) + dgt10th + 2) * 23;
    var calc4th = (parseInt(nationalCode[3]) + dgt10th + 2) * 19;
    var calc5th = (parseInt(nationalCode[4]) + dgt10th + 2) * 17;
    var calc6th = (parseInt(nationalCode[5]) + dgt10th + 2) * 29;
    var calc7th = (parseInt(nationalCode[6]) + dgt10th + 2) * 27;
    var calc8th = (parseInt(nationalCode[7]) + dgt10th + 2) * 23;
    var calc9th = (parseInt(nationalCode[8]) + dgt10th + 2) * 19;
    var calc10th = (parseInt(nationalCode[9]) + dgt10th + 2) * 17;

    var getdigit = (calc1th + calc2th + calc3th + calc4th + calc5th + calc6th + calc7th + calc8th + calc9th + calc10th) % 11;
    if (getdigit > 9)
        getdigit = getdigit % 10;
    if (checkDigit == getdigit)
        return true;
    return false;
}
//---------------------------------------------------------------------------------------------------------------------
function MessageBlocker(msg) {
    //$.blockUI({ message: '<table style="zindex:10">               <div class="col-sm-12 form-group input-group text-left ">   <div class="row text-right"><td class="msgblocker">' + msg + '</div><td><img src="/Design/Images/Warinig.png"/></div></div></div></table>' });
    $.blockUI({ message: '<table style="zindex:10">               <div class="col-sm-12 form-group input-group text-left ">   <div class="col-sm-9 text-right">' + msg + '</div><div class="col-sm-3 text-left"><img src="/Design/Images/Warinig.png"/></div></table>' });
    setTimeout($.unblockUI, 2000);
}
function ProgressBlocker(container, message) {
    $(container).block({ message: '<h3><img src="../css/images/progress.gif" />' + message + '</h3>' });
}
//---------------------------------------------------------------------------------------------------------------------
function GetPureValue(CamaSepratedValue) {
    var ReturnValue = "";
    for (var i = 0; i < CamaSepratedValue.length; i++) {
        Temp = CamaSepratedValue.replace(",", "");
    }
    ReturnValue = Temp;
    return ReturnValue;
}
//---------------------------------------------------------------------------------------------------------------------
String.prototype.format = function (args) { var newStr = this; for (var key in args) { newStr = newStr.replace('{' + key + '}', args[key]); } return newStr; }
//---------------------------------------------------------------------------------------------------------------------