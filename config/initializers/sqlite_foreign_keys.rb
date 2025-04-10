# config/initializers/sqlite_foreign_keys.rb
if ActiveRecord::Base.connection.adapter_name == "SQLite"
  ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON;")
end
