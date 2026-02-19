{ pkgs, ... }: {
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
		settings.General.DisplayServer = "wayland";
	};

	services.desktopManager.plasma6.enable = true;

	environment.plasma6.excludePackages = with pkgs; [
		kdePackages.elisa # Simple music player aiming to provide a nice experience for its users
    	kdePackages.kdepim-runtime # Akonadi agents and resources
    	kdePackages.kmahjongg # KMahjongg is a tile matching game for one or two players
    	kdePackages.kmines # KMines is the classic Minesweeper game
    	kdePackages.konversation # User-friendly and fully-featured IRC client
    	kdePackages.kpat # KPatience offers a selection of solitaire card games
    	kdePackages.ksudoku # KSudoku is a logic-based symbol placement puzzle
    	kdePackages.ktorrent # Powerful BitTorrent client
    	mpv
	];
	
	environment.systemPackages = with pkgs; [
		#inputs.matugen.packages.${system}.default
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

        kdePackages.krfb
        kdePackages.plasma-keyboard
        kdePackages.qtvirtualkeyboard
		kdePackages.kdenlive
    ];

	environment.variables = {
		KWIN_IM_SHOW_ALWAYS = "1";
	};
}