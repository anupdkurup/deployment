set :application, "test"
set :user, "ec2-user"
set :use_sudo, true

set :ssh_options, { :keys => "#{keys}", :forward_agent => true, :global_known_hosts_file => "/dev/null", :user_known_hosts_file => "/dev/null", :paranoid => false }


task(:deploy_artifact, :hosts => "#{hosts}") do
  upload("#{artifact}", "/home/ec2-user/#{artname}", :via => :scp)
  sudo("cp /home/ec2-user/#{artname} #{deploypath}")
end
