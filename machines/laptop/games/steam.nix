{ pkgs, ... }: {
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		extraCompatPackages = with pkgs; [
			vkd3d-proton
			proton-ge-bin
		];
		extraPackages = [ pkgs.bibata-cursors ];
	};
}