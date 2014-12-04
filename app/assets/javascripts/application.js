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
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require jquery-ui
//= require bootstrap-datepicker
//= require turbolinks
//= require twitter/bootstrap

// require_tree . is removed because dropdowns did not work



$(document).ready( function () {
	$('#table_id').DataTable({bPaginate: false, bInfo: false});

	$('.stopsmoke_datepicker').datepicker({
    	format: "yyyy-mm-dd",
    	startView: 2,
		minViewMode: 1,
    	autoclose: "true"
   
    });
    
    $('.birthday_datepicker').datepicker({
    	format: "yyyy-mm-dd",
    	startView: 2,
    	minViewMode: 0,
    	autoclose: "true"
   
    });
    

	if ( document.getElementById("accident_smoker_yes") ) {
		var smokerYes = document.getElementById("accident_smoker_yes").checked;
		var smokerNo = document.getElementById("accident_smoker_no").checked;
		var stopdate = document.getElementById("accident_stopdate");
		if (smokerYes) {
			$('#smoker').show();
			$('#stopsmoke').hide();
			stopdate.value = "";
		} else {
			var typeofsmoke = document.getElementById("accident_typeofsmoke");
			var smokequantity = document.getElementById("accident_smokequantity");
			typeofsmoke.value = "";
			smokequantity.value = "";
			$('#smoker').hide();
			if (smokerNo) {
				$('#stopsmoke').show();
			} else {
				$('#stopsmoke').hide();
				stopdate.value = "";
			}

		}

		$('input[name="accident[smoker]"]').click(function() {
			var isSmoker = $('input:checked[name="accident[smoker]"]').val() == "Yes";    	
			if (isSmoker) {
				var stopdate = document.getElementById("accident_stopdate");
				stopdate.value = "";
				$('#smoker').show();
				$('#stopsmoke').hide();
			} else {
				var typeofsmoke = document.getElementById("accident_typeofsmoke");
				var smokequantity = document.getElementById("accident_smokequantity");
				typeofsmoke.value = "";
				smokequantity.value = "";
				$('#smoker').hide();
				$('#stopsmoke').show();
			}		
		});


		var alcoholYes = document.getElementById("accident_alcohol_yes").checked;
		if (alcoholYes) {
			$('#alcohol').show();
		} else {
			var typeofalcohol = document.getElementById("accident_typeofalcohol");
			var alcoholquantity = document.getElementById("accident_alcoholquantity");
			typeofalcohol.value = "";
			alcoholquantity.value = "";
			$('#alcohol').hide();
		}


		$('input[name="accident[alcohol]"]').click(function() {
			var isAlcohol = $('input:checked[name="accident[alcohol]"]').val() == "Yes";
			if (isAlcohol) {
				$('#alcohol').show();
			} else {
				var typeofalcohol = document.getElementById("accident_typeofalcohol");
				var alcoholquantity = document.getElementById("accident_alcoholquantity");
				typeofalcohol.value = "";
				alcoholquantity.value = "";
				$('#alcohol').hide();
			}
		});
	}


	if ( document.getElementById("accident_insured_yes") ) {
		var insuredYes = document.getElementById("accident_insured_yes").checked;
		if (insuredYes) {
			$('#insured').show();
		} else {
			var yesinsured = document.getElementById("accident_yesinsured");
			yesinsured.value = "";
			$('#insured').hide();
		}

		$('input[name="accident[insured]"]').click(function() {
			var isInsured = $('input:checked[name="accident[insured]"]').val() == "Yes";
			if (isInsured) {
				$('#insured').show();
			} else {
				var yesinsured = document.getElementById("accident_yesinsured");
				yesinsured.value = "";
				$('#insured').hide();
			}
		});

	//}

	//if ( document.getElementById("accident_declinedcoverage_yes") ) {
		var declinedYes = document.getElementById("accident_declinedcoverage_yes").checked;
		if (declinedYes) {
			$('#declinedcoverage').show();
		} else {
			var yesdeclined = document.getElementById("accident_yesdeclined");
			yesdeclined.value = "";
			$('#declinedcoverage').hide();
		}

		$('input[name="accident[declinedcoverage]"]').click(function() {
			var isDeclined = $('input:checked[name="accident[declinedcoverage]"]').val() == "Yes";
			if (isDeclined) {
				$('#declinedcoverage').show();
			} else {
				var yesdeclined = document.getElementById("accident_yesdeclined");
				yesdeclined.value = "";
				$('#declinedcoverage').hide();
			}
		});
	} 


});










