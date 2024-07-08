local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_InteractiveAlert_0 = l_UIBlox_0.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v7 = require(l_Parent_0.Common.TextKeys);
local _ = require(script.Parent.unableToJoinExperienceMapStateToProps);
local v9 = l_Roact_0.Component:extend("UnableToJoinExperienceModal");
v9.init = function(v10)
    v10.openGameDetailsPeekView = function()
        local l_props_0 = v10.props;
        l_props_0.closeModal();
        l_props_0.openGameDetailsPeekView();
    end;
end;
v9.render = function(v12)
    local l_props_1 = v12.props;
    return l_withLocalization_0({
        titleText = v7.UnableToJoin, 
        bodyText = v7.NoAccessToExperience, 
        confirmButtonText = v7.ViewDetails, 
        cancelButtonText = v7.Cancel
    })(function(v14)
        return l_Roact_0.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_1.screenSize, 
            title = v14.titleText, 
            bodyText = string.format(v14.bodyText, l_props_1.userDialogName), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = nil, 
                        props = {
                            text = v14.cancelButtonText, 
                            onActivated = l_props_1.closeModal
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            text = v14.confirmButtonText, 
                            onActivated = v12.openGameDetailsPeekView
                        }
                    }
                }
            }
        });
    end);
end;
return v9;
