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

function checkFieldsRegister() {
  
    var username = document.getElementById('username').value;
    var mail = document.getElementById('mail').value;
    var password = document.getElementById('password').value;
    
    if (username === '' || mail === '' || password === '') {
        alert('Please fill in all required fields.');
        return false;
    }
    return true;
}

function checkFieldsLogin() {
  
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;
    
    if (username === '' || password === '') {
        alert('Please fill in all required fields.');
        return false;
    }
    return true;
}

function dropDownMenu() {
    var dropdown1 = document.getElementsByClassName("filters-btn")
    var dropdown2 = document.getElementsByClassName("dropdown-btn");
    var i;

    for (i = 0; i < dropdown1.length || i < dropdown2.length; i++) {
    dropdown1[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
        } else {
        dropdownContent.style.display = "block";
        }
    });
    }
    for (i = 0; i < dropdown1.length || i < dropdown2.length; i++) {
    dropdown2[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
        } else {
        dropdownContent.style.display = "block";
        }
    });
    }
}
