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

function dropDownMenu() {
    var dropdown1 = document.getElementsByClassName("filters-btn")
    var dropdown2 = document.getElementsByClassName("engine-type-btn");
    var dropdown3 = document.getElementsByClassName("category-btn");
    var dropdown4 = document.getElementsByClassName("interior-btn");
    var dropdown5 = document.getElementsByClassName("vechile-type-btn");
    var dropdown6 = document.getElementsByClassName("transmissiom-btn");
    var i;

    for (i = 0; i < dropdown1.length || i < dropdown2.length || i < dropdown3.length; i++) {
        
        if (i < dropdown1.length) {
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
        if (i < dropdown2.length) {
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

        if (i < dropdown3.length) {
            dropdown3[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
                } else {
                dropdownContent.style.display = "block";
                }
            });
        }

        if (i < dropdown4.length) {
            dropdown4[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
                } else {
                dropdownContent.style.display = "block";
                }
            });
        }

        if (i < dropdown5.length) {
            dropdown5[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
                } else {
                dropdownContent.style.display = "block";
                }
            });
        }

        if (i < dropdown6.length) {
            dropdown6[i].addEventListener("click", function() {
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
}


