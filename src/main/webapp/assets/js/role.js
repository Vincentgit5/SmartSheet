
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
    loadPage('/role/list-roles');
});

document.getElementById('add-role').addEventListener('click', function() {
    loadPage('/role/add-role');
});

document.getElementById('view-role-details').addEventListener('click', function() {
    loadPage('role/view-role-details/{username}'); 
});
