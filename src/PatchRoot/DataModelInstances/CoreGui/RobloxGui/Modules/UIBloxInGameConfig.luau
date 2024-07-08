local v0 = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags);
local l_UIBlox_0 = v0.UIBlox;
return {
    useNewThemeColorPalettes = v0.GetFFlagLuaAppUseUIBloxColorPalettes() and l_UIBlox_0.GetUIBloxUseNewThemeColorPalettes(), 
    enableNewMenuLayout = l_UIBlox_0.GetFFlagUIBloxEnableNewMenuLayout(), 
    useRobloxGuiFocusedChangedEventInGenericButton = l_UIBlox_0.FFlagUIBloxUseRobloxGuiFocused, 
    useInputResponsiveShortcutBarChanges = l_UIBlox_0.FFlagUIBloxUseInputResponsiveShortcutBarChanges, 
    enableFontNameMapping = l_UIBlox_0.GetUIBloxEnableFontNameMapping(), 
    useGetTextBoundsAsync = l_UIBlox_0.GetFFlagUIBloxUseGetTextBoundsAsync(), 
    useTokensWithScale = l_UIBlox_0.GetFFlagUIBloxUseTokensWithScale(), 
    useNewHeaderBar = l_UIBlox_0.GetFFlagUIBloxUseNewHeaderBar(), 
    ignoreRichTextTagsForTextSizeCalculation = l_UIBlox_0.GetFFlagUIBloxIgnoreRichTextTagsForTextSizeCalculation(), 
    enableInteractionFeedback = v0.GetFFlagEnableUISoundAndHaptics(), 
    interactiveAlertDesignTokenMinMaxSize = l_UIBlox_0.GetFFlagUIBloxInteractiveAlertDesignTokenMinMaxSize(), 
    alertTitleDesignTokenHeader = l_UIBlox_0.GetFFlagUIBloxAlertTitleDesignTokenHeader(), 
    refactorInteractable = l_UIBlox_0.FFlagUIBloxUseNewInteractableCoreScript, 
    addMiddleContentZIndex = l_UIBlox_0.GetFFlagUIBloxUseFullPageModalZIndex()
};
