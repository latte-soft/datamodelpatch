local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local v5 = require(l_CorePackages_0.Packages.Cryo);
return function(v6, v7)
    local v8 = 0;
    local v9 = 0;
    local v10 = 0;
    local v11 = 0;
    local v12 = 0;
    local v13 = {
        autoButtonColor = true, 
        height = v7.Global.Size_500
    };
    local v14 = {
        autoButtonColor = true, 
        height = v7.Global.Size_200, 
        typography = v7.Semantic.Typography.Body, 
        textColor = v7.Semantic.Color.Text.Emphasis, 
        verticalPadding = 5, 
        horizontalPadding = 15, 
        backgroundColor = v7.Global.Color.Graphite
    };
    if v6.uiMode == l_UiMode_0.TenFoot then
        v13 = v5.Dictionary.join(v13, {
            autoButtonColor = false, 
            cornerRadius = UDim.new(0, v7.Semantic.Radius.Medium), 
            height = v7.Global.Size_600, 
            strokeColor = v7.Semantic.Color.Common.Divider
        });
        v14 = v5.Dictionary.join(v14, {
            autoButtonColor = false, 
            cornerRadius = UDim.new(0, v7.Semantic.Radius.Medium), 
            height = v7.Global.Size_400, 
            strokeColor = v7.Semantic.Color.Common.Badge, 
            verticalPadding = v7.Global.Space_50, 
            horizontalPadding = v7.Global.Space_100
        });
        v8 = v7.Global.Space_200;
        v9 = v7.Global.Space_300;
        v10 = v7.Global.Space_200;
        v11 = v7.Global.Space_800;
        v12 = v7.Global.Space_800;
    end;
    return {
        verticalPadding = v8, 
        topMargin = v9, 
        bottomMargin = v10, 
        leftMargin = v11, 
        rightMargin = v12, 
        siteMessageBanner = v14, 
        securityBanner = v13
    };
end;
