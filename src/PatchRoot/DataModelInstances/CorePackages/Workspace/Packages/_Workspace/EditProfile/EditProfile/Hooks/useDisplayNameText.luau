local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v3 = require(l_script_FirstAncestor_0.Flags.RealNamesInDisplayNamesIXP);
local v4 = require(script.Parent.useRealNamesInDisplayNamesEnabled);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v6 = {
    displayNameCaption = v2.DisplayNameCaption, 
    displayNameChangeError = v2.DisplayNameError, 
    displayNameChangeMixedCharactersError = v2.DisplayNameError, 
    displayNameModalCaption = v2.DisplayNameModalCaption, 
    displayNameCoolDownMessage = v2.DisplayNameRecently, 
    displayNameTooShortError = v2.DisplayNameTooShort, 
    displayNameUpdatedMessage = v2.DisplayNameUpdated, 
    displayNameEditMessage = v2.EditDisplayName, 
    displayNameTitle = v2.DisplayName
};
local v7 = {
    displayNameCaption = v2.AgedUpDisplayNameCaption, 
    displayNameChangeError = v2.AgedUpDisplayNameError, 
    displayNameChangeMixedCharactersError = v2.AgedUpDisplayNameMixedCharactersError, 
    displayNameModalCaption = v2.AgedUpDisplayNameModalCaption, 
    displayNameCoolDownMessage = v2.AgedUpDisplayNameRecently, 
    displayNameTooShortError = v2.AgedUpDisplayNameTooShort, 
    displayNameUpdatedMessage = v2.AgedUpDisplayNameUpdated, 
    displayNameEditMessage = v2.EditAgedUpDisplayName, 
    displayNameTitle = v2.AgedUpDisplayName
};
return function()
    return l_useLocalization_0(if not not v3.useIsExperimentEnabled({
        isExposureEnabled = true
    }) and v4() then v7 else v6);
end;
