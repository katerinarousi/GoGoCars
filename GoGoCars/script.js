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
/*-------------------- carousel katerina ---------------------- */
let currentItem = 0;
const items = document.querySelectorAll('.carousel-item');
const carousel = document.querySelector('.carousel');
const prevButton = document.getElementById('prev');
const nextButton = document.getElementById('next');

nextButton.addEventListener('click', function() {
    currentItem = (currentItem + 1) % items.length;
    updateCarousel();
});

prevButton.addEventListener('click', function() {
    currentItem = (currentItem - 1 + items.length) % items.length;
    updateCarousel();
});

function updateCarousel() {
    const translateX = -currentItem * 100 / items.length;
    carousel.style.transform = `translateX(${translateX}%)`;
}

/*---------------------------------------------------------------------*/

function dropDownMenu(button) {
    // Get the corresponding dropdown content
    var dropdownContent = button.nextElementSibling;

    // Toggle the "active" class and display property
    button.classList.toggle("active");
    
    if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
    } else {
        dropdownContent.style.display = "block";
    }
}




