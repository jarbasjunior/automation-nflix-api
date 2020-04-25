require 'pg'

class Database
  def initialize
    configs = { host: 'pgdb', dbname: 'nflix', user: 'postgres', password: 'qaninja' }
    @connection = PG.connect(configs)
  end

  def delete(email)
    @connection.exec("delete from users where email = '#{email}';")
  end
  
  def find_user(email)
    @connection.exec("select full_name, password, email, created_at, updated_at from users where email = '#{email}';").first
  end

  def clean_db
    @connection.exec("delete from users where id > 1;")
  end
end
