
// List Role
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

document.getElementById('list-roles').addEventListener('click', function() {
    loadPage('/list-roles');
});


// Create Role
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

document.getElementById('create-role').addEventListener('click', function() {
    loadPage('/create-role');
});