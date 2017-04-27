require 'yaml'
require 'capistrano'
require 'capistrano/cli'
require 'rubygems'
require 'thor'

class Provision < Thor
  
  method_option :env_name, :default => "dev"
  method_option :art_name, :default => "customer-portal"
  method_option :art_version, :default => "1.0-SNAPSHOT"  
  
  desc "deploysnapshot", "Deploy latest snapshot artifact"
  def deploysnapshot
    
    envs = ENVS[options[:env_name]]
    artifacts = ARTIFACTS[options[:art_name]]
    host = envs['host']
    key = "/home/dev/.ssh/" + envs['key'] + ".pem"
    artifact_path = "/home/dev/.m2/repository/"+ artifacts['groupid'] + "/" + options[:art_name] + "/" + options[:art_version]
    artifact_name = options[:art_name] + "-" + options[:art_version] + "." + artifacts['type']
    artifact = artifact_path + "/" + artifact_name
    destinaton = artifacts['destination'] + "/" + options[:art_name] + "." + artifacts['type']
    
    puts host
    puts key
    puts artifact
    puts destinaton
    
    parameters = [
      "deploy_artifact",
      "-S", "hosts=#{host}",
      "-S", "keys=#{key}",
      "-s", "artifact=#{artifact}",
      "-s", "deploypath=#{destinaton}",
      "-s", "artname=#{artifact_name}"
    ]
    Capistrano::CLI.parse(parameters).execute!
  end

end
