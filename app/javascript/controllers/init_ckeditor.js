(function() {
  var ready;

  ready = function() {
    return $('.ckeditor').each(function() {
      return CKEDITOR.replace($(this).attr('id'));
    });
  };

  $(document).on('page:load', ready);

}).call(this);