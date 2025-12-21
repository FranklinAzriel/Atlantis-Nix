{ ... }: {
    programs.git = {
        enable = true;
        lfs.enable = true;
        settings = {
            user.name = "Franklin Azriel";
            user.email = "FranklinAzriel@FranklinAzriel.MY.ID";
        };
        signing.signByDefault = true;
        signing.key = "0x8D02FDA2CB47181C";
    };
}