{ ... }:
{
	services.zram-generator = {
    	enable = true; # Enable zram-generator service
    	settings.zram0 = {
        	compression-algorithm = "zstd";
        	zram-size = "ram";
        	swap-priority = 32767; # Set high priority for zram before other swap devices.
        	fs-type = "swap";
    	};
	};

	#boot.kernel.sysctl = {
		#"vm.page-cluster" = 0;
		#"vm.vfs_cache_pressure" = 500;
		#"vm.swappiness" = 120;
	#};
}