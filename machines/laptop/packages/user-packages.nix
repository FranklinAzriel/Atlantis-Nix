{ pkgs, ... }: {

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
		ffmpeg
		vlc
		obs-studio
		
		# Tools
		qdiskinfo

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
    		additionalPrograms = [ ffmpeg ];

    		# Change Java runtimes available to Prism Launcher
    		jdks = [ "" ];
  		})
      
    javaPackages.compiler.temurin-bin.jre-8

	];
}