
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
function addUser() {
  var firstName = document.getElementById('firstName').value;
  var lastName = document.getElementById('lastName').value;
  var email = document.getElementById("email").value;
  var password = document.getElementById("password").value;
  var mobile = document.getElementById('mobile').value;
  var address = document.getElementById('address').value;
  var username = document.getElementById('username').value;
  var groupe = document.getElementById('groupe').value;
  
  if (groupe) {
  groupe.onchange = function() {
     var selectedOption = groupe.options[groupe.selectedIndex];
     var groupe = selectedOption.value
   };
   }
   
   if (firstName.trim() === '') {
    var emptyNameAlert = document.getElementById('emptyNameAlert');
    emptyNameAlert.textContent = 'Sorry User name can not be null ! !';
    emptyNameAlert.style.display = 'block';
    
    setTimeout(function() {
    emptyNameAlert.style.display = 'none';
  }, 5000);

  return false;
  }
  
if (lastName.trim() === '') {
    var emptyLastNameAlert = document.getElementById('emptyLastNameAlert');
    emptyLastNameAlert.innerHTML = 'Sorry last name can not be null !';
    emptyLastNameAlert.style.display = 'block';
    
    setTimeout(function() {
    emptyLastNameAlert.style.display = 'none';
  }, 5000);
    return false;
  }
 
  if (email.trim() === '') {
    var emptyEmailAlert = document.getElementById('emptyEmailAlert');
    emptyEmailAlert.innerHTML = 'Sorry Email can not be null !';
    emptyEmailAlert.style.display = 'block';
    
    setTimeout(function() {
    emptyEmailAlert.style.display = 'none';
  }, 5000);
    return false;
  }
  
if (address.trim() === '') {
    var emptyAddressAlert = document.getElementById('emptyAddressAlert');
    emptyAddressAlert.innerHTML = 'Sorry last name can not be null !';
    emptyLastNameAlert.style.display = 'block';
    
    setTimeout(function() {
    emptyAddressAlert.style.display = 'none';
  }, 5000);
    return false;
  }
if (username.trim() === '') {
    var emptyUserameAlert = document.getElementById('emptyUserameAlert');
    emptyUserameAlert.innerHTML = 'Sorry last name can not be null !';
    emptyUserameAlert.style.display = 'block';
    
     setTimeout(function() {
    emptyUserameAlert.style.display = 'none';
  }, 5000);
    return false;
  }

  if (password.trim() === '') {
    var emptyPasswordAlert = document.getElementById('emptyPasswordAlert');
    emptyPasswordAlert.innerHTML = 'Sorry Email can not be null !';
    emptyPasswordAlert.style.display = 'block';
    
    setTimeout(function() {
    emptyPasswordAlert.style.display = 'none';
  }, 5000);
    return false;
  }

  var userData = {
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password,
    mobile: mobile,
    address: address,
    username: username,
    groupe: groupe,
  };

  var jsonUserData = JSON.stringify(userData);

  fetch('/user/add-user', {
    method: 'POST',
    headers: {
      'Content-type': 'application/json',
    },
    body: jsonUserData,
  })
    .then(function (response) {
      if (response.status === 200) {
		 var modal = new bootstrap.Modal(document.getElementById('verticalycentered'));
			modal.show();
		loadPage('/user/list-users')

      } else if (response.status === 500) {
		   var modal = new bootstrap.Modal(document.getElementById('verticalycentered1'));
			modal.show();
      }
    })
    .then(function (data) {
      console.log(data); // Traitez les données renvoyées par le contrôleur
    })
    .catch(function (error) {
  	var modal = new bootstrap.Modal(document.getElementById('verticalycentered2'));
  	modal.show();
});

document.addEventListener('DOMContentLoaded', function() {
  var createBtn = document.getElementById('create-btn');
  createBtn.addEventListener('click', function() {
  
  });
});
}



// <------------ Delete User using soft delete --------------------->
function removeUser(username){
	fetch(`user/remove-user/{username}`, {
		method: 'DELETE',
		headers: {
			'Content-type': 'application/json'
		},
	})
	.then(respose => {
		if (respose.ok){
			var modal = new bootstrap.Modal(document.getElementById('userDeleteSuccessfully'));
			modal.show();
		}else{
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


//<------------------Get user by username------------------------->
function getUserByUsername(username) {
  var modal = new bootstrap.Modal(document.getElementById('areyouSureYouWantToDetele'));
  fetch(`/userDTO/get-user/${username}`)
    .then(response => {
      if (!response.ok) {
        throw new Error(`Erreur lors de la récupération de l'utilisateur ${username}.`);
      }
      return response.text();
    })
    .then(userData => {
		
		console.log(userData);
      modal.show();
    })
    .catch(error => {
      console.error(error.message);
    });
}

//<------------------Update user using DTO object-------------------->
function updateUserByUsername(username, updatedUserData){
	
	fetch(`/user/updateUser/${username}`,{
		
		methode: 'PUT',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(updatedUserData),
	})
	 .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error(`Erreur lors de la mise à jour de l'utilisateur (status ${response.status}).`);
        }
    })
    .then(updatedUser => {
        console.log('Utilisateur mis à jour avec succès:', updatedUser);
    })
    .catch(error => {
        console.error('Erreur lors de la mise à jour de l\'utilisateur:', error);
    });
}
