local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Debug.LogTree).logger("ax.rn.overlay");
return function(v1, v2)
    v0:info("onOverlayClosed {}, captureFocus: {}", v1, v2);
end;
