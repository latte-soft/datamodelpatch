local v0 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local v1 = game:DefineFastInt("LuaAppJoinGameFailureInfluxHundredthsPercentage", 0);
return function(v2, v3, v4)
    v4 = v4 or {};
    v0.isType(v3, "string", "documentName");
    v2:reportSeries(v3, v4, v1);
end;
