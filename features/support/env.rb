require 'cucumber'
require 'rspec'
require 'excon'
require 'pry'
require 'faker'
require 'json-schema'
require 'jsonpath'

# Concatenar a rota com a URI base que virá do arquivo de configuração

ENVIRONMENT = ENV["ENVIRONMENT"]

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENVIRONMENT}.yaml"))

$base_uri = CONFIG["uri"]