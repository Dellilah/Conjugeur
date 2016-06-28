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

  this.sendAjaxRequest = function (url, form_data) {
    $.ajax({
      url: url,
      data: {
        exercise_settings_form: form_data
      },
      type: 'POST',
      dataType: 'script'
    });
  };

  this.addVerb = function (node, suggestion) {
    var that = this;
    var previous_ids = $(node.parentNode).find('.x-verbs-hidden').val();
    var source = $(node.parentNode).data('source');
    that.sendAjaxRequest('/reload-section', that.setData(source, previous_ids, suggestion));
  };

  this.removeVerb = function (node) {
    var that = this;
    var parentNode = node.parentNode;
    var verbId = $(node).data('id');
    var source = $(parentNode.parentNode.parentNode).data('source');
    var previous_ids = $(parentNode.parentNode).prev('.x-verbs-hidden').val();
    that.sendAjaxRequest('/kryteria/reload-section', that.removeData(source, previous_ids, verbId));
  };

  this.checkAll = function (field) {
    var that = this;
    var allFields = field.parent().find(".x-all-fields");
    var fieldValue = field.data('value');
    var labelsDict = { false: "Odznacz", true: "Zaznacz"};

    field.data('value', !fieldValue);
    that.setAll(allFields, !fieldValue);
    field.text(labelsDict[fieldValue]+" wszystkie "+ field.data('label'));
  }

  this.init = function () {
    var that = this;

    $('.x-check-all').on('click', function () {
      that.checkAll($(this));
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
