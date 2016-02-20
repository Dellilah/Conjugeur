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

  this.saveToExclude = function (parentNode, verb_id) {
    var hiddenField = $(parentNode).find('.x-verbs-hidden');
    hiddenField.val(hiddenField.val() + " " +verb_id);
  };

  this.displayToExclude = function (parentNode, verb, verb_id) {
    var section = $(parentNode).find('.x-verbs-result');
    $(section).append("<span data-id='"+verb_id+"'>"+verb+"<button class='x-remove-verb'>X</button></span>");
  };

  this.removeVerb = function (node) {
    var parentNode = node.parentNode;
    var verbId = $(parentNode).data('id');
    var hiddenVerbs = parentNode.parentElement;
    var value = $(hiddenVerbs).prev(".x-verbs-hidden").val().replace(" "+verbId, "");
    $(hiddenVerbs).prev(".x-verbs-hidden").val(value);
    $(parentNode).remove();
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

    $('.x-autocomplete').autocomplete({
      ajaxSettings: { dataType: 'json' },
      serviceUrl: '/autocomplete/verbs',
      onSelect: function (suggestion) {
        that.saveToExclude(this.parentNode, suggestion.data);
        that.displayToExclude(this.parentNode, suggestion.value, suggestion.data);
        $(this).val('');
      }
    });

    $('.x-verbs-result').on('click', '.x-remove-verb', function(e){
        e.preventDefault();
        that.removeVerb(this);
    });
  };

  return this;
};
