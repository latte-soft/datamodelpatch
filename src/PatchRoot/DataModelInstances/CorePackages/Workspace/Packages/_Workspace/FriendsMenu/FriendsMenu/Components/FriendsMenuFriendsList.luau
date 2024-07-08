local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Enums_0 = l_script_FirstAncestor_0.Enums;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Components_0.FriendRow);
local v10 = require(l_Components_0.EmptyFriendsList);
local v11 = require(l_Components_0.FriendsListMsg);
local v12 = require(l_Context_0.FriendsListContext);
local _ = require(l_Enums_0.FriendMenuType);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_VerticalScrollView_0 = v8.App.Container.VerticalScrollView;
return function(v16)
    local v17 = v7.useContext(v12);
    local l_friends_0 = v17.friends;
    local l_isFetchingFriends_0 = v17.isFetchingFriends;
    local l_isFriendsListFetchFailed_0 = v17.isFriendsListFetchFailed;
    local l_hasFriends_0 = v17.hasFriends;
    local v22 = v7.useRef(nil);
    v7.useEffect(function()
        if l_UserInputService_0.GamepadEnabled then
            local l_current_0 = v22.current;
            local v24 = nil;
            if l_current_0 then
                v24 = l_current_0:FindFirstAncestorOfClass("ScreenGui");
                if not (not v24 or not v24.Enabled) and l_GuiService_0.SelectedCoreObject == nil then
                    l_GuiService_0:AddSelectionParent(v16.parentComponentName, l_current_0);
                    for _, v26 in ipairs(l_current_0:GetChildren()) do
                        if v26:IsA("ImageButton") and v26.LayoutOrder == 1 then
                            l_GuiService_0.SelectedCoreObject = v26;
                        end;
                    end;
                end;
            end;
            return function()
                if not ((not l_GuiService_0.SelectedCoreObject or not v24) or l_GuiService_0.SelectedCoreObject.Parent ~= nil and not v24:IsAncestorOf(l_GuiService_0.SelectedCoreObject)) then
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                l_GuiService_0:RemoveSelectionGroup(v16.parentComponentName);
            end;
        else
            return ;
        end;
    end, {
        v22.current, 
        l_friends_0
    });
    local v30 = v7.useMemo(function()
        local v27 = {
            RowListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            })
        };
        for v28, v29 in ipairs(l_friends_0) do
            v27["User-" .. tostring(v29.id)] = v7.createElement(v9, {
                friend = v29, 
                layoutOrder = v28, 
                isFullRowActivatable = l_UserInputService_0.GamepadEnabled, 
                menuType = v16.menuType, 
                sidePadding = v16.sidePadding
            });
        end;
        return v27;
    end, {
        l_friends_0
    });
    local _ = nil;
    return v7.createElement(l_VerticalScrollView_0, {
        layoutOrder = v16.layoutOrder, 
        size = v16.size, 
        useAutomaticCanvasSize = true, 
        canvasSizeY = UDim.new(1, 0), 
        selectable = false, 
        scrollingFrameRef = v22
    }, if not l_isFriendsListFetchFailed_0 then if l_isFetchingFriends_0 then v30 else if l_hasFriends_0 then if #l_friends_0 > 0 then v30 else v7.createElement(v11, {
        msgType = "noResultFriendsList"
    }) else v7.createElement(v10) else v7.createElement(v11, {
        msgType = "errorFriendsList"
    }));
end;
