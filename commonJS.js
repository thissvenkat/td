
$(document).ready(function () {
    $.fn.enterkeytab = function () {
        $(this).on('keydown', 'input[class=textboxCss],input[class=textboxNumCss]', function (e) {
            var self = $(this)
              , form = self.parents('form:eq(0)')
              , focusable
              , next
            ;
            if (e.keyCode == 13) {
                focusable = form.find('input[class=textboxCss],input[class=textboxNumCss],select[class=textboxCss],input[class=buttonCss],input[type=submit]').filter(':visible');
                next = focusable.eq(focusable.index(this)+1);
                if (next.length) {
                    next.focus();
                } else {
                    form.submit();
                }
                return false;
            }
        });
    }
    $("form").enterkeytab();
}); 
