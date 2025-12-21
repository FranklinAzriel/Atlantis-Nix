{ lib, pkgs, self, ... }: {
	imports = [ self.inputs.lanzaboote.nixosModules.lanzaboote ];

	# Lanzaboote currently replaces the systemd-boot module.
    # This setting is usually set to true in configuration.nix
    # generated at installation time. So we force it to false
    # for now.

    boot.loader.systemd-boot.enable = lib.mkForce false;

	boot.loader.efi = {
		canTouchEfiVariables = true;
		efiSysMountPoint = "/efi";
	};

	environment.systemPackages = with pkgs; [
		efibootmgr
		sbctl
	];

	boot.lanzaboote = {
		enable = true;
		pkiBundle = "/var/lib/sbctl";
	};


}