local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Packages_0 = l_CorePackages_0.Workspace.Packages;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useResponsiveLayout_0 = v4.Core.Layout.Responsive.useResponsiveLayout;
local l_useAppPolicy_0 = require(l_Packages_0.UniversalAppPolicy).useAppPolicy;
local l_isSubjectToDesktopPolicies_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v11 = require(l_Modules_0.LuaApp.Components.Home.HomePageUpsellCardWithIcon);
local v12 = require(l_Modules_0.LuaApp.Constants);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v12.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v12.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(_)
    local v18 = l_useSelector_0(function(v17)
        return v17.HomePageUpsellCardVariation;
    end);
    local v20 = l_useAppPolicy_0(function(v19)
        return v19.useGridPageLayout();
    end);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v23 = l_useSelector_0(function(v22)
        return v22.FormFactor;
    end);
    local v24 = l_useResponsiveLayout_0("margin");
    local v25 = nil;
    v25 = if not v20 then if v23 == l_FormFactor_0.COMPACT then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 else v24;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v25), 
            PaddingRight = UDim.new(0, v25), 
            PaddingTop = UDim.new(0, 1)
        }), 
        HomePageUpsellCard = v3.createElement(v11, {
            upsellCardVariation = v18, 
            isCentered = l_isSubjectToDesktopPolicies_0() or l_IsVRAppBuild_0()
        })
    });
end;
