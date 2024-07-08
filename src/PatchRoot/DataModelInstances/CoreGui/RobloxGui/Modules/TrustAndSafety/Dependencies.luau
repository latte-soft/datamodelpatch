local l_CorePackages_0 = game:GetService("CorePackages");
local l_InGameMenu_0 = script.Parent.Parent.InGameMenu;
return {
    BarOnTopScrollingFrame = l_InGameMenu_0.Components.BarOnTopScrollingFrame, 
    Divider = l_InGameMenu_0.Components.Divider, 
    FocusHandler = l_InGameMenu_0.Components.Connection.FocusHandler, 
    ThemedTextLabel = l_InGameMenu_0.Components.ThemedTextLabel, 
    PlayerCell = l_InGameMenu_0.Components.PlayerCell, 
    GameIcon = l_InGameMenu_0.Components.GameIcon, 
    PlayerSearchPredicate = l_InGameMenu_0.Utility.PlayerSearchPredicate, 
    SearchBar = l_InGameMenu_0.Components.SearchBar, 
    Localization = if not game:DefineFastFlag("SwitchTnSTranslationsPackage", false) then require(l_InGameMenu_0.Localization.Localization) else require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization, 
    LocalizationProvider = l_InGameMenu_0.Localization.LocalizationProvider, 
    withLocalization = l_InGameMenu_0.Localization.withLocalization, 
    UIBloxInGameConfig = script.Parent.Parent.UIBloxInGameConfig, 
    playerInterface = script.Parent.Parent.Interfaces.playerInterface
};
