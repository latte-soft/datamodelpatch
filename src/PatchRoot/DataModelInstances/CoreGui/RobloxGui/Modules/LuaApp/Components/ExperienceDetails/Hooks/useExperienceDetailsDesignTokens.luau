local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local _ = require(l_CorePackages_0.Packages.ReactOtter);
local function v5(v4)
    return v4.LuaApps.ExperienceDetails or {};
end;
return function()
    local v6 = l_useDesignTokens_0(v5);
    local l_ThumbnailSize_0 = v6.ThumbnailSize;
    local l_ThumbnailMargin_0 = v6.ThumbnailMargin;
    local l_SideMargin_0 = v6.SideMargin;
    local l_HeaderItemPadding_0 = v6.HeaderItemPadding;
    local l_HeaderDescriptionMaxRows_0 = v6.HeaderDescriptionMaxRows;
    local l_HeaderDescriptionLineHeight_0 = v6.HeaderDescriptionLineHeight;
    local l_ThumbnailShadowHeight_0 = v6.ThumbnailShadowHeight;
    local l_HeaderGradientHeight_0 = v6.HeaderGradientHeight;
    local l_HeaderBarBackgroundHeight_0 = v6.HeaderBarBackgroundHeight;
    local l_HeaderBottomMargin_0 = v6.HeaderBottomMargin;
    local l_ActionBarButtonBackgroundColor_0 = v6.ActionBarButtonBackgroundColor;
    local l_ActionBarTextButtonPadding_0 = v6.ActionBarTextButtonPadding;
    local l_AnimationConfig_0 = v6.AnimationConfig;
    local l_ItemPadding_0 = v6.ItemPadding;
    local l_SafeAreaSize_0 = v6.SafeAreaSize;
    local l_TrailingWhitespace_0 = v6.TrailingWhitespace;
    local l_IconSize_0 = v6.IconSize;
    return v1.useMemo(function()
        return {
            thumbnailSize = l_ThumbnailSize_0, 
            thumbnailMargin = l_ThumbnailMargin_0, 
            sideMargin = l_SideMargin_0, 
            headerItemPadding = l_HeaderItemPadding_0, 
            headerDescriptionMaxRows = l_HeaderDescriptionMaxRows_0, 
            headerDescriptionLineHeight = l_HeaderDescriptionLineHeight_0, 
            thumbnailShadowHeight = l_ThumbnailShadowHeight_0, 
            headerGradientHeight = l_HeaderGradientHeight_0, 
            headerBarBackgroundHeight = l_HeaderBarBackgroundHeight_0, 
            headerBottomMargin = l_HeaderBottomMargin_0, 
            actionBarButtonBackgroundColor = if not l_ActionBarButtonBackgroundColor_0 then nil else {
                Color = l_ActionBarButtonBackgroundColor_0.Color3, 
                Transparency = l_ActionBarButtonBackgroundColor_0.Transparency
            }, 
            actionBarTextButtonPadding = l_ActionBarTextButtonPadding_0, 
            animationConfig = l_AnimationConfig_0, 
            itemPadding = l_ItemPadding_0, 
            safeAreaSize = l_SafeAreaSize_0, 
            trailingWhitespace = l_TrailingWhitespace_0, 
            iconSize = l_IconSize_0
        };
    end, {
        l_ThumbnailSize_0, 
        l_ThumbnailMargin_0, 
        l_SideMargin_0, 
        l_HeaderItemPadding_0, 
        l_HeaderDescriptionLineHeight_0, 
        l_ActionBarButtonBackgroundColor_0, 
        l_ActionBarTextButtonPadding_0, 
        l_ThumbnailShadowHeight_0, 
        l_HeaderBarBackgroundHeight_0, 
        l_HeaderGradientHeight_0, 
        l_HeaderBottomMargin_0, 
        l_AnimationConfig_0, 
        l_ItemPadding_0, 
        l_SafeAreaSize_0, 
        l_TrailingWhitespace_0, 
        l_IconSize_0
    });
end;
