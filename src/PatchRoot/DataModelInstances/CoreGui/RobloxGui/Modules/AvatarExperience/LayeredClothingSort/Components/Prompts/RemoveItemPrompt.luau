local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v13 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v14 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.AddRemovedItem);
local v15 = v2.PureComponent:extend("RemoveItemPrompt");
v15.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    equippedAssets = v4.optional(v4.table), 
    currentSort = v4.table, 
    toggleEquipAsset = v4.callback, 
    setCurrentSort = v4.callback, 
    addRemovedItem = v4.callback, 
    asset = v4.table, 
    onUnequip = v4.optional(v4.callback), 
    navigation = v4.table, 
    focusController = v4.optional(v4.table), 
    defaultChildRef = v4.optional(v4.table), 
    onOverlayClosed = v4.optional(v4.callback)
});
v15.init = function(v16)
    v16.removeItem = function()
        local l_id_0 = v16.props.asset.id;
        local l_typeId_0 = v16.props.asset.typeId;
        if not ((not v16.props.equippedAssets or not v16.props.equippedAssets[l_typeId_0]) or not v16.props.equippedAssets[l_typeId_0][l_id_0]) then
            v16.props.toggleEquipAsset(l_typeId_0, l_id_0);
        end;
        local v19 = {};
        for _, v21 in v16.props.currentSort, nil, nil do
            if v21.id ~= l_id_0 then
                table.insert(v19, v21);
            end;
        end;
        v16.props.setCurrentSort(v19);
        v16.props.addRemovedItem(l_id_0, l_typeId_0);
        if v16.props.onUnequip then
            v16.props.onUnequip();
        end;
        v16.closePrompt();
    end;
    v16.closePrompt = function()
        v11.closeOverlay(v16.props.navigation);
    end;
end;
v15.renderAlertLocalized = function(v22, v23)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v23.title, 
        bodyText = v23.body, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v22.closePrompt, 
                        text = v23.no
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v22.removeItem, 
                        text = v23.yes
                    }
                }
            }
        }, 
        screenSize = v22.props.screenSize, 
        defaultChildRef = v22.props.defaultChildRef
    });
end;
v15.render = function(v24)
    return l_withLocalization_0({
        no = "Feature.GameDetails.Label.No", 
        yes = "Feature.GameDetails.Label.Yes", 
        title = "Feature.Avatar.Title.LCSortUnequip", 
        body = "Feature.Avatar.Message.LCSortUnequipBody"
    })(function(v25)
        return v24:renderAlertLocalized(v25);
    end);
end;
return (v9((v10((v3.connect(function(v26, _)
    return {
        screenSize = v26.ScreenSize, 
        equippedAssets = v26.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        currentSort = v26.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList
    };
end, function(v28)
    return {
        toggleEquipAsset = function(v29, v30)
            v28(v12(v29, v30));
        end, 
        setCurrentSort = function(v31)
            v28(v13(v31));
        end, 
        addRemovedItem = function(v32, v33)
            v28(v14(v32, v33));
        end
    };
end)(v15))))));
