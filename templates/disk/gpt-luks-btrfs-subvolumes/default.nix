{
	boot.loader.grub = {
		enable = true;
		efiSupport = true;
		efiInstallAsRemovable = true;
        device = "{{mainDisk}}";
	};
		
	disko.devices = {
		disk = {
			main = {
				name = "main-{{uuid}}";
				type = "disk";
				device = "{{mainDisk}}";
				content = {
					type = "gpt";
					partitions = {
                        boot = {
                            size = "1M";
                            type = "EF02";
                            attributes = [ 0 ]; # partition attribute
                        };
						ESP = {
							size = "512M";
							type = "EF00";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot";
								mountOptions = [ "umask=0077" ];
							};
						};
						luks = {
							size = "100%";
							content = {
								type = "luks";
								name = "crypted";
								# disable settings.keyFile if you want to use interactive password entry
								#passwordFile = "/tmp/secret.key"; # Interactive
								settings = {
									allowDiscards = true;
									keyFile = "/tmp/secret.key";
								};
								#additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
								content = {
									type = "btrfs";
									extraArgs = [ "-f" ];
									subvolumes = {
										"@" = {
											mountpoint = "/";
											mountOptions = [
												"compress=zstd:3"
												"lazytime"
												"strictatime"
											];
										};
										"@home" = {
											mountpoint = "/home";
											mountOptions = [
												"compress=zstd"
												"lazytime"
												"strictatime"
											];
										};
										"@nix" = {
											mountpoint = "/nix";
											mountOptions = [
												"compress=zstd:3"
												"lazytime"
												"strictatime"
											];
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
}