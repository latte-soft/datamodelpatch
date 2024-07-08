local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.LocalizationContext);
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.AvatarExperience.Flags.GetAXAutocompleteUseCDN);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFStringApisCdnUrl);
return function(v7, v8)
    local v9 = string.format("%sautocomplete-avatar/v2/suggest", if not v5() then v4.APIS_URL else v6());
    local v10 = nil;
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if l_RobloxLocaleId_0 ~= nil then
        v10 = v3.getBaseLanguage(l_RobloxLocaleId_0);
    end;
    if v10 == nil then
        v10 = "en";
    elseif v10 ~= "en" then
        v10 = v10 .. ",en";
    end;
    return v7(v9 .. "?limit=10&prefix=" .. l_HttpService_0:UrlEncode(v8) .. "&lang=" .. l_HttpService_0:UrlEncode(v10), "GET", {
        timeout = 5000
    });
end;
