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
//= require moment.min
//= require turbolinks
//= require_tree .

$(document).ready(function(){

	/* initialize the external events
	-----------------------------------------------------------------*/
	$('#external-events div.external-event').each(function() {
	    // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
	    // it doesn't need to have a start or end
	    var eventObject = {
	        title: $.trim($(this).text()) // use the element's text as the event title
	    };
	    
	    // store the Event Object in the DOM element so we can get to it later
	    $(this).data('eventObject', eventObject);
	    
	    // make the event draggable using jQuery UI
	    $(this).draggable({
	        zIndex: 999,
	        revert: true,      // will cause the event to go back to its
	        revertDuration: 0  //  original position after the 
	    });
	});
});