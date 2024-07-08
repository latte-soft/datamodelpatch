local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v2 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v3 = require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
local _ = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v5 = require(l_Modules_0.LuaApp.Components.WebViewStub);
local v6 = require(l_Modules_0.LuaApp.Thunks.UpdateLocalPlayerInfo);
local v7 = require(l_Modules_0.Common.Roact);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.WebViewProtocol).default;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v11 = require(l_CorePackages_0.Packages.React);
local v12 = require(l_Modules_0.LuaApp.Components.SettingsNativeWrapper);
local v13 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseSettingsNativeWrapper);
return function(v15)
    local v16 = l_useDispatch_0();
    local v17 = v1(v2);
    v11.useEffect(function()
        return function()
            v16(v6(v17));
        end;
    end, {});
    if not v14() then
        if not l_default_0.isEnabled() or v13() then
            return v7.createElement(v3, {
                isVisible = v15.isVisible, 
                DisplayOrder = v15.displayOrder, 
                url = v15.url, 
                title = v15.title, 
                titleKey = v15.titleKey
            });
        else
            return v7.createElement(v5, {
                isVisible = v15.isVisible, 
                DisplayOrder = v15.displayOrder
            });
        end;
    else
        return v7.createElement(v12, {
            url = v15.url, 
            titleKey = v15.titleKey, 
            windowCloseCallback = not not v15 and v15.onClose or nil, 
            isVisible = v15.isVisible, 
            displayOrder = v15.displayOrder
        });
    end;
end;
