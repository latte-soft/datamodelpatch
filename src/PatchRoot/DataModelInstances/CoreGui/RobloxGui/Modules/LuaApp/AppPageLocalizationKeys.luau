local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPageProperties);
local v1 = {};
for v2, v3 in pairs(v0) do
    v1[v2] = v3.nameLocalizationKey;
end;
return v1;
