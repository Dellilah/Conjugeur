module SuperMemo
  module SM2
    def reset_spaced_repetition_data
      self.easiness_factor = 2.5  
      self.number_repetitions = 0  
      self.quality_of_last_recall = nil  
      self.repetition_interval = nil
      self.next_repetition = nil
      self.last_studied = nil
    end

    def process_recall_result(quality_of_recall)

      if quality_of_recall < 3    
        self.number_repetitions = 0 
        self.repetition_interval = 0
      else
        self.easiness_factor = calculate_easiness_factor(quality_of_recall)
        self.repetition_interval = calculate_interval(quality_of_recall)
        self.number_repetitions += 1
      end
      
      self.next_repetition = Date.today + repetition_interval
      self.last_studied = Date.today
      self.quality_of_last_recall = quality_of_recall
      self.save
    end

    def scheduled_to_recall?
      !next_repetition.nil? && next_repetition <= Date.today
    end
    
    private 
    
    def calculate_easiness_factor(q)
      result = easiness_factor + (0.1-(5-q)*(0.08+(5-q)*0.02))
      result < 1.3 ? 1.3 : result
    end

    def calculate_interval(quality_of_recall)
      case number_repetitions
      when 0 then 1
      when 1 then 6
      else
        repetition_interval * easiness_factor
      end
    end
  end
end
