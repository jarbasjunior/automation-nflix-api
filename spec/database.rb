require 'pg'

class Database
  def initialize
    configs = { host: 'pgdb', dbname: 'nflix', user: 'postgres', password: 'qaninja' }
    @connection = PG.connect(configs)
  end

  def delete(email)
    @connection.exec("delete from users where email = '#{email}';")
  end
end
