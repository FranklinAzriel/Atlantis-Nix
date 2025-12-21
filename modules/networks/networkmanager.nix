{ ... }: {
	networking.networkmanager = {
		enable = true;
		wifi = {
			backend = "iwd";
			powersave = true;
		};
	};

	users.users.FranklinAzriel.extraGroups = [ "networkmanager" ];
}
