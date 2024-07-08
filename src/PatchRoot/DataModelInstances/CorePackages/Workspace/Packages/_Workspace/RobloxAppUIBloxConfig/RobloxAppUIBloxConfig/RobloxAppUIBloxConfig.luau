local v0 = require(script.Parent.Parent.SharedFlags);
local l_UIBlox_0 = v0.UIBlox;
return {
    useNewThemeColorPalettes = v0.GetFFlagLuaAppUseUIBloxColorPalettes() and l_UIBlox_0.GetUIBloxUseNewThemeColorPalettes(), 
    enableNewMenuLayout = l_UIBlox_0.GetFFlagUIBloxEnableNewMenuLayout(), 
    fixFixedHeightMenuFrameSelectable = l_UIBlox_0.GetFFlagUIBloxFixFixedHeightMenuFrameSelectable(), 
    setZIndexOnGridCells = game:DefineFastFlag("UIBloxUseNewZindex", false), 
    useNewSelectionCursor = true, 
    hideHeaderActionBarWhenStickyBarActive = l_UIBlox_0.GetFFlagUIBloxHideActionBarWhenStickyBarActive(), 
    useRobloxGuiFocusedChangedEventInGenericButton = l_UIBlox_0.FFlagUIBloxUseRobloxGuiFocused, 
    useInputResponsiveShortcutBarChanges = l_UIBlox_0.FFlagUIBloxUseInputResponsiveShortcutBarChanges, 
    responsiveGridDisplayLinesNonNil = true, 
    useTokensWithScale = true, 
    enableFontNameMapping = l_UIBlox_0.GetUIBloxEnableFontNameMapping(), 
    useGetTextBoundsAsync = l_UIBlox_0.GetFFlagUIBloxUseGetTextBoundsAsync(), 
    responsiveBaseRowScrollingFrameRef = l_UIBlox_0.GetFFlagUIBloxResponsiveBaseRowScrollingFrameRef(), 
    supportControlStateSelectedForTooltipHover = l_UIBlox_0.GetFFlagUIBloxSupportControlStateSelectedForTooltipHover(), 
    mediaGalleryExpandedViewImmediateAnimation = true, 
    sliderGamepadDragStartAndEnd = v0.GetFFlagColorPickerSliderOptimization(), 
    enableInteractionFeedback = v0.GetFFlagEnableUISoundAndHaptics(), 
    useNewHeaderBar = l_UIBlox_0.GetFFlagUIBloxUseNewHeaderBar(), 
    fixGenericTextLabelTextBound = l_UIBlox_0.GetFFlagUIBloxFixGenericTextLabelTextboundHeight(), 
    interactiveAlertDesignTokenMinMaxSize = l_UIBlox_0.GetFFlagUIBloxInteractiveAlertDesignTokenMinMaxSize(), 
    alertTitleDesignTokenHeader = l_UIBlox_0.GetFFlagUIBloxAlertTitleDesignTokenHeader(), 
    refactorInteractable = l_UIBlox_0.FFlagUIBloxUseNewInteractable, 
    ignoreRichTextTagsForTextSizeCalculation = l_UIBlox_0.GetFFlagUIBloxIgnoreRichTextTagsForTextSizeCalculation(), 
    addMiddleContentZIndex = l_UIBlox_0.GetFFlagUIBloxUseFullPageModalZIndex()
};
