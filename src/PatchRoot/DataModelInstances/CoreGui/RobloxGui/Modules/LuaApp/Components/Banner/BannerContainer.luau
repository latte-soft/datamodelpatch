local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local _ = require(l_CorePackages_0.Cryo);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v6 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useProperty;
local l_useUiModeInfo_0 = v7.useUiModeInfo;
local l_UiMode_0 = v6.UiMode;
local v11 = require(l_Modules_0.LuaApp.Components.SiteMessageBanner);
local v12 = require(l_Modules_0.LuaApp.Components.AccountSecurity.PromptBannerV2);
return function(v13)
    local v14 = l_useDesignTokens_0();
    local v15 = l_useUiModeInfo_0().uiMode ~= l_UiMode_0.TenFoot;
    local l_Banner_0 = v14.LuaApps.Banner;
    local l_showSecurityBanner_0 = v13.showSecurityBanner;
    local l_showSiteMessageBanner_0 = v13.showSiteMessageBanner;
    local l_securityBanner_0 = l_Banner_0.securityBanner;
    local l_siteMessageBanner_0 = l_Banner_0.siteMessageBanner;
    local v21 = not l_showSecurityBanner_0 and 0 or (l_securityBanner_0.height or 0);
    local v22 = l_siteMessageBanner_0.height or 0;
    local v23 = if not not l_showSecurityBanner_0 and l_showSiteMessageBanner_0 then l_Banner_0.verticalPadding else 0;
    local v24 = v3.useRef(nil);
    local v25 = l_useProperty_0(v24, "AbsoluteSize");
    local l_onSizeChanged_0 = v13.onSizeChanged;
    v3.useLayoutEffect(function()
        if not (not l_onSizeChanged_0 or not v25) then
            l_onSizeChanged_0(v25);
        end;
    end, {
        v25, 
        l_onSizeChanged_0
    });
    return v3.createElement("Frame", {
        Size = v13.Size or UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = v13.Position, 
        BackgroundTransparency = 1, 
        ref = v24
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v23)
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Banner_0.leftMargin), 
            PaddingRight = UDim.new(0, l_Banner_0.rightMargin), 
            PaddingTop = UDim.new(0, l_Banner_0.topMargin), 
            PaddingBottom = UDim.new(0, l_Banner_0.bottomMargin)
        }), 
        SiteMessageBanner = if not l_showSiteMessageBanner_0 then nil else v3.createElement(v11, {
            Size = UDim2.new(1, 0, 0, v22), 
            LayoutOrder = 1
        }), 
        AccountSecurityPromptBanner = v3.createElement(v12, {
            isInteractive = v15, 
            Size = UDim2.new(1, 0, 0, v21), 
            LayoutOrder = 2
        })
    });
end;
