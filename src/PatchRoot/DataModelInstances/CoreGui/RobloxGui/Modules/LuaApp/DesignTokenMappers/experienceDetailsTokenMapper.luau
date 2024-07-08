local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local v4 = require(script.Parent.Parent.Components.ExperienceDetails.Flags.FFlagEDPAddRatingTitle10ft);
return function(v5, v6)
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local l_Medium_0 = v6.Semantic.Radius.Medium;
    local l_Size_200_0 = v6.Global.Size_200;
    local v25 = 1;
    local l_Size_300_0 = v6.Global.Size_300;
    local l_Size_200_1 = v6.Global.Size_200;
    local l_Header_0 = v6.Semantic.Typography.Header;
    local v29 = {
        Color = v6.Semantic.Color.Text.Emphasis.Color3, 
        Transparency = v6.Semantic.Color.Text.Emphasis.Transparency
    };
    if v5.uiMode == l_UiMode_0.TenFoot then
        v7 = 400;
        v8 = 0;
        v15 = 0;
        v11 = 0;
        v12 = 4;
        v9 = v6.Global.Space_400;
        v10 = v6.Global.Space_100;
        v13 = v6.Global.LineHeight_300;
        v14 = 0;
        v16 = v6.Global.Space_500;
        v17 = v6.Semantic.Color.BackgroundUi.Default;
        v18 = Vector2.new(v6.Global.Size_200, v6.Global.Size_100);
        v19 = {
            dampingRatio = 1, 
            frequency = 3
        };
        v20 = v6.Global.Space_300;
        v21 = Vector2.new(v6.Global.Size_800, v6.Global.Size_1200);
        v22 = 3000;
        v25 = 0.6;
    end;
    return {
        ThumbnailSize = v7, 
        ThumbnailMargin = v9, 
        SideMargin = v8, 
        HeaderItemPadding = v10, 
        HeaderDescriptionMaxRows = v12, 
        HeaderDescriptionLineHeight = v13, 
        ThumbnailShadowHeight = v14, 
        HeaderGradientHeight = v15, 
        HeaderBarBackgroundHeight = v11, 
        HeaderBottomMargin = v16, 
        ActionBarButtonBackgroundColor = v17, 
        ActionBarTextButtonPadding = v18, 
        AnimationConfig = v19, 
        ItemPadding = v20, 
        SafeAreaSize = v21, 
        TrailingWhitespace = v22, 
        PanelRadius = l_Medium_0, 
        PanelHeaderMargin = l_Size_200_0, 
        PanelWidthScale = v25, 
        PanelInnerPadding = l_Size_300_0, 
        IconSize = v6.Semantic.Icon.Size.Medium, 
        SectionListPadding = if not v4 then nil else l_Size_200_1, 
        TitleFontStyle = if not v4 then nil else l_Header_0, 
        TitleColorStyle = if not v4 then nil else v29
    };
end;
