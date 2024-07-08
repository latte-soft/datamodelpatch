local v0 = require(script:FindFirstAncestor("Squads").dependencies);
local l_SocialLibraries_0 = v0.SocialLibraries;
local l_Url_0 = v0.Url;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
return function(v4, v5)
    local l_universeId_0 = v5.universeId;
    local v7 = l_getDeepValue_0(v4, string.format("Squad.Games.byGameId.%s.name", l_universeId_0));
    local v8 = l_getDeepValue_0(v4, string.format("Squad.Games.byGameId.%s.rootPlaceId", l_universeId_0));
    local v9 = l_getDeepValue_0(v4, string.format("Squad.Games.byGameId.%s.maxPlayers", l_universeId_0));
    local v10 = l_getDeepValue_0(v4, string.format("Squad.Games.mediaByGameId.%s", l_universeId_0));
    local v11 = nil;
    if v10 ~= nil then
        for _, v13 in ipairs(v10) do
            if v13.assetTypeId == 1 then
                v11 = "http://www.roblox.com/asset/?id=" .. tostring(v13.imageId);
                break;
            end;
        end;
        if v11 == nil then
            v11 = l_Url_0:getPlaceDefaultThumbnailUrl(v8, 640, 360);
        end;
    end;
    return {
        experienceName = v7, 
        experienceImageId = v11, 
        experienceServerSize = v9, 
        screenSize = v4.ScreenSize
    };
end;
