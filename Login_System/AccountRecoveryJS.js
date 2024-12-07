function validateform(){
    if (document.AccountRecovery.email.value.length==0){
        window.alert("Please enter your email");
        return false;
    }
    if (document.AccountRecovery.ConNumber.value.length==0){
        window.alert("Please enter a Contact Number");
        return false;
    }
}