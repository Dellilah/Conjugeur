namespace :new do
  task create_infinitives_out_of_bescherelle: :environment do
    require 'json'
    require 'yaml'
    @counter = Conjugation::Verb.last.id + 1
    @all_verbs = []

    Dir.glob(Rails.root.join('public/temp_verbs/*')) do |file|
      verbs(JSON.parse(File.read(file)))
    end

    File.open(Rails.root.join('db/data/conjugation/verbs.yml'), "a+") do |f|
      f << @all_verbs.to_yaml
    end

  end

  def verbs(datas)
    datas.each do |verb|
      next if verbs_bescherelle.include?(verb["infinitive"])
      add_verb(verb)
    end
  end

  def verb(verb_data)
    {
      "verb_#{@counter}" => {
        'id' =>             @counter,
        'infinitive' =>     verb_data["infinitive"],
        'group' =>          verb_data["group"],
        'translation_pl' => verb_data["translation"],
        'enabled' =>        false
      }
    }
  end

  def add_verb(verb_data)
    @all_verbs << verb(verb_data)
    @counter += 1
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
