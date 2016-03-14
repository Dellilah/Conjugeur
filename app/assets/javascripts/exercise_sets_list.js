var ExerciseSetDetails = function () {

  this.showSetDetails = function (groupId) {
    $(".x-details-group-"+groupId).toggleClass('hide');
  };

  this.init = function () {
    var that = this;
    $('.x-show-details').on('click', function () {
      var groupId = $(this).data('group');
      that.showSetDetails(groupId);
    });
  };

  return this;
};
