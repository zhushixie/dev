$(function(){
    $("#model").click(function(){
        alert("test");
        $("#model").submit();
        
    });
    $("#model").submit(function(){
    	console.info("yyyyyyyyyyyyyy");
    	return true;
    });
    
});