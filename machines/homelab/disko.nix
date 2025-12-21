# ---
# schema = "single-disk"
# [placeholders]
# mainDisk = "/dev/disk/by-id/ata-TOSHIBA_MK1655GSX_Z9OKTXH0T" 
# ---
# This file was automatically generated!
# CHANGING this configuration requires wiping and reinstalling the machine
{
	boot.loader.grub = {
		enable = true;
		efiSupport = true;
		efiInstallAsRemovable = true;
		device = "/dev/disk/by-id/ata-TOSHIBA_MK1655GSX_Z9OKTXH0T";
	};
		
	disko.devices = {
		disk = {
			main = {
				name = "main-baa7281e042d4979b0f5fc7c1bb87ec4";
				type = "disk";
				device = "/dev/disk/by-id/ata-TOSHIBA_MK1655GSX_Z9OKTXH0T";
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
												"compress=zstd:1"
												"lazytime"
												"strictatime"
											];
										};
										"@home" = {
											mountpoint = "/home";
											mountOptions = [
												"compress=zstd:1"
												"lazytime"
												"strictatime"
											];
										};
										"@nix" = {
											mountpoint = "/nix";
											mountOptions = [
												"compress=zstd:1"
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