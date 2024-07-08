local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
local _ = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v3 = require(l_Modules_0.LuaApp.Components.WebViewStub);
local v4 = require(l_Modules_0.Common.Roact);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_Modules_0.LuaApp.Thunks.Moderation.ResetModeration);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
return function(v11)
    local v12 = l_useDispatch_0();
    v8.useEffect(function()
        return function()
            v12(v9());
        end;
    end, {});
    if not l_default_0.isEnabled() or v10() then
        return v4.createElement(v1, {
            isVisible = true, 
            url = v11.url
        });
    else
        return v4.createElement(v3, {
            isVisible = true
        });
    end;
end;
