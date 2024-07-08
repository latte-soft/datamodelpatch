local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_CorePackages_0.UIBlox);
local v9 = require(l_CorePackages_0.FitFrame);
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_FitTextLabel_0 = v9.FitTextLabel;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Constants);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.BoundInputsUpdater);
local v22 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid);
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsPeekView);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v27 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_Images_0 = v8.App.ImageSet.Images;
local l_withStyle_0 = v8.Style.withStyle;
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_IconButton_0 = v8.App.Button.IconButton;
local l_IconSize_0 = v8.App.ImageSet.Enum.IconSize;
local v34 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXEnableOutfitAttribution);
local l_Focusable_0 = v10.Focusable;
local v36 = l_Images_0["icons/navigation/close"];
local v37 = l_GuiService_0:IsTenFootInterface();
local v38 = v5.PureComponent:extend("ManageOutfitPage");
v38.validateProps = v6.strictInterface({
    navigateWithLock = if not v34 then nil else v6.callback, 
    navigation = v6.table, 
    avatarRoute = v6.table, 
    showCustomOutfitNames = v6.boolean, 
    avatarEditorAnalytics = v6.table
});
v38.init = function(v39)
    v39:setState({
        multiSelectionEnabled = false, 
        outfitGridCanScroll = false, 
        selectedOutfits = {}, 
        exitButtonPosition = Vector2.new(0, 0), 
        isGamepad = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()))
    });
    v39.focusController = v10.createFocusController();
    v39.exitButtonRef = v5.createRef();
    v39.selectButtonRef = v5.createRef();
    v39.gridViewRef = v5.createRef();
    v39.actionBarRef = v5.createRef();
    v39.peekViewRef = v5.createRef();
    v39.outfitDetailsPeekViewRefs = v10.createRefCache();
    v39.navigateBack = function()
        v39.props.navigation.goBack();
    end;
    v39.selectedOutfitUpdated = function(v40)
        if typeof(v40) == "string" then
            v39:setState({
                selectedOutfits = {
                    v40
                }
            });
            return ;
        else
            v39:setState({
                selectedOutfits = v40 or {}
            });
            return ;
        end;
    end;
    v39.exitButtonPositionChanged = function(v41)
        if v41.AbsolutePosition ~= v39.state.exitButtonPosition then
            v39:setState({
                exitButtonPosition = v41.AbsolutePosition
            });
        end;
    end;
    v39.renderExitButton = function()
        return l_withStyle_0(function(v42)
            local l_Theme_0 = v42.Theme;
            return v5.createElement(l_IconButton_0, {
                size = UDim2.new(0, 44, 1, 0), 
                icon = v36, 
                iconSize = l_IconSize_0.Medium, 
                iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                onActivated = v39.navigateBack, 
                buttonRef = v39.exitButtonRef, 
                NextSelectionDown = v39.gridViewRef, 
                NextSelectionRight = v39.selectButtonRef, 
                onAbsolutePositionChanged = v39.exitButtonPositionChanged
            });
        end);
    end;
    v39.selectButtonPressed = function()
        v39:setState({
            multiSelectionEnabled = not v39.state.multiSelectionEnabled
        });
        if v39.state.multiSelectionEnabled then
            v39.props.avatarEditorAnalytics.managePageMultiSelectActivated();
        end;
        if v34 then
            v26.closeFiltersAndItemDetails(v39.props.navigation);
        end;
    end;
    v39.outfitGridCanScrollUpdated = function(v44)
        if v39.state.outfitGridCanScroll ~= v44 then
            v39:setState({
                outfitGridCanScroll = v44
            });
        end;
    end;
    v39.onPeekViewClosed = function()
        v39:setState({
            selectedOutfits = {}
        });
        if v39.state.isGamepad then
            v39.focusController.captureFocus();
        end;
    end;
    v39.onOverlayClosed = function()
        local l_isGamepad_0 = v39.state.isGamepad;
        v20("ManageOutfitPage", l_isGamepad_0);
        if l_isGamepad_0 then
            v39.focusController.captureFocus();
        end;
    end;
    v39.deleteOutfit = function()
        v39.props.navigation.navigate(v18.DeleteOutfitPrompt, {
            outfitIds = v39.state.selectedOutfits, 
            onOverlayClosed = function()
                if v39.state.multiSelectionEnabled then
                    v39:setState({
                        multiSelectionEnabled = false
                    });
                end;
                v39.onOverlayClosed();
            end
        });
    end;
    v39.renameOutfit = function()
        v39.props.navigation.navigate(v18.RenameOutfitPrompt, {
            costumeId = v39.state.selectedOutfits[1], 
            onOverlayClosed = v39.onOverlayClosed
        });
    end;
    v39.lastInputTypeChangedCallback = function()
        local v46 = l_isGamepadInput_0((l_UserInputService_0:GetLastInputType()));
        if v46 ~= v39.state.isGamepad then
            v39:setState({
                isGamepad = v46
            });
        end;
    end;
    v39.onToggleOutfitCard = function(v47, v48)
        local l_navigation_0 = v39.props.navigation;
        if not v47 then
            v26.closeFiltersAndItemDetails(l_navigation_0);
            return ;
        else
            local v50 = {
                outfitId = v48, 
                ZIndex = 2, 
                onPeekViewClosed = v39.onPeekViewClosed, 
                exitButtonPosition = v39.state.exitButtonPosition, 
                deleteOutfit = v39.deleteOutfit, 
                renameOutfit = v39.renameOutfit, 
                NextSelectionLeft = not v39.props.isPortrait and v39.gridViewRef or nil, 
                outfitDetailsPeekViewRefs = v39.outfitDetailsPeekViewRefs
            };
            v39.props.navigateWithLock(function()
                v26.closeFiltersAndItemDetails(l_navigation_0);
                v26.closeTryOnManager(l_navigation_0);
                l_navigation_0.navigate(v18.OutfitDetails, v50);
            end);
            return ;
        end;
    end;
