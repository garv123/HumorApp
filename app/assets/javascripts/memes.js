// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(window).scroll(function() {
   var fa =$(".fa");
   var length =fa.length;
   var str = window.location.href;
   
   var pos = str.lastIndexOf("/");
   str = str.substring(0,pos);
   
   var pos = str.lastIndexOf("/");
   str = str.substring(0,pos);

   $(fa[length-2]).on("click",function(){
    
   		window.location = str+"/topics";
   });

   $(fa[length-1]).on("click",function(){
      window.location = str+"/topics";
   });



});


$( ".fa-thumbs-up" ).click(function() {
  var a=this;
  $(this).unbind('click');
  $(this).siblings(".fa-thumbs-down").unbind('click');

 $.ajax({
          type: "PUT",
          url: '/memes/'+this.id+'?flag=yes',

          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          success: function(msg) {

            //console.log($(this).siblings(".ha-like-number"));
            $(a).siblings(".ha-like-number").html(msg['likes']);
            //$(this).html(msg['likes']);
            //console.log($(this).children());
            //console.log(msg['likes'])
          }
});
});


$( ".fa-thumbs-down" ).click(function() {
  var a=this;
  $(this).unbind('click');
  $(this).siblings(".fa-thumbs-up").unbind('click');
 $.ajax({
          type: "PUT",
          url: '/memes/'+this.id+'?flag=no',

          beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          success: function(msg) {
            $(a).siblings(".ha-dislike-number").html(msg['dislikes']);
            
          }
});
});


 
