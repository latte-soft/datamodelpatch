local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v6 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local v10 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
return function(v11)
    local v12 = l_useScreenSize_0();
    local v13 = nil;
    if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v13 = v10();
    end;
    local v14 = l_useLocalization_0({
        title = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v6.EditDisplayName else nil, 
        description = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v6.DisplayNameRecently else nil, 
        OK = v6.OK
    });
    return v2.createElement(l_InteractiveAlert_0, {
        screenSize = v12, 
        title = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v14.title else v13.displayNameEditMessage, 
        bodyText = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v14.description else v13.displayNameCoolDownMessage, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function()
                            v11.navigation.goBack();
                        end, 
                        text = v14.OK
                    }
                }
            }
        }
    });
end;
