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

    ## Some instruction post-vagrant up
    config.vm.post_up_message = "Congratulations, your ELK Stack VM is ready. To SSH into the node, type vagarant ssh. To learn more about ELK, visit http://127.0.0.1:8000 in your browser, or to jump right into Kibana, visit http://127.0.0.1:5601 in your browser. A modern browser is required."

  end
