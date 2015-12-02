namespace :dev do
  task create_verbs_bescherelle: :environment do
    require 'json'
    require 'yaml'
    @counter, @form_counter = 1, 1
    @all_verbs, @all_forms = [], []

    Dir.glob(Rails.root.join('public/temp_verbs/*')) do |file|
      verbs(JSON.parse(File.read(file)))
    end

    File.open(Rails.root.join('db/data/conjugation/verbs.yml'), "w+") do |f|
      f.write(@all_verbs.to_yaml)
    end

    File.open(Rails.root.join('db/data/conjugation/forms.yml'), "w+") do |f|
      f.write(@all_forms.to_yaml)
    end
  end

  def verbs(datas)
    datas.each do |verb|
      next unless verbs_bescherelle.include?(verb["infinitive"])
      create_forms(verb)
      add_verb(verb)
    end
  end

  def create_forms(verb)
    verb.each do |tense, tense_forms|
      unless Conjugation::Tense.find_by(symbol: tense.to_sym)
        next
      else
        tense_id = Conjugation::Tense.find_by(symbol: tense.to_sym).id
        if with_etre?(verb) && composed_tenses.include?(tense)
          add_feminin = true
        end
        tense_forms.each do |person, value|
          person_id = Conjugation::Person.find_by(name: person).id
          add_form(tense_id, person_id, value)
        end
        if add_feminin
          add_form(tense_id, 4, singular_fem_value(tense_forms["il"]))
          add_form(tense_id, 8, plural_fem_value(tense_forms["ils"]))
        end
      end
    end
  end

  def with_etre?(verb)
    verb["passe_compose"]["je"].include?("suis ")
  end

  def form(tense, person, val)
    {
      "form_#{@form_counter}" => {
        'id' => @form_counter,
        'tense_id' => tense,
        'verb_id' => @counter,
        'person_id' => person,
        'value' => val
      }
    }
  end

  def verb(verb_data)
    {
      "verb_#{@counter}" => {
        'id' =>             @counter,
        'infinitive' =>     verb_data["infinitive"],
        'group' =>          verb_data["group"],
        'translation_pl' => verb_data["translation"]
      }
    }
  end

  def singular_fem_value(value)
    value + "e"
  end

  def plural_fem_value(value)
    value =~ /(.*)(s)/ ? $1+"e"+$2 : value
  end

  def add_form(tense, person, val)
    @all_forms << form(tense, person, val)
    @form_counter += 1
  end

  def add_verb(verb_data)
    @all_verbs << verb(verb_data)
    @counter += 1
  end

  def composed_tenses
    %w( passe_compose
      plus_que_parfait
      passe_anterieur
      futur_anterieur
      subjonctif_passe
      subjonctif_plus_que_parfait
      conditionnel_passe_premiere
      conditionnel_passe_deuxieme )
  end

  def verbs_bescherelle
    ['aimer', 'placer', 'manger', 'peser', 'céder', 'jeter', 'épousseter', 'appeler',
    'modeler','celer', 'écarteler','acheter', 'haleter', 'créer', 'assiéger',
    'apprécier', 'payer', 'broyer', 'envoyer',
    'finir', 'grandir', 'divertir', 'raccourcir', 'haïr', "rougir",
    'aller', 'tenir', 'acquérir', 'sentir', 'vêtir', 'couvrir', 'cueillir',
    'assaillir', 'faillir', 'bouillir', 'dormir', 'courir', 'mourir', 'servir',
    'fuir', 'ouïr', 'gésir', 'recevoir', 'voir', 'pourvoir', 'savoir', 'devoir',
    'pouvoir', 'mouvoir', 'pleuvoir', 'falloir', 'valoir', 'vouloir', 'asseoir',
    'seoir', 'messeoir', 'surseoir', 'choir', 'échoir', 'déchoir', 'rendre', 'prendre',
    'battre', 'mettre', 'peindre', 'ceindre', 'joindre', 'craindre', 'vaincre', 'traire',
    'faire', 'plaire', 'connaître', 'taire', 'naître', 'paître', 'repaître', 'croître',
    'croire', 'boire', 'clore', 'conclure', 'absoudre', 'coudre', 'moudre', 'suivre',
    'vivre', 'lire', 'dire', 'rire', 'écrire', 'confire', 'cuire', 'être', 'avoir']
  end
end
