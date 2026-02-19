{ pkgs, ... }: {
# Temporary for ffmpeg-full, see https://github.com/NixOS/nixpkgs/issues/483540
nixpkgs.overlays = [
	(final: prev: {
		ffmpeg-full = prev.ffmpeg-full.override { withShaderc = false; };
	})
];
	environment.systemPackages = with pkgs; [
		# Shell
		fzf
		fastfetch

		# Social Media
		discord
		telegram-desktop

		(google-chrome.override {
			commandLineArgs = [
				"--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
			];
		})

		firefox

		# Development
		git
		uv
		gnupg
		python3
		python3Packages.pip
		virtualenv
		nodejs
		jq
		wget
		kubectl
		kubernetes-helm

		# IDE
		vscode

		# Multimedia
		ffmpeg-full
		vlc
		obs-studio
		
		# Tools
		qdiskinfo
		unrar
		rar

		# Idendity Management
		bitwarden-desktop
		kdePackages.kleopatra

		# Torrent
		qbittorrent
		transmission_4

		# Other
		htop
		btop

		# Games
		(prismlauncher.override {
			# Add binary required by some mod
			additionalPrograms = [ ffmpeg-full vlc ];

			# Change Java runtimes available to Prism Launcher
			jdks = [ "" ];
		})
			
		javaPackages.compiler.temurin-bin.jre-21
		javaPackages.compiler.temurin-bin.jre-8

		virt-manager

		(lutris.override {
			#extraLibraries = [];
				extraPkgs = pkgs: [
					pkgs.bibata-cursors
					pkgs.gamescope
				];		
		})
	];
}