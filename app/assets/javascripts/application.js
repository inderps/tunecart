// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require backstretch/backstretch.min.js
//= require ladda/spin.min.js
//= require ladda/ladda.min.js
//= require bootbox/bootbox.min.js

//= require_tree .

$(document).ready(function(){
    var ladda = Ladda.create($('#downloadBtn')[0]);
    $('form#downloadForm').submit(function() {
        var self = this;
        bootbox.confirm("This is a one time download. Are you sure to download it?", function(result) {
            if(result){
                ladda.start();
                var valuesToSubmit = $(self).serialize();
                $.ajax({
                    type: "POST",
                    url: $(self).attr('action'), //sumbits it to the given url of the form
                    data: valuesToSubmit,
                    dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
                }).success(function(json){
                    ladda.stop();
                    window.location.href = json.url;
                }).error(function(error){
                    ladda.stop();
                    bootbox.alert(error.responseJSON.message);
                });
            }
        });
        return false; // prevents normal behaviour
    });
});