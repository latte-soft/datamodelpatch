local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.SocialLibraries);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.UIBlox);
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v6 = require(script.Parent.UserCellWithCheckbox);
local l_AvatarCircle_0 = v2.Components.AvatarCircle;
local l_FilteredScrollingList_0 = v2.Components.FilteredScrollingList;
local v9 = require(script.Parent.SelectedMembersBar);
local _ = function(v10, v11)
    for _, v13 in ipairs(v10) do
        if v13.id == v11 then
            return true;
        end;
    end;
    return false;
end;
local v15 = v3.PureComponent:extend("SelectChatMembers");
v15.defaultProps = {
    topBarHeight = 88, 
    entryHeight = 48, 
    friendEntries = {}, 
    selectedUsers = {}, 
    onlinePresenceText = "Online", 
    offlinePresenceText = "Offline", 
    sortComparator = nil, 
    filterPredicate = nil, 
    onEntryActivated = nil, 
    isDebugEnabled = false, 
    LayoutOrder = nil
};
v15.init = function(v16)
    v16.renderSelectedMembersBarEntry = function(v17)
        return v4.Style.withStyle(function(v18)
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = v3.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 2)
                }), 
                avatarCircle = v3.createElement(l_AvatarCircle_0, {
                    thumbnails = {
                        v17.thumbnail
                    }, 
                    onActivated = function()
                        v16.props.onEntryActivated(v17);
                    end, 
                    circleColor3 = v18.Theme.BackgroundMuted.Color, 
                    circleInteriorBackgroundColor3 = v18.Theme.PlaceHolder.Color, 
                    circleInteriorBackgroundTransparency = v18.Theme.PlaceHolder.Transparency, 
                    presenceImage = v17.presenceImage, 
                    showNewPresenceImage = true, 
                    presenceImageColor3 = v18.Theme.OnlineStatus.Color, 
                    presenceImageTransparency = v18.Theme.OnlineStatus.Transparency
                }), 
                displayName = v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 15), 
                    TextSize = v18.Font.Footer.RelativeSize * v18.Font.BaseSize, 
                    TextColor3 = v18.Theme.TextEmphasis.Color, 
                    TextTransparency = v18.Theme.TextEmphasis.Transparency, 
                    Font = v18.Font.Footer.Font, 
                    Text = v17.displayName, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                })
            });
        end);
    end;
    v16.renderEntry = function(v19)
        local v20 = nil;
        if v19.presence == l_UserModel_0.PresenceType.ONLINE then
            v20 = v16.props.onlinePresenceText;
        elseif v19.presence == l_UserModel_0.PresenceType.OFFLINE then
            v20 = v16.props.offlinePresenceText;
        elseif not (v19.presence ~= l_UserModel_0.PresenceType.IN_GAME) or v19.presence == l_UserModel_0.PresenceType.IN_STUDIO then
            v20 = v19.presenceText;
        end;
        local v21 = nil;
        local l_selectedUsers_0 = v16.props.selectedUsers;
        local l_id_0 = v19.id;
        local v24;
        for _, v26 in ipairs(l_selectedUsers_0) do
            if v26.id == l_id_0 then
                v24 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v24 = false;
        ::label0::;
        v21 = not not v24 or false;
        return v4.Style.withStyle(function(v27)
            return v3.createElement("Folder", nil, {
                userIdValue = v16.props.isDebugEnabled and v3.createElement("StringValue", {
                    Value = v19.id
                }), 
                userCell = v3.createElement(v6, {
                    style = v27, 
                    user = v19, 
                    secondaryTitleText = v19.alias, 
                    subTitleText = v20, 
                    isCheckboxActivated = v21, 
                    onActivated = v16.props.onEntryActivated
                })
            });
        end);
    end;
end;
v15.render = function(v28)
    return v4.Style.withStyle(function(v29)
        local l_Theme_0 = v29.Theme;
        local l_Font_0 = v29.Font;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v28.props.topBarHeight), 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            LayoutOrder = v28.props.LayoutOrder, 
            ClipsDescendants = true
        }, {
            layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            selectedMembersBar = v3.createElement(v9, {
                barBackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                barBackgroundTransparency = l_Theme_0.BackgroundMuted.Transparency, 
                selectedUsers = v28.props.selectedUsers, 
                maxSize = v28.props.maxSelections, 
                LayoutOrder = 1, 
                renderEntry = v28.renderSelectedMembersBarEntry
            }), 
            friendsListContainer = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -99), 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                friendsList = v3.createElement(l_FilteredScrollingList_0, {
                    searchIconImage = "rbxasset://textures/ui/LuaChatV2/common_search.png", 
                    searchIconColor3 = l_Theme_0.IconDefault.Color, 
                    searchDividerTransparency = 1, 
                    searchDividerHeight = 0, 
                    searchBackgroundColor3 = l_Theme_0.BackgroundMuted.Color, 
                    searchInputTextColor3 = l_Theme_0.TextDefault.Color, 
                    searchInputTextSize = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize, 
                    searchInputTextFont = l_Font_0.Body.Font, 
                    searchPlaceholderText = v28.props.searchFriendsText, 
                    searchPlaceholderTextTransparency = l_Theme_0.TextDefault.Transparency, 
                    searchPlaceholderTextColor3 = l_Theme_0.TextDefault.Color, 
                    searchClearIconColor3 = l_Theme_0.ContextualPrimaryContent.Color, 
                    searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-clear-solid.png", 
                    scrollBarImageTransparency = v29.Theme.UIDefault.Transparency, 
                    scrollBarImageColor3 = v29.Theme.UIDefault.Color, 
                    entries = v28.props.friendEntries, 
                    renderEntry = v28.renderEntry, 
                    entryHeight = v28.props.entryHeight, 
                    sortComparator = v28.props.sortComparator, 
                    filterPredicate = v28.props.filterPredicate, 
                    extraProps = {
                        selectedUserIds = v28.props.selectedUsers, 
                        user = v28.props.user
                    }
                })
            })
        });
    end);
end;
return v15;
