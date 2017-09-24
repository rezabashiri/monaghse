$(document).ready(function () {
 
    var offset = 0;
 

    function plot() {
        var sin = [],
            cos = [];
        for (var i = 0; i < 12; i += 0.2) {
            sin.push([i, Math.sin(i + offset)]);
            cos.push([i, Math.cos(i + offset)]);
        }

        var options = {
            series: {
                lines: {
                    show: true
                },
                points: {
                    show: true
                }
            },
            grid: {
                hoverable: true //IMPORTANT! this is needed for tooltip to work
            },
            yaxis: {
                min: -1.2,
                max: 1.2
            },
            tooltip: true,
            tooltipOpts: {
                content: "'%s' of %x.1 is %y.4",
                shifts: {
                    x: -60,
                    y: 25
                }
            }
        };

        var plotObj = $.plot($("#flot-line-chart"), [{
            data: sin,
            label: "sin(x)"
        }, {
            data: cos,
            label: "cos(x)"
        }],
            options);
    }

});
function statistics() {
    //Flot Pie Chart
 
    $.ajax({
        type: "post",
        url: "/ClientFunctions/ClientCalls.aspx/GetPaymankarStatistics",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
        
            var args = [{
                label: "رزرو شده",
                data: data.d.Reserved
            }, {
                label: "عقد قرارداد شده",
                data: data.d.Contracted
            } ];
           
            var plotObj = $.plot($("#flot-pie-chart"), args, {
                series: {
                    pie: {
                        show: true
                    }
                },
                grid: {
                    hoverable: true
                },
                tooltip: true,
                tooltipOpts: {
                    content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
                    shifts: {
                        x: 20,
                        y: 0
                    },
                    defaultTheme: false
                }
            });
        },
        error: function (xhr, status, error) {

            alert(xhr.responseText);
        }
    });
}