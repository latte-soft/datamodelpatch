local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_Modules_0.AvatarExperience.Common.Hooks.useOpenQuickMenuCallback);
local v6 = require(l_CorePackages_0.UIBlox);
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v6.App.Button.Enum.StandardButtonSize;
return (v3.forwardRef(function(v10, v11)
    return v3.createElement(l_Button_0, {
        buttonRef = v11, 
        NextSelectionRight = v10.NextSelectionRight, 
        text = l_useLocalization_0({
            buttonText = "Feature.Catalog.Heading.QuickMenu"
        }).buttonText, 
        onActivated = v5(), 
        buttonType = l_ButtonType_0.Secondary, 
        standardSize = l_StandardButtonSize_0.Small, 
        fitContent = true
    });
end));
