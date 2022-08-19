 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <div class="mainpanel">
            <div class="section">
               <div class="page-title">
                  <div class="title-details">
                     <h4>External GIS Access</h4>
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                          
                          
                        </ol>
                     </nav>
                  </div>
               
               </div>
                <div class="row">
                  <div class="col-md-12 col-sm-12">
                     <div class="card" style="height:100%;">
                     
                       <div class="card-body">
                           <!--Static-->
                           
                            <div class="width100" style="height:100%;">
                           <iframe src="${ExternalUrl}" title="external" style="width:100%;height:100%;"></iframe>
                           </div>
                           </div>
                           
                         </div>
                         </div>
                         </div>
                         
                            
                             
                
                      
            </div>
         </div>

 <script>
 
	  setInterval(function(){  
		  
		  $.ajax({
			 	type: "GET",
	            url : 'externalPageAccessValidityCheck',
	            success : function(data) {  
	            	try
	            	{
                var json = JSON.parse(data);
	            	}
	            	catch(e)
	            	{
	            		alert("Your session timeout.");
	            		window.close();
	            		
	            	}
	            },
				  error : function(e) {
					console.log("ERROR: ", e);
				},
				done : function(e) {
					console.log("DONE");
				}
	        });
		  
	  }, 5000);
 
 
 	//externalPageAccessValidityCheck
			
 
 </script>