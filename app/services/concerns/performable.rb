# extend ::Concerns::Performable
module Concerns
  module Performable
    def perform(*args)
      self.new(*args).perform
    end
  end
end
