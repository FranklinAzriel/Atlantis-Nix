{ ... }: {
    programs.git = {
        enable = true;
        lfs.enable = true;
        settings = {
            user.name = "FranklinAzriel";
            user.email = "Owner@FranklinAzriel.MY.ID";
        };
        signing.signByDefault = true;
        signing.key = "0x8D02FDA2CB47181C";
    };
}