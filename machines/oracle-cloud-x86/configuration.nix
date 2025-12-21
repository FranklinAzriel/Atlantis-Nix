{
	imports = [
		../../modules
#    ../../modules/k3s-server.nix

    #../../modules/systemd-boot.nix
	];

	# New machine!

	#swapDevices = [ {
			#device = "/var/lib/swapfile";
			#size = 4*1024;
	#} ];

	services.spice-vdagentd.enable = true;
	services.qemuGuest.enable = true;

}
