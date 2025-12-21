{ pkgs, ... }: {

	security.rtkit.enable = true;
	
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
		wireplumber.enable = true;
	};

	services.pipewire.configPackages = [
	    (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/10-allowed-sample-rates.conf" 
      	''
        context.properties = {
            default.clock.allowed-rates = [ 44100 48000 88200 96000 176400 192000 352800 384000 ]
        }
      	''
    	)
  	];
}