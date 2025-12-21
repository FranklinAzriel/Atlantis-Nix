{ pkgs, ... }: {
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		settings.General.DisplayServer = "wayland";
	};

	services.desktopManager.plasma6.enable = true;
	
	environment.systemPackages = with pkgs; [
        # KDE Plasma basic packages
        kdePackages.plasma-desktop
        kdePackages.plasma-vault
        kdePackages.qtsvg
        kdePackages.filelight
        kdePackages.kolourpaint
        kdePackages.kteatime

        # KDE Plasma partition tools
        kdePackages.partitionmanager
        kdiskmark
    ];
}