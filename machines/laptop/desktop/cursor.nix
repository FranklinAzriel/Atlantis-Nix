{ pkgs, config, ... }: {
	system.fsPackages = [ pkgs.bindfs ];
	environment.systemPackages = [ pkgs.bibata-cursors ];

	fileSystems = let
		mkRoSymBind = path: {
			device = path;
			fsType = "fuse.bindfs";
			options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
		};
		aggregated = pkgs.buildEnv {
			name = "system-fonts-and-icons";
			paths = config.fonts.packages ++ (with pkgs; [
					bibata-cursors
		]);
			pathsToLink = [ "/share/fonts" "/share/icons" ];
		};
		in {
			"/usr/share/fonts" = mkRoSymBind "${aggregated}/share/fonts";
			"/usr/share/icons" = mkRoSymBind "${aggregated}/share/icons";
	};
}