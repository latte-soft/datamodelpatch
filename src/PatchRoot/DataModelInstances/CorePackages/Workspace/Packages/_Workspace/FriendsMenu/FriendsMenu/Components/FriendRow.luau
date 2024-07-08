local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Enums_0 = l_script_FirstAncestor_0.Enums;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v8 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableCommonFriendsMenu_0 = v8.GetFFlagEnableCommonFriendsMenu;
local l_GetFFlagEnableFriendMenuMultiSelect_0 = v8.GetFFlagEnableFriendMenuMultiSelect;
local l_GetFFlagEnableSidePaddingPropsFriendsMenu_0 = v8.GetFFlagEnableSidePaddingPropsFriendsMenu;
local l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0 = v8.GetFFlagFriendsMenuDummyLoadingFriendsFix;
local v13 = require(l_Components_0.FriendThumbnail);
local v14 = require(l_Components_0.FriendsMenuButton);
local v15 = require(l_Components_0.FriendInfo);
local v16 = require(l_Components_0.FriendsMenuCheckbox);
local v17 = if not l_GetFFlagEnableCommonFriendsMenu_0() then require(l_Context_0.InviteFriendContext) else require(l_Context_0.InviteCallbackContext);
local v18 = require(l_Context_0.SelectedUsersContext);
local v19 = require(l_Enums_0.FriendMenuType);
local l_useStyle_0 = v6.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local v22 = UDim2.new(1, 0, 0.5, 0);
local v23 = Vector2.new(1, 0.5);
local function v24()
end;
return function(v25)
    local v26, v27 = v5.useState(false);
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_friend_0 = v25.friend;
    assert(l_friend_0, "friend should be non-nil. Silence type checker.");
    local v30 = v5.useContext(v17);
    local v31 = v5.useContext(v18);
    local v32 = v5.useMemo(function()
        if not v25.sidePadding then
            return 24;
        else
            return v25.sidePadding;
        end;
    end, l_dependencyArray_0(v25.sidePadding));
    local v33 = v5.useCallback(function()
        if not (not v30 or not v30.inviteSingleFriend) then
            v30.inviteSingleFriend(l_friend_0.id, v25.layoutOrder);
        end;
    end, l_dependencyArray_0(v30, v30.inviteSingleFriend, l_friend_0.id, v25.layoutOrder));
    local v34 = v5.useCallback(function()
        if not v31.isFriendSelected(v25.friend.id) then
            v31.addFriend(v25.friend.id, v25.friend.displayName);
            return ;
        else
            v31.removeFriend(v25.friend.id);
            return ;
        end;
    end, l_dependencyArray_0(v31.isFriendSelected, v31.removeFriend, v31.addFriend, v25.friend.id));
    return v5.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 0, 72), 
        BackgroundColor3 = not not v26 and l_Theme_0.BackgroundOnHover.Color or l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = not not v26 and l_Theme_0.BackgroundOnHover.Transparency or l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = v25.layoutOrder, 
        [v5.Event.MouseEnter] = function()
            v27(true);
        end, 
        [v5.Event.MouseLeave] = function()
            v27(false);
        end, 
        [v5.Event.Activated] = if not not l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() and l_friend_0.isLoadingPlaceholder then v24 else not l_GetFFlagEnableFriendMenuMultiSelect_0() and function()
            if v25.isFullRowActivatable and (not l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() or not l_friend_0.isLoadingPlaceholder) then
                v33();
                return ;
            else
                return ;
            end;
        end or v5.useCallback(function()
            if v25.isFullRowActivatable and (not l_GetFFlagFriendsMenuDummyLoadingFriendsFix_0() or not l_friend_0.isLoadingPlaceholder) then
                if not l_GetFFlagEnableFriendMenuMultiSelect_0() or v25.menuType ~= v19.MultiSelect then
                    v33();
                    return ;
                else
                    v34();
                    return ;
                end;
            else
                return ;
            end;
        end, l_dependencyArray_0(v25.isFullRowActivatable, v25.menuType, v33, v34, l_friend_0.isLoadingPlaceholder)), 
        AutoButtonColor = v25.isFullRowActivatable
    }, {
        Padding = v5.createElement("UIPadding", {
            PaddingRight = if not l_GetFFlagEnableSidePaddingPropsFriendsMenu_0() then UDim.new(0, 24) else UDim.new(0, v32), 
            PaddingLeft = if not l_GetFFlagEnableSidePaddingPropsFriendsMenu_0() then UDim.new(0, 24) else UDim.new(0, v32), 
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8)
        }), 
        ThumbnailAndPresenseWrapper = v5.createElement(v13, {
            friend = l_friend_0, 
            isHoverRow = v26, 
            size = UDim2.new(0, 56, 0, 56), 
            position = UDim2.new(0, 0, 0.5, 0), 
            anchorPoint = Vector2.new(0, 0.5)
        }), 
        UserInfo = v5.createElement(v15, {
            position = UDim2.new(0, 56, 0, 0), 
            size = if not l_GetFFlagEnableSidePaddingPropsFriendsMenu_0() then UDim2.new(1, -134, 1, 0) else UDim2.new(1, -134, 1, 0), 
            friend = l_friend_0
        }), 
        InviteButton = if not not l_GetFFlagEnableFriendMenuMultiSelect_0() and v25.menuType == v19.MultiSelect then v5.createElement(v16, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v22, 
            anchorPoint = v23, 
            friend = l_friend_0
        }) else v5.createElement(v14, {
            size = UDim2.new(0, 66, 0, 36), 
            position = v22, 
            anchorPoint = v23, 
            friend = l_friend_0, 
            onInvite = v33, 
            isFullRowActivatable = v25.isFullRowActivatable
        })
    });
end;
