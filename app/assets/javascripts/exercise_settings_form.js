var ExerciseSettingsForm = function () {
  this.checkAllTenses = ".x-check-all-tenses";
  this.checkAllGroups = ".x-check-all-groups";
  this.allTenses = ".x-all-tenses";
  this.allGroups = ".x-all-groups";

  this.checkElement = function (element) {
    $(element);
  };

  this.checkAll = function (parentNode) {
    var that = this;
    $(parentNode).children("input").each(function(index, el) {
      $(el).prop("checked", true);
    });
  };

  this.uncheckAll = function (parentNode) {
    var that = this;
    $(parentNode).children("input").each(function(index, el) {
      $(el).prop("checked", false);
    });
  };

  this.init = function () {
    var that = this;
    $(that.checkAllTenses).on('click', function () {
      if (this.checked) {
        that.checkAll(that.allTenses);
      } else {
        that.uncheckAll(that.allTenses);
      }
    });
    $(that.checkAllGroups).on('click', function () {
      if (this.checked) {
        that.checkAll(that.allGroups);
      } else {
        that.uncheckAll(that.allGroups);
      }
    });
  };

  return this;
};
