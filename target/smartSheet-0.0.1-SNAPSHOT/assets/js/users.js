
//<---------------fontion load different function pages--------------------->
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

document.getElementById('users-list').addEventListener('click', function() {
    loadPage('/user/list-users');
});

document.getElementById('add-user').addEventListener('click', function() {
  addUser();
});

document.getElementById('view-user-profile').addEventListener('click', function() {
    loadPage('user/viewUser/{username}'); 
});

document.getElementById('user-created-sucessffully').addEventListener('click', function() {
    loadPage('/success'); 
});


// <--------------Create a new user ------------------------->
function validateField(field, errorMessage) {
  if (field.trim() === '') {
    var alertElement = document.getElementById(errorMessage);
    alertElement.textContent = 'Sorry, this field cannot be empty!';
    alertElement.style.display = 'block';

    setTimeout(function() {
      alertElement.style.display = 'none';
    }, 5000);

    return false;
  }

  return true;
}

function addUser() {
  const firstName = document.getElementById('firstName').value;
  const lastName = document.getElementById('lastName').value;
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;
  const mobile = document.getElementById('mobile').value;
  const address = document.getElementById('address').value;
  const username = document.getElementById('username').value;
  const groupe = document.getElementById('groupe').value;
  const imageFile = document.getElementById('imageFile').files[0];

  if (!validateField(firstName, 'emptyNameAlert')) {
    return false;
  }

  if (!validateField(lastName, 'emptyLastNameAlert')) {
    return false;
  }

  if (!validateField(email, 'emptyEmailAlert')) {
    return false;
  }

  if (!validateField(address, 'emptyAddressAlert')) {
    return false;
  }

  if (!validateField(username, 'emptyUserameAlert')) {
    return false;
  }
  
  if (!validateField(mobile, 'emptyMobileAlert')) {
    return false;
  }

  if (!validateField(password, 'emptyPasswordAlert')) {
    return false;
  }

  var formData = new FormData();
  formData.append('firstName', firstName),
  formData.append('lastName', lastName),
  formData.append('email', email),
  formData.append('mobile', mobile),
  formData.append('username', username),
  formData.append('password', password),
  formData.append('address', address),
  formData.append('groupe', groupe),
  formData.append('imageFile', imageFile),

  fetch('/user/add-user', {
    method: 'POST',
    body: formData,
  })
    .then(function (response) {
      if (response.status === 200) {
        var modal = new bootstrap.Modal(document.getElementById('verticalycentered'));
        modal.show();
      } else if (response.status === 500) {
        var modal = new bootstrap.Modal(document.getElementById('emailAlreadyExist'));
        modal.show();
      }
    })
    .then(function (data) {
      console.log(data); 
    })
    .catch(function (error) {
      var modal = new bootstrap.Modal(document.getElementById('somethingWhenWrong'));
      modal.show();
    });
}

document.addEventListener('DOMContentLoaded', function() {
  var createBtn = document.getElementById('create-btn');
  createBtn.addEventListener('click', function() {
  
  });
});

// <------------ Delete User using soft delete --------------------->
function removeUser(id){
	fetch(`user/remove-user/${id}`, {
		method: 'POST',
		headers: {
			'Content-type': 'application/json'
		},
	})
	.then(respose => {
		if (respose.ok){
			loadPage('/user/list-users')
			var modal = new bootstrap.Modal(document.getElementById('userDeleteSuccessfully'));
			modal.show();
		}else{
		loadPage('/user/list-users')
		  var modal = new bootstrap.Modal(document.getElementById('somthingwhenwrong'));
		  	modal.show();
		}
	})
	.catch(error => {
		console.error("internal server error :", error); 
	})
}
document.addEventListener('DOMContentLoaded', function() {
  var deleteBtn = document.getElementById('delete-btn');
  deleteBtn.addEventListener('click', function() {
  
  });
});

//<------------------Update user using DTO object-------------------->
function updateUserByUsername(id) {
  var firstName = document.getElementById('firstName').value;
  var lastName = document.getElementById('lastName').value;
  var username = document.getElementById('username').value;
  var email = document.getElementById("email").value;
  var mobile = document.getElementById('mobile').value;
  var address = document.getElementById('address').value;
  
  var userUpdatedData = {
    firstName: firstName,
    lastName: lastName,
    email: email,
    mobile: mobile,
    address: address,
    username: username,
  };
  
  var jsonUserUpdateData = JSON.stringify(userUpdatedData);
  
  fetch(`/user/update-user/${id}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: jsonUserUpdateData,
  })
  .then(response => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error(`Erreur lors de la mise à jour de l'utilisateur (status ${response.status}).`);
    }
  })
  .then(updatedUser => {
	  loadPage('/user/list-users')
		 var modal = new bootstrap.Modal(document.getElementById('userUdatedSuccessfully'));
		 modal.show();
  })
  .catch(error => {
    var modal = new bootstrap.Modal(document.getElementById('userNotDeleted'));
		modal.show();
	loadPage('/user/list-users')
  });
}

function getUserById(id) {
  fetch(`/user/get/byid/${id}`)
    .then(response => response.json())
    .then(user => {
      console.log(user);
    })
    .catch(error => {
      console.error('Une erreur s\'est produite lors de la récupération de l\'utilisateur :', error);
    });
}