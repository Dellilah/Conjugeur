var ExerciseAnswer = function () {

  this.init = function () {
    var that = this;
    $('.x-french-letter button').on('click', function () {
      var input = $( ".x-answer" );
      input.val( input.val() + $(this).text() );
      input.focus();
    });
  };

  return this;
};
