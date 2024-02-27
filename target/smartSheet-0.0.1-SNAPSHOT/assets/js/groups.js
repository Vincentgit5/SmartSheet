// Fonction pour charger une page via une requête fetch
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

//<---------------- Event listener to load group list ------------------>
document.getElementById('list-groups').addEventListener('click', function() {
    loadPage('/group/list-groups');
});

//<------------------ Event listener to create a group ----------------------->
document.getElementById('create-group').addEventListener('click', function() {
    addGroupe();
});

//<------------------ view group details ----------------------->
document.getElementById('group-details').addEventListener('click', function() {
    loadPage('/group/group-details/{name}');
});


//<---------------- Function to create a group ------------------------>
function addGroupe() {
    var name = document.getElementById('name').value;
    var description = document.getElementById('description').value;
    var ids = Array.from(document.querySelectorAll('input[type="checkbox"]:checked'))
        .map(function(checkbox) {
            return checkbox.value;
        });

    var data = {
        name: name,
        description: description,
        ids: ids
    };

    var stringData = JSON.stringify(data);

    fetch('/group/add-group', {
            method: "POST",
            headers: {
                'Content-type': 'application/json'
            },
            body: stringData
        })
        .then(function(response) {
            if (response.ok) {
                var modal = new bootstrap.Modal(document.getElementById('groupCreatedSuccessfuly'));
                modal.show();
            } else {
                var modal = new bootstrap.Modal(document.getElementById('somethinWhenWrog'));
                modal.show();
                addGroupe();
            }
        })
        .catch(function(error) {
            console.error('Something went wrong with the request:', error);
        });
}



//<---------------- DataTable initialization --------------------->
$(document).ready(function() {
    var table = $('#example').DataTable({
        orderCellsTop: true,
        initComplete: function() {
            this.api().columns([1, 3]).every(function() {
                var column = this;
                console.log(this.index());
                var select = $('<select><option value=""></option></select>')
                    .appendTo($('thead tr:eq(1) th:eq(' + this.index() + ')'))
                    .on('change', function() {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );

                        column
                            .search(val ? '^' + val + '$' : '', true, false)
                            .draw();
                    });

                column.data().unique().sort().each(function(d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>');
                });
            });
        }
    });
});