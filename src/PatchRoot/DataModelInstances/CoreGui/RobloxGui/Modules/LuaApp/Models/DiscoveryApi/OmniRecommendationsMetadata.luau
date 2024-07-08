local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Result);
local v2 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.DiscoveryGame);
local v3 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.GameCoPlay);
local v4 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.CatalogAsset);
local v5 = require(l_Modules_0.LuaApp.Models.DiscoveryApi.CatalogBundle);
local v6 = require(l_Modules_0.LuaApp.Constants);
local l_PYMKCarouselModel_0 = require(l_Modules_0.LuaApp.Components.PYMKCarousel.api).PYMKCarouselModel;
local _ = require(l_Modules_0.Personalization.DataStoreTypes);
local v9 = require(l_Modules_0.LuaApp.mutedError);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_FFlagContactRecs_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagContactRecs;
local v13 = {
    new = function()
        return {};
    end
};
v13.mock = function()
    local v14 = v13.new();
    v14.metadata = {};
    return v14;
end;
local v15 = {
    [v6.OmniRecommendationsContentType.Game] = v2.fromJsonData, 
    [v6.OmniRecommendationsContentType.GameCoPlay] = v3.fromJsonData, 
    [v6.OmniRecommendationsContentType.CatalogAsset] = v4.fromJsonData, 
    [v6.OmniRecommendationsContentType.CatalogBundle] = v5.fromJsonData, 
    [v6.OmniRecommendationsContentType.RecommendedFriend] = if not l_FFlagContactRecs_0 and l_isSubjectToDesktopPolicies_0() then nil else l_PYMKCarouselModel_0.fromJsonData
};
getMetadataFromJsonData = function(v16, v17)
    for v18, v19 in pairs(v17) do
        local v20 = v15[v18];
        if v20 then
            if not v16.metadata[v18] then
                v16.metadata[v18] = {};
            end;
            for v21, v22 in pairs(v19) do
                local v23 = v20(v22);
                local v24 = nil;
                v23:match(function(v25)
                    if not v16.metadata[v18][v21] then
                        v16.metadata[v18][v21] = v25;
                        return ;
                    else
                        v9(string.format("Duplicate contentStringId %s found for type %s", v21, v18));
                        return ;
                    end;
                end):matchError(function(v26)
                    v24 = v26;
                end);
                if not v24 then
                    --[[ close >= 14 ]]
                else
                    return v1.error(v24);
                end;
            end;
        end;
    end;
end;
v13.fromJsonData = function(v27)
    local v28 = {
        metadata = {}
    };
    if not l_FFlagContactRecs_0 then
        for v29, v30 in pairs(v27.contentMetadata) do
            local v31 = v15[v29];
            if v31 then
                v28.metadata[v29] = {};
                for v32, v33 in pairs(v30) do
                    local v34 = v31(v33);
                    local v35 = nil;
                    v34:match(function(v36)
                        v28.metadata[v29][v32] = v36;
                    end):matchError(function(v37)
                        v35 = v37;
                    end);
                    if not v35 then
                        --[[ close >= 14 ]]
                    else
                        return v1.error(v35);
                    end;
                end;
            end;
        end;
    else
        getMetadataFromJsonData(v28, v27.contentMetadata);
        if v27.contentMetadataByStringId then
            getMetadataFromJsonData(v28, v27.contentMetadataByStringId);
        end;
    end;
    return v1.success(v28);
end;
return v13;
