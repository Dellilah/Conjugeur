var ExerciseSettingsForm = function () {
  this.checkAllTenses = ".x-check-all-tenses";
  this.checkAllGroups = ".x-check-all-groups";
  this.allTenses = ".x-all-tenses";
  this.allGroups = ".x-all-groups";

  this.setAll = function (parentNode, value) {
    $(parentNode).children("input").each(function(index, el) {
      $(el).prop("checked", value);
    });
  };

  this.init = function () {
    var that = this;
    $(that.checkAllTenses).on('click', function () {
      if (this.checked) {
        that.setAll(that.allTenses, true);
      } else {
        that.setAll(that.allTenses, false);
      }
    });
    $(that.checkAllGroups).on('click', function () {
      if (this.checked) {
        that.setAll(that.allGroups, true);
      } else {
        that.setAll(that.allGroups, false);
      }
    });
  };

  return this;
};
