require 'yaml'

ENVS = YAML.load_file("yaml/environments.yaml") unless defined? ENVS
ARTIFACTS = YAML.load_file("yaml/artifacts.yaml") unless defined? ARTIFACTS
