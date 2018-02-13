// JavaScript Document

// JS for calling load more for home page product
function load
    
    () {
	"use strict";							 
  	var size_li = jQuery(".woosale .products li").size();
	var size_li_new = jQuery(".woonew .products li").size();
	var size_li_best = jQuery(".woobest .products li").size();
				
	var counter=parseInt(1000);		

	var x=8;
	var y=8;	
	var z=8;

	jQuery('.woosale .products li:lt('+x+')').css('display','inline-block');
	jQuery('.woonew .products li:lt('+y+')').css('display','inline-block');
	jQuery('.woobest .products li:lt('+z+')').css('display','inline-block');
	    	
    jQuery('.woosale .woocount').click(function () {
	if(x==size_li){									 			
			 jQuery('.woosale .woocount').hide();
			 jQuery('.woosale .tm-message').show();
	}else{
		x= (x+counter <= size_li) ? x+counter : size_li;	
        jQuery('.woosale .products li:lt('+x+')').css('display','inline-block');			
	}
    });		    
	jQuery('.woonew .woocount').click(function () {
	if(y==size_li_new){									 
			jQuery('.woonew .woocount').hide();
			jQuery('.woonew .tm-message').show();
	}else{
		y= (y+counter <= size_li_new) ? y+counter : size_li_new;
        jQuery('.woonew .products li:lt('+y+')').css('display','inline-block');
	}
    });	   
	jQuery('.woobest .woocount').click(function () {
	if(z==size_li_best){									 
			jQuery('.woobest .woocount').hide();
			jQuery('.woobest .tm-message').show();
	}else{
		z= (z+counter <= size_li_best) ? z+counter : size_li_best;
        jQuery('.woobest .products li:lt('+z+')').css('display','inline-block');
	}
    });		
}
jQuery(document).ready(function() {"use strict";loadmore()});
jQuery(window).resize(function() {"use strict";loadmore()});