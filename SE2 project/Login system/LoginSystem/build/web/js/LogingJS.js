function validateform(){
    if (document.login.uname.value.length==0){
        window.alert("Please enter your username");
        return false;
    }
    if (document.login.pswd.value.length==0){
        window.alert("Please enter the Password");
        return false;
    }
}