end;
v38.renderRightTopBarButton = function(v51, v52, v53, v54)
    local l_select_0 = v52.select;
    if v51.state.multiSelectionEnabled then
        l_select_0 = v52.cancel;
    end;
    return v5.createElement(l_Focusable_0[l_FitTextLabel_0], {
        width = l_FitTextLabel_0.Width.FitToText, 
        onActivated = v51.selectButtonPressed, 
        BackgroundTransparency = 1, 
        Text = l_select_0, 
        Font = v53.Font.Header2.Font, 
        LayoutOrder = 1, 
        TextColor3 = v53.Theme.TextEmphasis.Color, 
        TextSize = v53.Font.BaseSize * v53.Font.Header2.RelativeSize, 
        SelectionImageObject = v54(l_CursorKind_0.RoundedRect), 
        NextSelectionLeft = v51.exitButtonRef, 
        NextSelectionDown = v51.gridViewRef, 
        [v5.Ref] = v51.selectButtonRef
    });
end;
v38.renderWithProviders = function(v56, v57, v58, v59)
    local v60 = false;
    if not v56.state.multiSelectionEnabled and #v56.state.selectedOutfits == 1 then
        v60 = true;
    end;
    local v61 = (not v56.state.multiSelectionEnabled and v56.props.showCustomOutfitNames) and #v56.state.selectedOutfits == 1;
    local v62 = nil;
    if not (not v56.state.isGamepad or not v37) then
        v62 = v15.GAMEPAD_BOTTOM_BAR_SIZE;
    end;
    local v63 = if not v60 then nil else v56.peekViewRef;
    if not (not v34 or not v60) then
        v63 = v56.outfitDetailsPeekViewRefs[v56.props.avatarRoute.current.key];
    end;
    return v5.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = v56.focusController, 
        defaultChild = v56.gridViewRef, 
        restorePreviousChildFocus = true, 
        inputBindings = {
            NavigateBack = v10.Input.onBegin(Enum.KeyCode.ButtonB, v56.navigateBack), 
            ToggleMultiSelect = if v60 then nil else v10.Input.onBegin(Enum.KeyCode.ButtonL3, v56.selectButtonPressed, {
                key = not v56.state.multiSelectionEnabled and "Feature.Avatar.Action.SelectMultipleItems" or "Feature.Avatar.Action.CancelSelection"
            }), 
            Delete = if #v56.state.selectedOutfits > 0 then v10.Input.onBegin(Enum.KeyCode.ButtonX, v56.deleteOutfit, {
                key = "Feature.Avatar.Action.Delete"
            }) else nil, 
            Rename = if not v61 then nil else v10.Input.onBegin(Enum.KeyCode.ButtonY, v56.renameOutfit, {
                key = "Feature.Avatar.Action.Rename"
            })
        }
    }, {
        LastInputTypeChangedConnection = v5.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.LastInputTypeChanged, 
            callback = v56.lastInputTypeChangedCallback
        }), 
        BoundInputsUpdater = v5.createElement(v21), 
        NavOverlayPageContainer = v5.createElement(v22, {
            headerBarProps = {
                title = v57.manage, 
                renderLeft = v56.renderExitButton, 
                renderRight = function()
                    return v56:renderRightTopBarButton(v57, v58, v59);
                end
            }, 
            ZIndex = 1, 
            focusController = v56.focusController, 
            onDismiss = v56.navigateBack
        }, {
            OutfitSelectionGrid = v5.createElement(v23, {
                onToggleOutfitCard = if not v34 then nil else v56.onToggleOutfitCard, 
                selectedOutfits = v56.state.selectedOutfits, 
                selectionUpdated = v56.selectedOutfitUpdated, 
                canScrollUpdated = v56.outfitGridCanScrollUpdated, 
                multiSelect = v56.state.multiSelectionEnabled, 
                goBack = v56.navigateBack, 
                pageOwner = v18.ManageOutfitPage, 
                NextSelectionUp = v56.exitButtonRef, 
                NextSelectionDown = if not v56.state.multiSelectionEnabled then nil else v56.actionBarRef, 
                NextSelectionRight = v63, 
                [v5.Ref] = v56.gridViewRef
            }), 
            ManageActionBar = not not v56.state.multiSelectionEnabled and v5.createElement(v24, {
                gradientFade = v56.state.outfitGridCanScroll, 
                multiSelect = true, 
                selectedOutfits = v56.state.selectedOutfits, 
                bottomPadding = v62, 
                deleteOutfit = v56.deleteOutfit, 
                renameOutfit = v56.renameOutfit, 
                ZIndex = 2, 
                NextSelectionUp = v56.gridViewRef, 
                [v5.Ref] = v56.actionBarRef
            }) or nil
        }), 
        OutfitDetailsPeekView = if not v34 and v60 then v5.createElement(v25, {
            outfitId = v56.state.selectedOutfits[1], 
            ZIndex = 2, 
            focusController = v56.focusController, 
            onPeekViewClosed = v56.onPeekViewClosed, 
            exitButtonPosition = v56.state.exitButtonPosition, 
            deleteOutfit = v56.deleteOutfit, 
            renameOutfit = v56.renameOutfit, 
            NextSelectionLeft = not v56.props.isPortrait and v56.gridViewRef or nil, 
            [v5.Ref] = v56.peekViewRef
        }) else nil
    });
end;
v38.render = function(v64)
    return l_withLocalization_0({
        manage = "Feature.Avatar.Heading.Manage", 
        select = "Feature.Avatar.Action.Select", 
        cancel = "Feature.Avatar.Action.Cancel"
    })(function(v65)
        return l_withStyle_0(function(v66)
            return l_withSelectionCursorProvider_0(function(v67)
                return v64:renderWithProviders(v65, v66, v67);
            end);
        end);
    end);
end;
v38.didMount = function(v68)
    v68.props.avatarEditorAnalytics.managePageOpened();
end;
if v34 then
    v38 = v4.connect(nil, function(v69)
        return {
            navigateWithLock = function(v70)
                v69(v27(v70));
            end
        };
    end)(v38);
end;
return (v17((l_RoactAppPolicy_0.connect(function(v71, _)
    return {
        showCustomOutfitNames = v71.getCustomOutfitNames()
    };
end)((l_RoactServices_0.connect({
    avatarEditorAnalytics = v19
})(v38))))));
