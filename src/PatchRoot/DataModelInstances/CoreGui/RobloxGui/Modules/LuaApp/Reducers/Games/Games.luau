local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Actions.Games.AddGames);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.AddContentMetadata);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_Modules_0.LuaApp.Constants);
local function v12(v7, v8)
    local v9 = {};
    for v10, _ in pairs(v8) do
        if not v7[v10] then
            v9[v10] = v8[v10];
        else
            v9[v10] = v5.Dictionary.join(v7[v10], v8[v10]);
        end;
    end;
    return (v5.Dictionary.join(v7, v9));
end;
return function(v13, v14)
    v13 = v13 or {};
    assert(v13, "");
    if v14.type == v2.name then
        v13 = v12(v13, v14.games);
    end;
    if v14.type == v4.name and v14.contentMetadata[v6.OmniRecommendationsContentType.Game] ~= nil then
        v13 = v12(v13, v14.contentMetadata[v6.OmniRecommendationsContentType.Game]);
    end;
    if v14.type == v3.name then
        for _, v16 in pairs(v14.recommendations) do
            local v17 = v16.metadata[v6.OmniRecommendationsContentType.Game];
            if v17 then
                return (v12(v13, v17));
            end;
        end;
    end;
    return v13;
end;
