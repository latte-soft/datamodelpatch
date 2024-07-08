local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.FriendsMenu);
local v5 = require(l_Parent_0.React);
local l_DeviceInfo_0 = require(l_Parent_0.NotificationsCommon).DeviceInfo;
local v7 = require(l_Parent_0.RoactUtils);
local l_FriendsMenuFriendsList_0 = v4.FriendsMenuFriendsList;
local l_InviteFriendContext_0 = v4.InviteFriendContext;
local l_FriendsMenuContextWrapper_0 = v4.FriendsMenuContextWrapper;
local l_FriendsMenuSearch_0 = v4.FriendsMenuSearch;
local l_FriendMenuType_0 = v4.FriendMenuType;
local l_GetFFlagEnableFriendMenuMultiSelect_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableFriendMenuMultiSelect;
local v14 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local v15 = require(l_Components_0.GameInviteTitle);
local v16 = require(l_Components_0.GameInviteCustomText);
local v17 = require(l_script_FirstAncestor_0.GameInviteConstants);
local v18 = require(l_Context_0.GameInviteModalLayoutContext);
local v19 = require(l_Context_0.GameDetailsContext);
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_GetFFlagEnableCommonFriendsMenu_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCommonFriendsMenu;
local l_GetFFlagEnableUniversalAppGameInviteUnification_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUniversalAppGameInviteUnification;
local l_SidePadding_0 = v17.Layout.SidePadding;
local l_TitleHeight_0 = v17.Layout.TitleHeight;
local function v38(_)
    local v26 = v5.useContext(v18);
    local v27 = v5.useContext(v19);
    local v29 = l_useSelector_0(function(v28)
        if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then
            return nil;
        else
            return v28.TopBar;
        end;
    end);
    local v30 = l_DeviceInfo_0.isConsole();
    local v31 = v26.modalMode == "compact";
    local l_promptMessage_0 = v27.promptMessage;
    local v33 = l_promptMessage_0 and #l_promptMessage_0 > 0;
    local v34 = l_TitleHeight_0 + 12;
    local v35 = not v31 and not v30;
    if v35 then
        v34 = v34 + 48;
    end;
    if v33 then
        v34 = v34 + 48;
    end;
    local l_l_TitleHeight_0_0 = l_TitleHeight_0;
    local _ = false;
    if not ((not l_GetFFlagEnableUniversalAppGameInviteUnification_0() or not (not v27.isCoreScript and ((v29 and v29.statusBarHeight) and true or false))) or not v29) then
        v34 = v34 + v29.statusBarHeight;
        l_l_TitleHeight_0_0 = l_l_TitleHeight_0_0 + v29.statusBarHeight;
    end;
    return v5.createElement("Frame", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIPadding = v5.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8)
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        TitleContainer = if not l_GetFFlagEnableUniversalAppGameInviteUnification_0() then v5.createElement(v15, {
            layoutOrder = 0, 
            size = UDim2.new(1, 0, 0, l_TitleHeight_0)
        }) else v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 0, 
            Size = UDim2.new(1, 0, 0, l_l_TitleHeight_0_0)
        }, {
            GameInviteTitle = v5.createElement(v15, {
                layoutOrder = 0, 
                size = UDim2.new(1, 0, 0, l_TitleHeight_0)
            })
        }), 
        SearchBox = not not v35 and v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 36)
        }, {
            UIPadding = v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_SidePadding_0), 
                PaddingRight = UDim.new(0, l_SidePadding_0)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 12), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            FriendsMenuSearch = v5.createElement(l_FriendsMenuSearch_0, {
                layoutOrder = 1, 
                size = UDim2.new(1, 0, 0, 36), 
                focusElement = false, 
                onFocus = function()
                    v14:onSearchFocused();
                end
            })
        }) or nil, 
        CustomTextContainer = not not v33 and v5.createElement(v16, {
            layoutOrder = 2, 
            size = UDim2.new(1, 0, 0, 36), 
            promptMessage = l_promptMessage_0
        }) or nil, 
        FriendsList = v5.createElement(l_FriendsMenuFriendsList_0, {
            layoutOrder = 3, 
            size = UDim2.new(1, 0, 1, -v34), 
            parentComponentName = v17.ParentComponentName, 
            menuType = if not l_GetFFlagEnableFriendMenuMultiSelect_0() then nil else l_FriendMenuType_0.SingleSelect
        })
    });
end;
return function(v39)
    local v40 = if not l_GetFFlagEnableCommonFriendsMenu_0() then {
        inviteSingleFriend = function()
        end, 
        getMaxRecipientRowNum = function()
        end
    } else v5.useContext(l_InviteFriendContext_0);
    if not l_GetFFlagEnableCommonFriendsMenu_0() then
        return (v5.createElement(v38, v39));
    else
        return (v5.createElement(l_FriendsMenuContextWrapper_0, {
            inviteSingleFriend = v40.inviteSingleFriend, 
            inviteMultiFriends = function()
            end, 
            isLoadingCustomParams = v39.isLoadingCustomParams
        }, {
            GameInviteContent = v5.createElement(v38, v39)
        }));
    end;
end;
