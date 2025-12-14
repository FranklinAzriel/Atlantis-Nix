# ---
# schema = "single-disk"
# [placeholders]
# mainDisk = "/dev/disk/by-id/scsi-36056fb91aee84b02b7e7a410f471272c" 
# ---
# This file was automatically generated!
# CHANGING this configuration requires wiping and reinstalling the machine
{
	boot.loader.grub = {
		enable = true;
		efiSupport = true;
		efiInstallAsRemovable = true;
		device = "/dev/disk/by-id/scsi-36056fb91aee84b02b7e7a410f471272c";
	};
		
	disko.devices = {
		disk = {
			main = {
				name = "main-41904667b4704d7393abd5f5e353f36c";
				type = "disk";
				device = "/dev/disk/by-id/scsi-36056fb91aee84b02b7e7a410f471272c";
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