$('input[name="accident[smoker]"]').change(function() {
    	var isSmoker = $('input:checked[name="accident[smoker]"]').val() == "Yes";    	
    	if (isSmoker) {
    		$('#smoker').show();
    	} else {
    		$('#smoker').hide(); 
    	}		
	});
	


var isSmoker = $('input:checked[name="accident[smoker]"]').val() == "Yes";    	
    if (isSmoker) {
    	$('#smoker').show();
    } else {
    	$('#smoker').hide(); 
    }
    

var isAlcohol = $('input:checked[name="accident[alcohol]"]').val() == "Yes";    	
    if (isAlcohol) {
    	$('#alcohol').show();
    } else {
    	$('#alcohol').hide(); 
    }
	
	$('input[name="accident[alcohol]"]').change(function() {
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

/// Datepickers	
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
    

// Insured

var insuredYes = document.getElementById("accident_insured_yes").checked;
    if (insuredYes) {
    	$('#insured').show();
    } else {
    	$('#insured').hide();
    }
    
	$('input[name="accident[insured]"]').click(function() {
    	var isInsured = $('input:checked[name="accident[insured]"]').val() == "Yes";
    	if (isInsured) {
    		$('#insured').show();
    	} else {
    		$('#insured').hide();
    	}
	});