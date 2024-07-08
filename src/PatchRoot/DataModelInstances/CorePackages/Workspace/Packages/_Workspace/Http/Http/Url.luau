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
local v16 = string.format("https://api.%s", v15);
local v17 = string.format("https://apis.%s", v15);
local v18 = string.format("https://auth.%s", v15);
local v19 = string.format("https://accountsettings.%s", v15);
local v20 = string.format("https://avatar.%s", v15);
local v21 = string.format("https://catalog.%s", v15);
local v22 = string.format("https://create.%s", v15);
local v23 = string.format("https://inventory.%s", v15);
local v24 = string.format("https://chat.%sv2", v15);
local v25 = string.format("https://friends.%sv1", v15);
local v26 = string.format("https://users.%sv1", v15);
local v27 = string.format("https://assetgame.%s", v15);
local v28 = string.format("https://games.%s", v15);
local v29 = string.format("https://groups.%s", v15);
local v30 = string.format("https://notifications.%s", v15);
local v31 = string.format("https://presence.%sv1", v15);
local v32 = string.format("https://realtime.%s", v15);
local v33 = string.format("https://web.%s", v15);
local v34 = string.format("https://www.%s", v15);
local v35 = string.format("https://ads.%s", v15);
local v36 = string.format("https://adconfiguration.%s", v15);
local v37 = string.format("https://followings.%s", v15);
local v38 = string.format("https://economy.%s", v15);
local v39 = string.format("https://thumbnails.%s", v15);
local v40 = string.format("https://accountsettings.%s", v15);
local v41 = string.format("https://premiumfeatures.%s", v15);
local v42 = string.format("https://locale.%s", v15);
local v43 = string.format("https://badges.%s", v15);
local v44 = string.format("https://metrics.%sv1", v15);
local v45 = string.format("https://apis.rcs.%s", v15);
local v46 = string.format("https://discussions.%s", v15);
local v47 = string.format("https://contacts.%s", v15);
local v48 = string.format("https://search.%s", v15);
local v49 = string.format("https://static.%s", v15);
local v50 = string.format("https://gamesearchuitreatments.api.%s", v15);
local v51 = string.format("https://economycreatorstats.%s", v15);
local v52 = string.format("https://usermoderation.%s", v15);
local v53 = string.gsub(v13, "http://", "https://");
local v54 = string.format("https://voice.%s", v15);
local v55 = string.format("https://translations.%s", v15);
local v56 = string.format("https://twostepverification.%s", v15);
local v57 = string.format("https://privatemessages.%sv1", v15);
local l_v49_0 = v49;
if v15 == "roblox.com/" then
    l_v49_0 = string.gsub(l_v49_0, v15, "rbxcdn.com/");
end;
return (setmetatable({}, {
    __index = {
        DOMAIN = v15, 
        PREFIX = v14, 
        BASE_URL = v53, 
        BASE_URL_SECURE = v53, 
        API_URL = v16, 
        APIS_URL = v17, 
        AUTH_URL = v18, 
        ACCOUNT_SETTINGS_URL = v19, 
        AVATAR_URL = v20, 
        CATALOG_URL = v21, 
        CREATOR_HUB_URL = v22, 
        INVENTORY_URL = v23, 
        GAME_URL = v28, 
        GAME_ASSET_URL = v27, 
        GROUPS_URL = v29, 
        CHAT_URL = v24, 
        FRIEND_URL = v25, 
        USERS_URL = v26, 
        PRESENCE_URL = v31, 
        NOTIFICATION_URL = v30, 
        REALTIME_URL = v32, 
        WEB_URL = v33, 
        WWW_URL = v34, 
        ADS_URL = v35, 
        AD_CONFIGURATION_URL = v36, 
        SEARCH_URL = v48, 
        GAME_SEARCH_UI_TREATMENTS = v50, 
        FOLLOWINGS_URL = v37, 
        ECONOMY_URL = v38, 
        THUMBNAILS_URL = v39, 
        BADGES_URL = v43, 
        ACCOUNT_SETTINGS = v40, 
        PREMIUM_FEATURES = v41, 
        LOCALE = v42, 
        METRICS_URL = v44, 
        APIS_RCS_URL = v45, 
        DISCUSSIONS_URL = v46, 
        CONTACTS_URL = v47, 
        STATIC_URL = v49, 
        STATIC_CDN_URL = l_v49_0, 
        BLOG_URL = "https://blog.roblox.com/", 
        CORP_URL = "https://corp.roblox.com/", 
        STORE_URL = "https://www.amazon.com/roblox", 
        ECNOMY_CREATOR_STATS = v51, 
        USER_MODERATION_URL = v52, 
        VOICE_URL = v54, 
        TRANSLATIONS_URL = v55, 
        TWOSTEPVERIFICATION_URL = v56, 
        PRIVATEMESSAGES_URL = v57, 
        getUserProfileUrl = function(v59, v60)
            return string.format("%susers/%s/profile", v59.BASE_URL, v60);
        end, 
        getUserFriendsUrl = function(v61, v62)
            return string.format("%susers/%s/friends", v61.BASE_URL, v62);
        end, 
        getUserInventoryUrl = function(v63, v64)
            return string.format("%susers/%s/inventory", v63.BASE_URL, v64);
        end, 
        getPlaceDefaultThumbnailUrl = function(v65, v66, v67, v68)
            return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", v65.BASE_URL, v67, v68, (tostring(v66)));
        end, 
        isVanitySite = function(v69)
            return v69.PREFIX ~= "www";
        end, 
        makeQueryString = function(_, v71)
            local v72 = {};
            for v73, v74 in pairs(v71) do
                if v74 ~= nil then
                    if type(v74) == "table" then
                        for v75 = 1, #v74 do
                            table.insert(v72, v73 .. "=" .. v74[v75]);
                        end;
                    else
                        table.insert(v72, v73 .. "=" .. tostring(v74));
                    end;
                end;
            end;
            return table.concat(v72, "&");
        end, 
        stripHttpsAndTrailingSlash = function(v76)
            return (string.gsub(string.gsub(v76, "^https://", ""), "/*$", ""));
        end
    }, 
    __newindex = v10, 
    __metatable = false
}));
