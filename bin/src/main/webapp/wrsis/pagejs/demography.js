$(document).ready(function(){
	
	 //start
	 $('#country1').on('change', function(){
	    var pId = $(this).val();
	    var region=$('#region');
	    var option="<option value='0'>--Select--</option>";
        if($(this).val()=='0'){
	    	region.empty();
	    	region.append(option);
	    	return false;
	    }
	    $.ajax({
		        type: 'GET',
		        url: "/GetDemographyByParentId/" + pId,
		        success: function(data){
		            region.empty();
		
		            for(var i=0; i<data.length; i++){
		                option = option + "<option value='"+data[i].demographyId + "'>"+data[i].demographyName + "</option>";
		            }
		            region.append(option);
		        },
		        error:function(){
		          //  alert("error");
		        }
		
		    });
	 });
	//end
	 
});


function getDemographyData(pVal,cId){
	
	var child=$('#'+cId);
    var option="<option value='0'>--Select--</option>";
    if(pVal=='0'){
    	child.empty();
    	child.append(option);
    	return false;
    }
    $.ajax({
	        type: 'GET',
	        url: "GetDemographyByParentId/" + pVal,
	        success: function(data){
	        	child.empty();
	
	            for(var i=0; i<data.length; i++){
	                option = option + "<option value='"+data[i].demographyId + "'>"+data[i].demographyName + "</option>";
	            }
	            child.append(option);
	        },
	        error:function(){
	          //  alert("error");
	        }
	
	    });
 
	
}