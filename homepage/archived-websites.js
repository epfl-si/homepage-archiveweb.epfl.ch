'use strict';

$(function () {
  function sortArchivedWebsites (archivedWebsite) {
    function sortObj (obj, key) {
      obj[key] = archivedWebsite[key];
      return obj;
    }

    return Object.keys(archivedWebsite).sort().reduce(sortObj, {});
  };

  function displayArchivedWebsites (data) {
    const archivedWebsites = sortArchivedWebsites(data);
    const rowLi = [];
    for (const website of Object.keys(archivedWebsites)) {
      rowLi.push(
        $('<li></li>').append(
          $('<a></a>').attr('href', '/' + website + '/').text(website)
        )
      );
    }
    $('#list-archived-websites').append(rowLi);
  };

  $.getJSON('archived-websites.json', displayArchivedWebsites);
});
