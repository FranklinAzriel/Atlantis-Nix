{ ... }: {
	services.fail2ban = {
		enable = true;
		maxretry = 3;
		ignoreIP = [
			"10.127.17.0/8"
		];
		bantime = "5m";
	};
}