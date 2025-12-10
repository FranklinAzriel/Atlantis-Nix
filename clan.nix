{
  	# Set metadata for clan
  	meta = {
		name = "Atlantis-Nix";
  		domain = "ocean";
		description = "Personal NixOS machines for Atlantis";
	};

  	inventory = {
		machines = {
			# Define machines here.
			# Tags schema:
			# [Form] [Location] [Owner] [Country] etc
			oracle-cloud = {	
				tags = [ "virtual" "cloud" "personal" "singapore" ];
			};
  		};

  		# Docs: See https://docs.clan.lol/services/definition/
  		instances = {
			# Docs: https://docs.clan.lol/services/official/admin/
			# Admin service for managing machines
			# This service adds a root password and SSH access.
			admin = {
	  			roles.default = {
					tags = [ "personal" ];
	  				settings.allowedKeys = {
						# Insert the public key that you want to use for SSH access.
						# All keys will have ssh access to all machines ("tags.all" means 'all machines').
						# Alternatively set 'users.users.root.openssh.authorizedKeys.keys' in each machine
						"Trusted Key" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILl50pmugL84aI4kD038ls1NKgyDAv5oERwESf3SAYZT";
						"Trusted Backup Key" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMuViZcCcDLwNC1rJ26l8eBUV6DitM/O8B+akDN/Q9y8";
					};
	  			};
			};

			FranklinAzriel-user = {
				module.name = "users";
				roles.default = {
					tags = [ "personal" ];
					settings = {
						user = "FranklinAzriel";
						groups = [ "wheel" ];
					};
				};
			};

			roles.default.extraModules = [ ./home-manager ];

			# Docs: https://docs.clan.lol/services/official/zerotier/
			# The lines below will define a zerotier network and add all machines as 'peer' to it.
			# !!! Manual steps required:
			#   - Define a controller machine for the zerotier network.
			#   - Deploy the controller machine first to initialize the network.
			zerotier = {
	  			# Replace with the name (string) of your machine that you will use as zerotier-controller
	  			# See: https://docs.zerotier.com/controller/
	  			# Deploy this machine first to create the network secrets
	  			roles.controller.machines."oracle-cloud" = { };
	  			# Peers of the network
	  			# tags.all means 'all machines' will joined
	  			roles.peer.tags = [ "personal" ];
			};
  		};
	};

  	# Additional NixOS configuration can be added here.
  	# machines/jon/configuration.nix will be automatically imported.
  	# See: https://docs.clan.lol/guides/inventory/autoincludes/
  	machines = {
		# jon = { config, ... }: {
		#   environment.systemPackages = [ pkgs.asciinema ];
		# };
  	};
}
