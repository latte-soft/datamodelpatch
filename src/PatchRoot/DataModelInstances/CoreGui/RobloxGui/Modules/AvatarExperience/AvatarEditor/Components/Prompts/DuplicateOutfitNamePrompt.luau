local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v12.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local l_Focusable_0 = v4.Focusable;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = v2.PureComponent:extend("DuplicateOutfitNamePrompt");
v19.validateProps = v5.strictInterface({
    outfitName = v5.string, 
    sourcePrompt = v5.string, 
    sourceParams = v5.table, 
    saveCallback = v5.callback, 
    saveFetchingStateKey = v5.string, 
    onOverlayClosed = v5.optional(v5.callback), 
    defaultChildRef = v5.optional(v5.table), 
    focusController = v5.optional(v5.table), 
    navigation = v5.table, 
    screenSize = v5.Vector2, 
    fetchingState = v5.string
});
v19.init = function(v20)
    v20.goBack = function()
        v8.navigateToNextOverlay(v20.props.navigation, v20.props.sourcePrompt, v20.props.sourceParams);
    end;
end;
v19.willUpdate = function(v21, v22, _)
    if v18.isFetchingDoneOrFailed(v21.props.fetchingState, v22.fetchingState) then
        v8.closeOverlay(v21.props.navigation);
    end;
end;
v19.renderLocalized = function(v24, v25)
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = {
            NavigateBack = v4.Input.onBegin(Enum.KeyCode.ButtonB, v24.goBack), 
            Confirm = v4.Input.onBegin(Enum.KeyCode.ButtonA, function()
            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        Alert = v2.createElement(l_InteractiveAlert_0, {
            title = v25.titleText, 
            bodyText = v25.messageText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v24.goBack, 
                            text = v25.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v24.props.fetchingState == l_RetrievalStatus_0.Fetching, 
                            onActivated = v24.props.saveCallback, 
                            text = v25.confirmButtonText
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v24.props.screenSize, 
            defaultChildRef = v24.props.defaultChildRef
        })
    });
end;
v19.render = function(v26)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Heading.UsedName", 
        messageText = "Feature.Avatar.Label.UsedNameLong", 
        confirmButtonText = "Feature.Avatar.Action.Save", 
        cancelButtonText = "Feature.Avatar.Label.Back"
    })(function(v27)
        return v26:renderLocalized(v27);
    end);
end;
return (v17((v16((v3.connect(function(v28, v29)
    return {
        screenSize = v28.ScreenSize, 
        fetchingState = l_PerformFetch_0.GetStatus(v28, v29.saveFetchingStateKey)
    };
end, nil)(v19))))));
