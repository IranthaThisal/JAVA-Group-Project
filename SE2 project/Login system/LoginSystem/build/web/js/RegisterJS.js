function validateform(){
    if(document.Register.RegFname.value.length===0){
        window.alert("Please enter the Full name.");
        return false;
    }
    if(document.Register.Regemail.value.trim().length===0){
        window.alert("Please enter the Email.");
        return false;
    }
    else if(!document.Register.Regemail.value.include("@")){
        window.alert("The email account is not valid.Enter a valid Email account.");
        return false;
    }
    
    if(document.Register.Regcontactno.value.trim().length===0){
        window.alert("Please enter the Contact number");
        return false;
    }
     if (!document.Register.Reggender[0].checked && !document.Register.Reggender[1].checked) {
        window.alert("Please select your gender");
        return false; 
    }
    if (document.Register.RegDOB.value.trim().length===0){
        window.alert("Please enter the Date of Birth");
        return false;
    }
    if (document.Register.Regusername.value.length===0){
        window.alert("Please enter a username");
        return false;
    }
    const psw=(document.Register.Regpassword.value);
        if (psw.length===0){
        window.alert("Please enter a Password");
        return false;
    }
    else if(psw.length<10){
        window.alert("the password should contain maximum 10 characters.");
        return false;
    }
    const conpsw = (document.Register.Regconpassword.value.length===0);
        if (psw.length===0){
        window.alert("Please confirm the Password");
        return false;
    }
    else if(psw !== conpsw){
        window.alert("The password does not match.please try again.");
        return false;
    }
    window.alert("you have registerd successfully!");
    return true;
    
}