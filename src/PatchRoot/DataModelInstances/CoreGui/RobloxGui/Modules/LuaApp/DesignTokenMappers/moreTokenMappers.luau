local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_GetFFlagTenFootUiMorePageFixUsername_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiMorePageFixUsername;
return function(_, v6)
    return {
        PageTopMargin = v6.Global.Space_150, 
        BackgroundGradientOffset = v6.Global.Space_800, 
        SafeAreaMargin = Vector2.new(v6.Global.Space_800, v6.Global.Space_300), 
        ContentMargin = Vector2.new(0, 136), 
        TitleHeight = v6.Global.Size_500, 
        TileSize = Vector2.new(400, 400), 
        ButtonSize = Vector2.new(1024, v6.Global.Size_600), 
        QrSize = 200, 
        LicensePanelWidthScale = 0.6, 
        UserIconSize = v6.Semantic.Icon.Size.Medium, 
        UsernameTextFont = if not l_GetFFlagTenFootUiMorePageFixUsername_0() then v6.Semantic.Typography.CaptionBody else v6.Semantic.Typography.Subheader, 
        UsernameTextStyle = {
            Color = v6.Semantic.Color.Text.Default.Color3, 
            Transparency = v6.Semantic.Color.Text.Default.Transparency
        }, 
        NavigationItemIconStyle = {
            Color = v6.Semantic.Color.Icon.Emphasis.Color3, 
            Transparency = v6.Semantic.Color.Icon.Emphasis.Transparency
        }, 
        NavigationItemTitleStyle = {
            Color = v6.Semantic.Color.Text.Emphasis.Color3, 
            Transparency = v6.Semantic.Color.Text.Emphasis.Transparency
        }, 
        NavigationItemTitleFont = v6.Semantic.Typography.Subheader, 
        DisconnectTextFont = v6.Semantic.Typography.Subheader
    };
end;
