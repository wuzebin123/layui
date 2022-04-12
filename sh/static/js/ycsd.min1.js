!new
function() {
    var a = this;
    a.width = 660,
    a.fontSize = 100,
    a.widthProportion = function() {
        var b = (document.body && document.body.clientWidth || document.getElementsByTagName("html")[0].offsetWidth) / a.width;
        return b > 1 ? 1 : b
    },
    a.changePage = function() {
        document.getElementsByTagName("html")[0].setAttribute("style", "font-size:" + Math.floor(a.widthProportion() * a.fontSize * 120) / 100 + "%!important")
    },
    a.changePage(),
    window.addEventListener("resize",
    function() {
        a.changePage()
    },
    !1)
};
$(".likes").click(function() {
    if ($(this).hasClass('done')) {
        layer.msg('强撸灰飞烟灭吖~');
        return false;
    } else {
        $(this).addClass('done');
        var id = $(this).data("id"),
        action = $(this).data('action'),
        rateHolder = $(this).children('.count');
        var ajax_data = {
            action: "ycsd_like",
            um_id: id,
            um_action: action
        };
        $.post("/wp-admin/admin-ajax.php", ajax_data,
        function(data) {
            $(rateHolder).html(data);
        });
        return false;
    }
});
console.log('\n' + ' %c 哈哈 %c ' + '\n', 'color: #fadfa3;background: #030307; padding:5px 0; font-size:13px;', 'background: #fadfa3; padding:5px 0; font-size:13px;');
function down() {
    layer.msg('长按图片下载原图~')
};
function so() {
    $('.info').toggleClass("octop");
}
function gotop() {
    $("html, body").animate({
        scrollTop: 0
    },
    600);
    return false
};
jQuery(document).ready(function() {
    function d() {
        document.title = document[b] ? "(??_?) 不喜欢人家啦？！": a
    }
    var b, c, a = document.title;
    "undefined" != typeof document.hidden ? (b = "hidden", c = "visibilitychange") : "undefined" != typeof document.mozHidden ? (b = "mozHidden", c = "mozvisibilitychange") : "undefined" != typeof document.webkitHidden && (b = "webkitHidden", c = "webkitvisibilitychange"),
    ("undefined" != typeof document.addEventListener || "undefined" != typeof document[b]) && document.addEventListener(c, d, !1)
});