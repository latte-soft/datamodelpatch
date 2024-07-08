local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
return function(v3)
    return v1.createElement("Sound", {
        SoundId = v2.Sounds[v3.SoundName]
    });
end;
