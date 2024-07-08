return require(game:GetService("CorePackages").Rodux).makeActionCreator("SET_RESPAWN_BEHAVIOR", function(v0, v1)
    return {
        respawnEnabled = v0, 
        customCallback = v1
    };
end);
