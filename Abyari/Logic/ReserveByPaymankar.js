
function reservewith(btn, tavafogh) {
    var idproje = $(btn).data("idproje");
    if (confirm('آیا اطمینان دارید؟')) {
        $.ajax({
            type: "post",
            url: "/ClientFunctions/ClientCalls.aspx/ZriprojeReserve",
            contentType: "application/json; charset=utf-8",
            data: "{idzirproje:'" + idproje + "',tavafogh:" + tavafogh + "}",
            success: function (data) {
                alert(data.d);

            },
            error: function (xhr, status, error) {

                alert(xhr.responseText);
            }

        });
    }

}
function unreserve(btn) {
    var idproje = $(btn).data("idproje");
    if (confirm('آیا اطمینان دارید؟')) {
        $.ajax({
            type: "post",
            url: "/ClientFunctions/ClientCalls.aspx/ZriprojeUnReserve",
            contentType: "application/json; charset=utf-8",
            data: "{idzirproje:'" + idproje + "'}",
            success: function (data) {
                alert(data.d);

            },
            error: function (xhr, status, error) {

                alert(xhr.responseText);
            }

        });
    }

}
$(document).ready(function () {

    $(".check").each(function () {
        var res = $(this).data("reserved");
        if (res == "True") {
            $(this).attr('disabled', 'disabled');
            $(this).attr('value', 'رزرو انجام شده است');
        }
    });
    $(".unreserve").each(function () {
        var res = $(this).data("reserved");
        if (res == "False") {
            $(this).attr('disabled', 'disabled');

        }
    });
});