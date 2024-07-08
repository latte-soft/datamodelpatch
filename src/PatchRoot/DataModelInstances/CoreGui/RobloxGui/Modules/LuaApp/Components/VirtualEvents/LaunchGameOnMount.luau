local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Enum.PlayButtonStates);
return v3.connect(function(v5)
    return {
        universeId = v5.universeId, 
        launchSource = v5.launchSource, 
        referralSource = v5.referralSource
    };
end, function(v6)
    return {
        playabilityStatus = v6.playabilityStatus, 
        playButtonState = v6.playButtonState, 
        onPlayButtonActivated = v6.onPlayButtonActivated
    };
end)(function(v7)
    v2.useEffect(function()
        if v7.playButtonState == v4.Playable then
            if v7.onGameLaunching then
                v7.onGameLaunching();
            end;
            v7.onPlayButtonActivated();
        end;
    end, {
        v7.playButtonState
    });
    return nil;
end);
