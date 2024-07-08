local v0 = {};
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = function(v2)
    local _, v4 = v2:find("%.");
    local v5 = v2:sub(v4 + 1);
    if v5:sub(-1) ~= "/" then
        v5 = v5 .. "/";
    end;
    return v5;
end;
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
local _, v9 = l_BaseUrl_0:find("%.");
local v10 = l_BaseUrl_0:sub(v9 + 1);
if v10:sub(-1) ~= "/" then
    v10 = v10 .. "/";
end;
local l_v10_0 = v10;
local v12 = {
    GAME_URL = string.format("https://games.%s", l_v10_0), 
    RCS_URL = string.format("https://apis.rcs.%s", l_v10_0), 
    APIS_URL = string.format("https://apis.%s", l_v10_0), 
    ACCOUNT_SETTINGS_URL = string.format("https://accountsettings.%s", l_v10_0), 
    GAME_INTERNATIONALIZATION_URL = string.format("https://gameinternationalization.%s", l_v10_0), 
    LOCALE_URL = string.format("https://locale.%s", l_v10_0), 
    ROLES_URL = string.format("https://users.%s", l_v10_0)
};
setmetatable(v0, {
    __newindex = function(_, _, _)
    end, 
    __index = function(_, v17)
        return v12[v17];
    end
});
return v0;
