
// List users
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

document.getElementById('users-list').addEventListener('click', function() {
    loadPage('/list-users');
});

// Create user
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

document.getElementById('create-user').addEventListener('click', function() {
    loadPage('/create-user');
});

// User profile
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

document.getElementById('user-profile').addEventListener('click', function() {
    loadPage(loadPage('/find/{email}/{username}'));
});