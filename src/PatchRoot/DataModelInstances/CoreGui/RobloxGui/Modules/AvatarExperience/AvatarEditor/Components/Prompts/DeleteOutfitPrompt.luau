local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Promise);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v12 = require(l_CorePackages_0.UIBlox);
local l_InteractiveAlert_0 = v12.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local l_Focusable_0 = v4.Focusable;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.DeleteOutfit);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.ItemsBulletList);
local v21 = v2.PureComponent:extend("DeleteOutfitPrompt");
v21.validateProps = v5.strictInterface({
    outfitIds = v5.array(v5.string), 
    onOverlayClosed = v5.optional(v5.callback), 
    defaultChildRef = v5.optional(v5.table), 
    focusController = v5.optional(v5.table), 
    avatarEditorAnalytics = v5.table, 
    navigation = v5.table, 
    outfitInfos = v5.table, 
    screenSize = v5.Vector2, 
    deleteOutfit = v5.callback
});
local v27 = l_memoize_0(function(v22, v23)
    local v24 = {};
    for _, v26 in v22, nil, nil do
        if v23[v26] then
            table.insert(v24, v23[v26].name);
        end;
    end;
    return v24;
end);
v21.init = function(v28)
    v28.mounted = false;
    v28:setState({
        maxContentSize = 10000, 
        itemListScrollable = false, 
        isDeleting = false
    });
    v28.middleContentRef = v2.createRef();
    v28.closePrompt = function()
        v8.closeOverlay(v28.props.navigation);
    end;
    v28.deleteOutfits = function()
        local v29 = {};
        local v30 = #v28.props.outfitIds > 1;
        for v31, v32 in v28.props.outfitIds, nil, nil do
            v29[v31] = v28.props.deleteOutfit(v32);
            v28.props.avatarEditorAnalytics.outfitDeleted(v32, v30);
        end;
        v28:setState({
            isDeleting = true
        });
        v6.all(v29):andThen(function()
            if v28.mounted then
                v28.closePrompt();
            end;
        end):catch(function(_)
            v28:setState({
                isDeleting = false
            });
        end);
    end;
    v28.itemListScrollableUpdated = function(v34)
        if v28.state.itemListScrollable ~= v34 then
            v28:setState({
                itemListScrollable = v34
            });
        end;
    end;
    v28.renderAlertMiddleContent = function()
        return v2.createElement(v20, {
            items = v27(v28.props.outfitIds, v28.props.outfitInfos), 
            maxHeight = v28.state.maxContentSize, 
            onScrollableUpdated = v28.itemListScrollableUpdated, 
            [v2.Ref] = v28.middleContentRef
        });
    end;
    v28.onAbsoluteSizeChanged = function(v35)
        local v36 = v28.middleContentRef:getValue();
        if v36 then
            local v37 = (v28.props.screenSize.Y - 60) - (v35.AbsoluteSize.Y - v36.AbsoluteSize.Y);
            if v28.state.maxContentSize ~= v37 then
                v28:setState({
                    maxContentSize = v37
                });
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v21.renderLocalized = function(v38, v39)
    local l_deleteSingleCharacter_0 = v39.deleteSingleCharacter;
    local l_singleNoLongerAvailable_0 = v39.singleNoLongerAvailable;
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    if #v38.props.outfitIds > 1 then
        l_deleteSingleCharacter_0 = v39.deleteAssets;
        l_singleNoLongerAvailable_0 = v39.multiNoLongerAvailable;
        v42 = v38.renderAlertMiddleContent;
        v43 = v38.state.itemListScrollable;
        v44 = v38.onAbsoluteSizeChanged;
    end;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        inputBindings = {
            NavigateBack = v4.Input.onBegin(Enum.KeyCode.ButtonB, v38.closePrompt), 
            Confirm = v4.Input.onBegin(Enum.KeyCode.ButtonA, function()
            end, {
                key = "CommonUI.Controls.Action.Confirm"
            })
        }
    }, {
        Alert = v2.createElement(l_InteractiveAlert_0, {
            title = l_deleteSingleCharacter_0, 
            bodyText = l_singleNoLongerAvailable_0, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v38.closePrompt, 
                            text = v39.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v38.state.isDeleting, 
                            onActivated = v38.deleteOutfits, 
                            text = v39.confirmButtonText
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v38.props.screenSize, 
            defaultChildRef = v38.props.defaultChildRef, 
            middleContent = v42, 
            isMiddleContentFocusable = v43, 
            onAbsoluteSizeChanged = v44
        })
    });
end;
v21.render = function(v45)
    return l_withLocalization_0({
        deleteSingleCharacter = "Feature.Avatar.Heading.DeleteCharacter", 
        singleNoLongerAvailable = "Feature.Avatar.Label.NoLongerAvailableInCollection", 
        deleteAssets = "Feature.Avatar.Heading.DeleteAssets", 
        multiNoLongerAvailable = "Feature.Avatar.Label.MultiNoLongerAvailableInCollection", 
        confirmButtonText = "Feature.Avatar.Action.Delete", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v46)
        return v45:renderLocalized(v46);
    end);
end;
v21.didMount = function(v47)
    v47.mounted = true;
end;
v21.willUnmount = function(v48)
    v48.mounted = false;
end;
return (v17((v16((l_RoactServices_0.connect({
    avatarEditorAnalytics = v18
})((v3.connect(function(v49, _)
    return {
        outfitInfos = v49.AvatarExperience.AvatarEditor.OutfitInfos, 
        screenSize = v49.ScreenSize
    };
end, function(v51)
    return {
        deleteOutfit = function(v52)
            v51(v19(v52));
        end
    };
end)(v21))))))));
