{
	imports = [
		./hardware-configuration.nix
		../../modules
		./bootloader.nix
    ./kernel.nix

		./desktop
		./games
		./packages
    ./flatpak.nix
		./pipewire.nix
		./sysrq.nix

    ../../modules/virtualization/libvirt.nix
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
