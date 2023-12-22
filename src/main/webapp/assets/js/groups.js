
// List groupes
function loadPage(page) {
    fetch(page)
        .then(response => response.text())
        .then(html => {
            document.getElementById('main-content').innerHTML = html;
        })
        .catch(error => console.log(error));
}

document.getElementById('list-groups').addEventListener('click', function() {
    loadPage('/group/list-groups');
});

document.getElementById('create-group').addEventListener('click', function() {
    loadPage('addGroupe()');
});


// Create groupe
 function addGroupe() {
	 var name = document.getElementById('name').value;
	 var description = document.getElementById('description').value;
	 var ids = Array.from(document.querySelectorAll('input[type="checkbox"]:checked'))
	 .map(function(checkbox){
		 return checkbox.value;
	 })
	 var data = {
		 name : name,
		 description : description,
		 ids : ids
	 };
	 
	 var stringData = JSON.stringify(data);
	 
	 fetch('/group/add-group', {
		 method: "POST",
		 headers:{
			 'Content-type': 'application/json'
		 },
		 body : stringData
	 })
	 .then(function(response){
		 if(response.ok){
			  console.log("the datas has sent successfuly");
		 }else{
			 console.log('something wen wrong withe the datas')
		 }
		 })
		 .catch(function(error){
			 console.error('Something wen wrong with the request :', error)
		 })
		 
		
 }

