$('input[name="accident[smoker]"]').change(function() {
    	var isSmoker = $('input:checked[name="accident[smoker]"]').val() == "Yes";    	
    	$('#smoker').toggle(isSmoker);
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