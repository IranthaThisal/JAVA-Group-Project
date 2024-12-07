function validateform(){
    if (document.login.uname.value.length==0){
        window.alert("Please enter your username");
        return false;
    }
    if (document.login.Npasword.value.length==0){
        window.alert("Please enter a new Password");
        return false;
    }
    if (document.login.ConfirmPSW.value.length==0){
        window.alert("Please confirm the Password");
        return false;
    }
}