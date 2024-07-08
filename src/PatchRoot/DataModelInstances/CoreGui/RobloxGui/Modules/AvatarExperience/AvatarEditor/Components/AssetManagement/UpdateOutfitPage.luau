local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.UIBlox);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.UpdateSavedOutfit);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ActionBar_0 = v7.App.Button.ActionBar;
local l_withStyle_0 = v7.Style.withStyle;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_Focusable_0 = v6.Focusable;
local v23 = l_Images_0["icons/navigation/close"];
local v24 = v2.PureComponent:extend("UpdateOutfitPage");
v24.validateProps = v4.strictInterface({
    focusController = v4.optional(v4.table), 
    navigation = v4.table, 
    avatarRoute = v4.table, 
    networking = v4.callback, 
    avatarEditorAnalytics = v4.table, 
    updateSavedOutfit = v4.callback
});
v24.init = function(v25)
    v25:setState({
        selectedOutfit = nil
    });
    v25.focusController = v25.props.focusController or v6.createFocusController();
    v25.exitButtonRef = v2.createRef();
    v25.gridViewRef = v2.createRef();
    v25.actionBarRef = v2.createRef();
    v25.navigateBack = function()
        v25.props.navigation.goBack();
    end;
    v25.selectedOutfitUpdated = function(v26)
        v25:setState({
            selectedOutfit = v26[1] or v2.None
        });
    end;
    v25.updateOutfit = function()
        if v25.state.selectedOutfit then
            v25.props.updateSavedOutfit(v25.props.networking, v25.props.avatarEditorAnalytics, v25.state.selectedOutfit);
            v25.navigateBack();
            return ;
        else
            return ;
        end;
    end;
    v25.renderExitButton = function()
        return l_withStyle_0(function(v27)
            local l_Theme_0 = v27.Theme;
            return v2.createElement(l_IconButton_0, {
                size = UDim2.new(0, 44, 1, 0), 
                icon = v23, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                onActivated = v25.navigateBack, 
                buttonRef = v25.exitButtonRef, 
                NextSelectionDown = v25.gridViewRef
            });
        end);
    end;
end;
v24.renderWithProviders = function(v29, v30, v31)
    local l_Theme_1 = v31.Theme;
    return v2.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = v29.focusController, 
        defaultChild = v29.gridViewRef, 
        inputBindings = {
            NavigateBack = v6.Input.onBegin(Enum.KeyCode.ButtonB, v29.navigateBack), 
            Update = if not v29.state.selectedOutfit then nil else v6.Input.onBegin(Enum.KeyCode.ButtonX, v29.updateOutfit, {
                key = "Feature.Avatar.Action.Update"
            })
        }
    }, {
        BoundInputsUpdater = v2.createElement(v13), 
        NavOverlayPageContainer = v2.createElement(v14, {
            headerBarProps = {
                title = v30.selectToUpdate, 
                renderLeft = v29.renderExitButton
            }, 
            focusController = v29.focusController, 
            onDismiss = v29.navigateBack
        }, {
            OutfitSelectionGrid = v2.createElement(v15, {
                selectedOutfits = {
                    v29.state.selectedOutfit
                }, 
                selectionUpdated = v29.selectedOutfitUpdated, 
                goBack = v29.navigateBack, 
                pageOwner = v12.UpdateOutfitPage, 
                NextSelectionUp = v29.exitButtonRef, 
                NextSelectionDown = v29.actionBarRef, 
                [v2.Ref] = v29.gridViewRef
            }), 
            ActionBarBackgroundGapFiller = v29.state.selectedOutfit ~= nil and v2.createElement("Frame", {
                BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                Size = UDim2.new(1, 0, 0, 48), 
                ZIndex = 2
            }) or nil, 
            ActionBarContainer = v29.state.selectedOutfit ~= nil and v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 3
            }, {
                ActionBar = v2.createElement(l_ActionBar_0, {
                    button = {
                        props = {
                            text = v30.update, 
                            onActivated = v29.updateOutfit
                        }
                    }, 
                    NextSelectionUp = v29.gridViewRef, 
                    [v2.Ref] = v29.actionBarRef
                })
            }) or nil
        })
    });
end;
v24.render = function(v33)
    return l_withLocalization_0({
        selectToUpdate = "Feature.Avatar.Heading.SelectToUpdate", 
        update = "Feature.Avatar.Action.Update"
    })(function(v34)
        return l_withStyle_0(function(v35)
            return v33:renderWithProviders(v34, v35);
        end);
    end);
end;
return (v11((v3.connect(nil, function(v36)
    return {
        updateSavedOutfit = function(v37, v38, v39)
            v36(v16(v37, v38, v39));
        end
    };
end)((l_RoactServices_0.connect({
    networking = v9, 
    avatarEditorAnalytics = v10
})(v24))))));
