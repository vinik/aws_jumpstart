ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANTFILE_API_VERSION = "2"

CURRENT_DIR = Dir.pwd

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "terraform" do |web|
    web.vm.provider "docker" do |docker|
      docker.name = "aws_jumpstart"
      docker.build_dir = "."
      # docker.image = "ubuntu:trusty"
      docker.privileged = true
      docker.volumes = [ CURRENT_DIR + ":/workspace" ]
      docker.env = [

        "TF_VAR_prefix" = "", # "TF_VAR_prefix" = "my_company",
        "TF_VAR_domain" = "", # "TF_VAR_domain" = "my_domain.com"

        "TF_VAR_aws_access_key" = "",
        "TF_VAR_aws_secret_key" = "",
        "TF_VAR_region" = "us-east-1", # "TF_VAR_region" = "us-east-1"
        
        "TF_VAR_keyfile" = "", # "TF_VAR_keyfile" = "~/.ssh/id_rsa.pub"

      ]
    end

    web.vm.provision "docker" do |docker|
    end
  end

end
