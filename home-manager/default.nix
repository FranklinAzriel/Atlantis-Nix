{ self, ...}: {
  	imports = [ self.inputs.home-manager.nixosModules.default ];
  	home-manager.users.FranklinAzriel = {
		imports = [
		  ./home-configuration.nix
		];
  	};
}