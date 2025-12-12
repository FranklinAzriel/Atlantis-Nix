{
	imports = [
		../../modules/zram-generator.nix
	];

	# New machine!

	swapDevices = [ {
    	device = "/var/lib/swapfile";
    	size = 4*1024;
  	} ];

}
