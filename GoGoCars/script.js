function togglePasswordVisibility() {
  var passwordField = document.getElementById("password");
  var toggleIcon = document.getElementById("toggle-icon");

  if (passwordField.type === "password") {
      passwordField.type = "text";
      toggleIcon.src = "https://img.icons8.com/ios-filled/50/000000/invisible.png";
  } else {
      passwordField.type = "password";
      toggleIcon.src = "https://img.icons8.com/ios-filled/50/000000/visible.png";
  }
}

function checkFields() {
  
    var username = document.getElementById('username').value;
    var mail = document.getElementById('mail').value;
    var password = document.getElementById('password').value;
    
    if (username === '' || mail === '' || password === '') {
        alert('Please fill in all required fields.');
        return false;
    }
    return true;
}
