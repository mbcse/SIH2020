var express = require('express');

module.exports={

checkClientLoggedIn:function(req,res,next){
    if(req.session.loggedin)
           next();
    else
          res.render('/login',{message:'Please Log in First'});
},

login:(req,res,next)=>{

       var email=req.body.email;
       var password=req.body.password;
       
  
}























}