{
	imports = [
		./hardware-configuration.nix
		../../modules
		./bootloader.nix

		./desktop
		./games
		./packages
		./pipewire.nix
		./sysrq.nix
    ./waydroid.nix
	];

	time.timeZone = "Asia/Jakarta";
	nixpkgs.config.allowUnfree = true;
  networking.hostName = "Holy-Nix";

	# New machine!

	#swapDevices = [ {
			#device = "/var/lib/swapfile";
			#size = 4*1024;
	#} ];
}
