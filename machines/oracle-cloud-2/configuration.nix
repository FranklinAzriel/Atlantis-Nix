{
	imports = [
		../../modules/root-password.nix
		../../modules/zram-generator.nix
		../../modules/docker.nix
	];

	# New machine!

	#swapDevices = [ {
			#device = "/var/lib/swapfile";
			#size = 4*1024;
	#} ];

	services.spice-vdagentd.enable = true;
	services.qemuGuest.enable = true;

}
