Vagrant.configure("2") do |config|
    ## Choose your base box
    config.vm.box = "ubuntu/trusty64"

    ## For masterless, mount your salt file root
    config.vm.synced_folder "salt/roots/", "/srv/salt/"

    ## Use all the defaults:
    config.vm.provision :salt do |salt|

      salt.minion_config = "salt/minion"
      salt.run_highstate = true

    end

    ## Need quite a bit of CPU and Memory for ELK, it's a hog.
    config.vm.provider "virtualbox" do |v|
    
       v.memory = 2048

    end
	
	## Forward the kibana port
	config.vm.network "forwarded_port", guest: 5601, host: 5601
    config.vm.network "forwarded_port", guest: 80, host: 8000
  end
