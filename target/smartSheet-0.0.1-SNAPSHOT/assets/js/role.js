
// List Role
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

$(document).ready(function() {
    $('#list-roles').on('click', function() {
        loadPage('/role/list-roles');
    });

    $('#view-role-details').on('click', function() {
        loadPage('role/view-role-details/{name}'); 
    });

    // Reste du code...
});

  $(document).ready(function() {
    var table = $('.datatable').DataTable({
      "lengthMenu": [5, 10, 15, 20], 
      "pageLength": 10,
      "searching": true,
      "ordering": true, 
      // ... d'autres options ...
      "lengthChange": false, 
    });

    // Ajouter la liste déroulante personnalisée
    $('.datatable-selector').on('change', function() {
      var selectedValue = $(this).val();
      table.page.len(selectedValue).draw();
    });
  });


