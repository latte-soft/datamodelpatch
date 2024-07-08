local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_Modules_0.LuaApp.AppPage);
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_Modules_0.Personalization.Flags.FFlagOmniItemsRowDataEnabled);
local v7 = v2.strictInterface({
    absPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    gameSetTypeId = v2.string, 
    sortPos = v2.number, 
    locale = v2.string, 
    thumbnailAssetIds = v2.optional(v2.string), 
    componentType = v2.optional(v2.string), 
    gameSetTargetId = v2.optional(v2.number), 
    pageId = v2.optional(v2.string), 
    adFlags = v2.optional(v2.string), 
    adIds = v2.optional(v2.string), 
    rows = v2.optional(v2.string), 
    rowsOnPage = if not v6 then nil else v2.optional(v2.string), 
    positionsInRows = if not v6 then nil else v2.optional(v2.string)
});
local v8 = v2.strictInterface({
    absPositions = v2.string, 
    rootPlaceIds = v2.string, 
    universeIds = v2.string, 
    gameSetTypeId = v2.string, 
    locale = v2.string, 
    seeAllFlag = v2.number, 
    gameSetTargetId = v2.optional(v2.number), 
    pageId = v2.optional(v2.string), 
    adFlags = v2.optional(v2.string), 
    adIds = v2.optional(v2.string)
});
local v9 = {
    [v4.Home] = v7, 
    [v4.Games] = v7, 
    [v4.SearchPage] = v2.strictInterface({
        absPositions = v2.string, 
        rootPlaceIds = v2.string, 
        universeIds = v2.string, 
        searchUuid = v2.string, 
        emphasisFlag = v2.number, 
        seeAllFlag = v2.number, 
        sortPos = v2.optional(v2.number), 
        gameSetTypeId = v2.optional(v2.string), 
        locale = v2.optional(v2.string), 
        adFlags = v2.optional(v2.string), 
        adIds = v2.optional(v2.string)
    }), 
    recommended = v2.strictInterface({
        absPositions = v2.string, 
        rootPlaceIds = v2.string, 
        universeIds = v2.string, 
        refId = v2.string, 
        adFlags = v2.optional(v2.string), 
        adIds = v2.optional(v2.string), 
        locale = v2.optional(v2.string)
    })
};
return function(v10, v11, v12)
    local v13 = nil;
    v13 = if not not v12.seeAllFlag and (not (v11 ~= v4.Home) or v11 == v4.Games) then v8 else v9[v11];
    if not v13 then
        v5(string.format("Missing interface for eventContext %s to type check gameImpressions event parameters", v11));
    else
        local v14, v15 = v13(v12);
        if not v14 then
            v5(v15);
        end;
    end;
    v10:sendEventDeferred(v11, v3.ImpressionsEvents.Game, v12);
end;
