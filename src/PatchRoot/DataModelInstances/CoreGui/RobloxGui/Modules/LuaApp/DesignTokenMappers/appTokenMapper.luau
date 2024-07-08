local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local _ = require(l_CorePackages_0.Packages.ReactOtter);
return function(v5, v6)
    local v7 = v5.uiMode == l_UiMode_0.TenFoot;
    return {
        Page = {
            BackgroundColor = v6.Semantic.Color.Background.Default.Color3, 
            BackgroundTransparency = if not v7 then v6.Semantic.Color.Background.Default.Transparency else v6.Global.Opacity_0, 
            SafeAreaMargin = if not v7 then Vector2.zero else Vector2.new(v6.Global.Space_800, v6.Global.Space_300), 
            ScrollAnimationConfig = {
                dampingRatio = 1, 
                frequency = 3
            }
        }
    };
end;
