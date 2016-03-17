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

  this.setData = function (source, previous_ids, suggestion) {
    if (source === "excluded") {
      return { excluded_verbs: previous_ids.concat(" "+suggestion.data) };
    } else {
      return { included_verbs: previous_ids.concat(" "+suggestion.data) };
    }
  };

  this.removeData = function (source, previous_ids, verbId) {
    if (source === "excluded") {
      return { excluded_verbs: previous_ids.replace(verbId, "") };
    } else {
      return { included_verbs: previous_ids.replace(verbId, "")  };
    }
  };

  this.addVerb = function (node, suggestion) {
    var that = this;
    var previous_ids = $(node.parentNode).find('.x-verbs-hidden').val();
    var source = $(node.parentNode).data('source');
    $.ajax({
      url: '/kryteria/reload-section',
      data: {
        exercise_settings_form: that.setData(source, previous_ids, suggestion)
      },
      type: 'POST',
      dataType: 'script'
    });
  };

  this.removeVerb = function (node) {
    var that = this;
    var parentNode = node.parentNode;
    var verbId = $(node).data('id');
    var source = $(parentNode.parentNode.parentNode).data('source');
    var previous_ids = $(parentNode.parentNode).prev('.x-verbs-hidden').val();
    $.ajax({
      url: '/kryteria/reload-section',
      data: {
        exercise_settings_form: that.removeData(source, previous_ids, verbId)
      },
      type: 'POST',
      dataType: 'script'
    });
  };

  this.checkAll = function (field) {
    var that = this;
    var allFields = $(field).parent().find(".x-all-fields");
    var label = $(field).data('label');
    if ($(field).data('value') === false) {
      $(field).data('value', true);
      $(field).text("Odznacz wszystkie "+label);
      that.setAll(allFields, true);
    } else {
      $(field).data('value', false);
      $(field).text("Zaznacz wszystkie "+label);
      that.setAll(allFields, false);
    }
  }

  this.init = function () {
    var that = this;

    $('.x-check-all').on('click', function () {
      that.checkAll(this);
    });

    $('.x-autocomplete').autocomplete({
      ajaxSettings: { dataType: 'json' },
      serviceUrl: '/autocomplete/verbs',
      onSelect: function (suggestion) {
        that.addVerb(this, suggestion);
      }
    });

    $('.x-verbs-result').on('click', '.x-remove-verb', function(e){
      e.preventDefault();
      that.removeVerb(this);
    });
  };

  return this;
};
