require 'yaml'

class Setup
  def set_state
    environment = Digdag.env.params['environment']

    config = YAML.load_file('config/config.yml')[environment]
    config.each do |key, value|
      Digdag.env.store(key.to_sym => value)
    end
  end
end