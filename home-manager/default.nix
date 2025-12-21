{ self, ...}: {
	imports = [ self.inputs.home-manager.nixosModules.default ];
	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		users.FranklinAzriel = {
			imports = [
				./home-configuration.nix
			];
		};
	};
}