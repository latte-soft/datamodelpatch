local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useRouteName_0 = v4.Hooks.useRouteName;
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local v9 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.getIconButtonSize);
local v10 = require(l_Modules_0.LuaApp.Thunks.NavigateDownToAddFriendsPage);
local v11 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v12 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v12.App.ImageSet.Images;
local l_IconButton_0 = v12.App.Button.IconButton;
local l_IconSize_0 = v12.App.ImageSet.Enum.IconSize;
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppEnableTopBarShowItemsOnSearching);
local v17 = l_Images_0["icons/actions/friends/friendAdd"];
return function(v18)
    local v20 = l_useSelector_0(function(v19)
        return v19.FormFactor;
    end);
    local v21 = v9(v20);
    local v22 = l_useDispatch_0();
    local v23 = l_useRouteName_0();
    local v24 = v11(v8);
    local function v25()
        if not v18.isSearching then
            v22(v10());
            v24.reportAddFriendsButtonClick(v23);
            return ;
        else
            return ;
        end;
    end;
    v2.useEffect(function()
        v18.setVisible((not not v16() and v20 == l_FormFactor_0.WIDE or v18.isUnderTitleSearchBarEnabled) or not v18.isSearching);
    end, {
        v20, 
        v18.isUnderTitleSearchBarEnabled, 
        v18.isSearching, 
        v18.setVisible
    });
    return v2.createElement(l_IconButton_0, {
        icon = v17, 
        size = UDim2.new(0, v21, 1, 0), 
        iconSize = l_IconSize_0.Medium, 
        onActivated = v25, 
        buttonRef = v18.buttonRef
    });
end;
