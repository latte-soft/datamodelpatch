local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_Modules_0.LuaApp.Http.Url);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFStringApisCdnUrl);
local v6 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAutocompleteIXPConfig);
local v7 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppDisableACGetSuggestionCDN);
local function _(v8)
    return v3.Dictionary.join(v8, {
        autocompleteUseCDN = v3.None, 
        autocompleteUseGetMethodCDN = v3.None, 
        autocompletePreloadedCache = v3.None, 
        isAvatarAutocompleteEnabled = v3.None
    });
end;
return function(v10, v11, v12)
    local v13 = nil;
    if v6() then
        v13 = l_HttpService_0:JSONEncode((v3.Dictionary.join(v12 or {}, {
            autocompleteUseCDN = v3.None, 
            autocompleteUseGetMethodCDN = v3.None, 
            autocompletePreloadedCache = v3.None, 
            isAvatarAutocompleteEnabled = v3.None
        })));
        v13 = if v13 ~= "[]" then l_HttpService_0:UrlEncode(v13) else "";
    end;
    local v14 = v5();
    if v7() then
        v14 = v4.APIS_URL;
    end;
    local v15 = string.format("%sgames-autocomplete/v1/get-suggestion/%s", v14, (l_HttpService_0:UrlEncode(v11)));
    local _ = nil;
    local v17 = v15 .. if v13 ~= nil and v13 ~= "" then "?args=" .. v13 else "";
    if string.len(v17) > 2000 then
        warn("AutocompleteGameGetSuggestion URL max length exceeded", v17);
        v17 = v15;
    end;
    return v10(v17, "GET", {
        timeout = 5000
    });
end;
