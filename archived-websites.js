require(["epfl-jquery"], function($){
  "use strict";

  $(function() {
    // Load json file + add websites in page....
    $.ajax({
      type: 'GET',
      url: 'archived-websites.json',
      timeout: 3000,
      dataType: 'text',
      success: function(data) {
        var catalogue = JSON.parse(data);
        catalogue.sort();
        $.each(catalogue,function(index, value) {
          var ul = document.getElementById("list-archived-websites");
          var li = document.createElement("li");
          var a = document.createElement("a");
          if (value.indexOf('epfl.ch') >= 0) {
            a.href = ("//" + value);
          } else {
            a.href = ("http://" + value);
          }
          a.innerHTML = (value);
          li.appendChild(a);
          ul.appendChild(li);
        });
      },
      error: function() {
        alert('La requête n\'a pas abouti');
      }
    });
  });

});
