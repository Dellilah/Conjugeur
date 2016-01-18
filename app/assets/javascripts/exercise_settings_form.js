var ExerciseSettingsForm = function () {
  this.checkAllTenses = ".x-check-all-tenses";
  this.checkAllGroups = ".x-check-all-groups";
  this.allTenses = ".x-all-tenses";
  this.allGroups = ".x-all-groups";

  this.setAll = function (parentNode, value) {
    $(parentNode).find("input").each(function(index, el) {
      $(el).prop("checked", value);
    });
  };

  this.init = function () {
    var that = this;
    $(that.checkAllTenses).on('click', function () {
      if ($(this).data('value') === false) {
        $(this).data('value', true);
        $(this).text("Odznacz wszystkie czasy");
        that.setAll(that.allTenses, true);
      } else {
        $(this).data('value', false);
        $(this).text("Zaznacz wszystkie czasy");
        that.setAll(that.allTenses, false);
      }
    });
    $(that.checkAllGroups).on('click', function () {
      if ($(this).data('value') === false) {
        $(this).data('value', true);
        $(this).text("Odznacz wszystkie grupy");
        that.setAll(that.allGroups, true);
      } else {
        $(this).data('value', false);
        $(this).text("Zaznacz wszystkie grupy");
        that.setAll(that.allGroups, false);
      }
    });
  };

  return this;
};
