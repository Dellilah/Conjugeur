if %w( test development ).include?(Rails.env)
  PolishGeeks::DevTools.setup do |config|
    config.final_blank_line_ignored = ['db/development.sqlite3', 'db/test.sqlite3']
    config.brakeman = false
  end
end
