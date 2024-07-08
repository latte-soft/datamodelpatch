local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.LuaApp.Http.Url);
local _ = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptType);
local v5 = {
    webViewUrlAccountSettings = v3.WWW_URL .. "my/account#/security?src=authpopup", 
    webViewUrlEmailHighlight = v3.WWW_URL .. "my/account#/security?src=emailhighlight", 
    webViewUrlHelpPage = "https://en.help.roblox.com/hc/articles/212459863"
};
v5.getWebViewUrlAccountSettings = function()
    return v5.webViewUrlAccountSettings;
end;
v5.getWebViewUrlEmailHighlight = function()
    return v5.webViewUrlEmailHighlight;
end;
v5.getWebViewUrlHelpPage = function()
    return v5.webViewUrlHelpPage;
end;
return v5;
