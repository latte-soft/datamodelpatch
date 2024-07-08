local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_t_0 = v2.t;
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Components.PlayerLabelV2);
local v9 = require(l_Parent_0.Flags.GetFFlagIGMGamepadSelectionHistory);
local v10 = require(l_Parent_0.Components.Divider);
local v11 = require(script.Parent.SendInviteButton);
local v12 = require(script.Parent.SearchBox);
local v13 = require(l_Parent_0.Components.BarOnTopScrollingFrame);
local v14 = require(l_Parent_0.Utility.PlayerSearchPredicate);
local v15 = require(l_Parent_0.Components.Connection.FocusHandler);
local v16 = require(l_Parent_0.Components.Connection.RootedConnection);
local v17 = require(l_Parent_0.Resources.Constants);
local l_InviteStatus_0 = v17.InviteStatus;
local v19 = require(l_Parent_0.Thunks.InviteUserToPlaceId);
local v20 = tostring(game.PlaceId);
local v21 = l_Roact_0.PureComponent:extend("InviteFriendsList");
v21.validateProps = l_t_0.strictInterface({
    friends = l_t_0.array(l_t_0.strictInterface({
        IsOnline = l_t_0.boolean, 
        Id = l_t_0.integer, 
        Username = l_t_0.string, 
        DisplayName = l_t_0.string
    })), 
    invitesState = l_t_0.table, 
    shouldForgetPreviousSelection = not not v9() and l_t_0.optional(l_t_0.boolean) or nil, 
    dispatchInviteUserToPlaceId = l_t_0.callback, 
    canCaptureFocus = l_t_0.boolean, 
    searchBoxRef = l_t_0.table
});
v21.init = function(v22)
    v22.playerRefs = v6.createRefCache();
    v22.state = {
        searchText = ""
    };
    v22.inviteAnimationInProgress = {};
end;
v21.renderListEntries = function(v23)
    local l_friends_0 = v23.props.friends;
    local v25 = #l_friends_0;
    local v26 = 1;
    local v27 = {};
    local v28 = 0;
    v27.ListLayout = l_Roact_0.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right
    });
    for v29, v30 in pairs(l_friends_0) do
        local v31 = tostring(v30.Id);
        local v32 = v23.props.invitesState[v31];
        local v33 = v14(v23.state.searchText, v30.Username, v30.DisplayName);
        if v33 then
            v28 = v28 + 1;
        end;
        v27["friend_" .. v29] = l_Roact_0.createElement(v8, {
            username = v30.Username, 
            displayName = v30.DisplayName, 
            userId = v30.Id, 
            isOnline = v30.IsOnline, 
            isSelected = false, 
            LayoutOrder = v26, 
            Visible = v33, 
            [l_Roact_0.Ref] = v23.playerRefs[v29], 
            onActivated = function()
                local v34 = v32 == l_InviteStatus_0.Pending;
                local v35 = v32 == l_InviteStatus_0.Success;
                local v36 = v23.inviteAnimationInProgress[v30.Id];
                if not ((v34 or v35) or v36) then
                    v23.props.dispatchInviteUserToPlaceId(v31, v20);
                end;
            end
        }, {
            InviteButton = l_Roact_0.createElement(v11, {
                userInviteStatus = v32, 
                onActivated = function()
                    v23.props.dispatchInviteUserToPlaceId(v31, v20);
                end, 
                animationBegun = function()
                    v23.inviteAnimationInProgress[v30.Id] = true;
                end, 
                animationEnded = function()
                    v23.inviteAnimationInProgress[v30.Id] = nil;
                end
            })
        });
        v26 = v26 + 1;
        if v29 < v25 then
            v27["divider_" .. v26] = l_Roact_0.createElement(v10, {
                LayoutOrder = v26, 
                Size = UDim2.new(1, -104, 0, 1), 
                Visible = v33
            });
            v26 = v26 + 1;
        end;
    end;
    return v27, v28;
end;
v21.render = function(v37)
    local v38, v39 = v37:renderListEntries();
    local v41 = l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        SearchBox = l_Roact_0.createElement(v12, {
            Size = UDim2.new(1, -48, 0, 36), 
            Position = UDim2.new(0.5, 0, 0, 8), 
            AnchorPoint = Vector2.new(0.5, 0), 
            searchUpdated = function(v40)
                v37:setState({
                    searchText = v40
                });
            end, 
            searchCleared = function()
                v37:setState({
                    searchText = ""
                });
                if v37.props.canCaptureFocus then
                    l_GuiService_0.SelectedCoreObject = v37.props.searchBoxRef:getValue();
                end;
            end, 
            itemRef = v37.props.searchBoxRef
        }), 
        List = l_Roact_0.createElement(v13, {
            Position = UDim2.new(0, 0, 0, 64), 
            Size = UDim2.new(1, 0, 1, -64), 
            CanvasSize = UDim2.new(1, 0, 0, v39 * 72)
        }, v38)
    });
    local v42 = nil;
    if v9() then
        v42 = v37.props.shouldForgetPreviousSelection;
    end;
    return l_Roact_0.createElement(v16, {
        render = function(v43)
            return l_Roact_0.createElement(v15, {
                isFocused = v37.props.canCaptureFocus and v43, 
                shouldForgetPreviousSelection = v42, 
                didFocus = not not v9() and function(v44)
                    l_GuiService_0.SelectedCoreObject = (v44 or v37:getFirstVisiblePlayerRef()) or v37.props.searchBoxRef:getValue();
                end or function()
                    l_GuiService_0.SelectedCoreObject = v37:getFirstVisiblePlayerRef() or v37.props.searchBoxRef:getValue();
                end
            }, {
                FriendsList = v41
            });
        end
    });
end;
v21.getFirstVisiblePlayerRef = function(v45)
    for v46, v47 in pairs(v45.props.friends) do
        if v14(v45.state.searchText, v47.Username, v47.DisplayName) then
            return v45.playerRefs[v46]:getValue();
        end;
    end;
    return nil;
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v48, _)
    local v50 = nil;
    if v9() then
        local v51 = true;
        if v48.menuPage ~= v17.MainPagePageKey then
            v51 = v48.currentZone == 0;
        end;
        v50 = v51;
    end;
    return {
        invitesState = v48.invites, 
        shouldForgetPreviousSelection = v50
    };
end, function(v52)
    return {
        dispatchInviteUserToPlaceId = function(v53, v54)
            v52(v19(v53, v54));
        end
    };
end)(v21);
