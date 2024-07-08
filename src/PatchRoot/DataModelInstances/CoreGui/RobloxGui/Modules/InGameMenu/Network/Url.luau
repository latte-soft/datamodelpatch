local l_ContentProvider_0 = game:GetService("ContentProvider");
local function v6()
    local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
    if l_BaseUrl_0:sub(#l_BaseUrl_0) ~= "/" then
        l_BaseUrl_0 = l_BaseUrl_0 .. "/";
    end;
    local _, v3 = l_BaseUrl_0:find("://");
    local v4, v5 = l_BaseUrl_0:find("%.", v3 + 1);
    return l_BaseUrl_0, l_BaseUrl_0:sub(v3 + 1, v4 - 1), (l_BaseUrl_0:sub(v5 + 1));
end;
local function v10(_, _, _)
    error("Attempt to modify read-only table");
end;
local function _(v11)
    return (setmetatable({}, {
        __index = v11, 
        __newindex = v10, 
        __metatable = false
    }));
end;
local v13, v14, v15 = v6();
return (setmetatable({}, {
    __index = {
        DOMAIN = v15, 
        PREFIX = v14, 
        BASE_URL = v13, 
        BASE_URL_SECURE = string.gsub(v13, "http://", "https://"), 
        API_URL = string.format("https://api.%s", v15), 
        APIS_URL = string.format("https://apis.%s", v15), 
        AUTH_URL = string.format("https://auth.%s", v15), 
        ACCOUNT_SETTINGS_URL = string.format("https://accountsettings.%s", v15), 
        AVATAR_URL = string.format("https://avatar.%s", v15), 
        CATALOG_URL = string.format("https://catalog.%s", v15), 
        CREATOR_HUB_URL = string.format("https://create.%s", v15), 
        GAME_URL = string.format("https://games.%s", v15), 
        GAME_ASSET_URL = string.format("https://assetgame.%s", v15), 
        CHAT_URL = string.format("https://chat.%sv2", v15), 
        FRIEND_URL = string.format("https://friends.%sv1", v15), 
        PRESENCE_URL = string.format("https://presence.%sv1", v15), 
        NOTIFICATION_URL = string.format("https://notifications.%s", v15), 
        REALTIME_URL = string.format("https://realtime.%s", v15), 
        WEB_URL = string.format("https://web.%s", v15), 
        WWW_URL = string.format("https://www.%s", v15), 
        ADS_URL = string.format("https://ads.%s", v15), 
        FOLLOWINGS_URL = string.format("https://followings.%s", v15), 
        ECONOMY_URL = string.format("https://economy.%s", v15), 
        THUMBNAILS_URL = string.format("https://thumbnails.%s", v15), 
        BADGES_URL = string.format("https://badges.%s", v15), 
        ACCOUNT_SETTINGS = string.format("https://accountsettings.%s", v15), 
        PREMIUM_FEATURES = string.format("https://premiumfeatures.%s", v15), 
        LOCALE = string.format("https://locale.%s", v15), 
        METRICS_URL = string.format("https://metrics.%sv1", v15), 
        APIS_RCS_URL = string.format("https://apis.rcs.%s", v15), 
        DISCUSSIONS_URL = string.format("https://discussions.%s", v15), 
        BLOG_URL = "https://blog.roblox.com/", 
        CORP_URL = "https://corp.roblox.com/", 
        GAME_I18N_URL = string.format("https://gameinternationalization.%s", v15), 
        getUserProfileUrl = function(v16, v17)
            return string.format("%susers/%s/profile", v16.BASE_URL, v17);
        end, 
        getUserFriendsUrl = function(v18, v19)
            return string.format("%susers/%s/friends", v18.BASE_URL, v19);
        end, 
        getUserInventoryUrl = function(v20, v21)
            return string.format("%susers/%s/inventory", v20.BASE_URL, v21);
        end, 
        getPlaceDefaultThumbnailUrl = function(v22, v23, v24, v25)
            return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", v22.BASE_URL, v24, v25, (tostring(v23)));
        end, 
        isVanitySite = function(v26)
            return v26.PREFIX ~= "www";
        end, 
        makeQueryString = function(_, v28)
            local v29 = {};
            for v30, v31 in pairs(v28) do
                if v31 ~= nil then
                    if type(v31) == "table" then
                        for v32 = 1, #v31 do
                            table.insert(v29, v30 .. "=" .. v31[v32]);
                        end;
                    else
                        table.insert(v29, v30 .. "=" .. tostring(v31));
                    end;
                end;
            end;
            return table.concat(v29, "&");
        end
    }, 
    __newindex = v10, 
    __metatable = false
}));
