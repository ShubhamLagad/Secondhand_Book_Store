function forgetPassHelp() {
    document.getElementById('forgetpassHelp').innerHTML = "<small>Password should be 8-16 characters long.</small>";
}
function passHelp() {
    document.getElementById('passHelp').innerHTML = "<small>Password should be 8-16 characters long.</small>";
}

function forgetPassCheck() {
    var password = document.getElementById("forgetPassword").value;
    var cpassword = document.getElementById("forgetCpassword").value;
    if (password != cpassword) {
        document.getElementById('forgetpassHelp2').innerHTML = "<small>Password must be same!</small>";
        document.getElementById('passwordBtn1').disabled = true;
    } else {
        document.getElementById('forgetpassHelp2').innerHTML = "";
        document.getElementById('passwordBtn1').disabled = false;
    }
}

function passCheck() {
    console.log("checkfun")
    var password = document.getElementById("regPassword").value;
    var cpassword = document.getElementById("regCpassword").value;
    if (password != cpassword) {
        document.getElementById('cpassHelp').innerHTML = "<small>Password must be same!</small>";
        document.getElementById("register").disabled = true;
    } else {
        document.getElementById('cpassHelp').innerHTML = "";
        document.getElementById("register").disabled = false;
    }
}
