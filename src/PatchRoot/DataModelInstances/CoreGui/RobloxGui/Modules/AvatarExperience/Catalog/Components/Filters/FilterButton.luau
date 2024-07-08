local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v9 = require(l_Modules_0.AvatarExperience.Common.Thunks.Exit3DFullView);
local v10 = require(l_Modules_0.LuaApp.Components.NumericalBadge);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local v15 = require(l_Modules_0.AvatarExperience.Common.Hooks.useAvatarRoute);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarScreen);
return function(v19)
    local v20 = l_useNavigation_0();
    local v21 = v15();
    local v22 = v16();
    local v23 = l_useDispatch_0();
    local v24 = v7(v8);
    return v2.createElement(l_IconButton_0, {
        anchorPoint = v19.anchorPoint or Vector2.new(0, 0.5), 
        position = v19.position or UDim2.fromScale(0, 0.5), 
        size = UDim2.fromOffset(24, 24), 
        iconSize = l_IconSize_0.Medium, 
        icon = l_Images_0["icons/actions/filter"], 
        onActivated = function()
            if v21.current.name == v18.SortAndFilters then
                v22:fire();
            else
                v17.closeTryOnManager(v20);
                v20.navigate(v18.SortAndFilters, {
                    navigation = v20, 
                    catalogSort = "", 
                    isPortrait = true, 
                    onAcceptCallback = function()
                    end
                });
            end;
            v23(v9(v24, v20.state.routeName));
        end, 
        buttonRef = v19.buttonRef, 
        layoutOrder = v19.layoutOrder, 
        NextSelectionLeft = v19.NextSelectionLeft, 
        NextSelectionRight = v19.NextSelectionRight, 
        NextSelectionUp = v19.NextSelectionUp, 
        NextSelectionDown = v19.NextSelectionDown
    }, {
        NotificationBadge = v2.createElement(v10, {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0.5, 0, 0.5, 4), 
            badgeCount = l_useSelector_0(v11)
        })
    });
end;
