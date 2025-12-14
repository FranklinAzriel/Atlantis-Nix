# ---
# schema = "gpt-luks-btrfs-subvolumes"
# [placeholders]
# mainDisk = "/dev/disk/by-id/scsi-360936234527a43419b3b96fcffcc2e75" 
# ---
# This file was automatically generated!
# CHANGING this configuration requires wiping and reinstalling the machine
{
	boot.loader.grub = {
		enable = true;
		efiSupport = true;
		efiInstallAsRemovable = true;
		device = "/dev/disk/by-id/scsi-360936234527a43419b3b96fcffcc2e75";
	};

	disko.devices = {
		disk = {
			main = {
				name = "main-6e3816594a1b435784dbd2aaccd847ad";
				type = "disk";
				device = "/dev/disk/by-id/scsi-360936234527a43419b3b96fcffcc2e75";
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