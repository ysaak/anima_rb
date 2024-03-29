// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// require jquery
// require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
    $('.yk-entity-card').click(function() {
        var link = $("a", this).attr('href');
        location.href = link;
    });

    $('.search-field').each(function() {

        var ref_form = this.form

        var data_url = $(ref_form).attr('suggests')

        var ms = $(this).magicSuggest({
            method: 'get',
            data: data_url,
            displayField: 'title',
            valueField: 'title',
            hideTrigger: true,
            minChars: 2
        });

        $(ms).on('keyup', function(e,m,v) {

            if (v.keyCode == 13 && ms.getRawValue().length == 0) {
                ref_form.submit()
            }
        });
    });
});