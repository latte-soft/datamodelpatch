local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.AddOmniRecommendations);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.AddContentMetadata);
local v5 = require(l_CorePackages_0.Cryo);
local v6 = require(l_Modules_0.LuaApp.Constants);
return v2.createReducer({}, {
    [v4.name] = function(v7, v8)
        v7 = v7 or {};
        if v8.contentMetadata[v6.OmniRecommendationsContentType.CatalogAsset] then
            v7 = v5.Dictionary.join(v7, v8.contentMetadata[v6.OmniRecommendationsContentType.CatalogAsset]);
        end;
        return v7;
    end, 
    [v3.name] = function(v9, v10)
        v9 = v9 or {};
        for _, v12 in pairs(v10.recommendations) do
            local v13 = v12.metadata[v6.OmniRecommendationsContentType.CatalogAsset];
            if v13 then
                v9 = v5.Dictionary.join(v9, v13);
            end;
        end;
        return v9;
    end
});
