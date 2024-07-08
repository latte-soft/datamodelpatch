local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(script.Parent.DropDownButtonAnimator);
local l_Images_0 = v6.App.ImageSet.Images;
local v9 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v11 = v4.PureComponent:extend("FriendDropDownButton");
v11.validateProps = v5.strictInterface({
    layoutOrder = v5.integer, 
    playerRelationship = v5.strictInterface({
        isBlocked = v5.boolean, 
        friendStatus = v5.enum(Enum.FriendStatus), 
        isFollowing = v5.boolean, 
        isFollower = v5.boolean
    }), 
    selectedPlayer = v5.optional(v5.instanceIsA("Player")), 
    dropDownOpen = v5.boolean, 
    requestFriendship = v5.callback
});
local function v15(v12)
    local v13 = l_Images_0["icons/actions/friends/friendAdd"];
    local v14 = l_Images_0["icons/actions/friends/friendRemove"];
    if v12 == Enum.FriendStatus.Friend then
        return v9:FormatByKey("PlayerDropDown.Unfriend"), v14;
    elseif not (v12 ~= Enum.FriendStatus.Unknown) or v12 == Enum.FriendStatus.NotFriend then
        return v9:FormatByKey("PlayerDropDown.FriendRequest"), v13;
    elseif v12 == Enum.FriendStatus.FriendRequestSent then
        return v9:FormatByKey("PlayerDropDown.CancelRequest"), v13;
    elseif v12 == Enum.FriendStatus.FriendRequestReceived then
        return v9:FormatByKey("PlayerDropDown.Accept"), v13;
    else
        return v9:FormatByKey("PlayerDropDown.Friend Request"), v13;
    end;
end;
v11.init = function(v16)
    v16.state = {
        unfriendConfirm = false
    };
end;
v11.render = function(v17)
    local l_playerRelationship_0 = v17.props.playerRelationship;
    local l_selectedPlayer_0 = v17.props.selectedPlayer;
    local v20 = nil;
    v20 = (not (l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend) or v17.state.unfriendConfirm) and function()
        if l_playerRelationship_0.friendStatus == Enum.FriendStatus.Friend then
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return ;
        elseif not (l_playerRelationship_0.friendStatus ~= Enum.FriendStatus.Unknown) or l_playerRelationship_0.friendStatus == Enum.FriendStatus.NotFriend then
            v17.props.requestFriendship(l_selectedPlayer_0, false);
            return ;
        elseif l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestSent then
            l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RevokeFriendship");
            l_RbxAnalyticsService_0:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown");
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
            return ;
        else
            if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
                l_RbxAnalyticsService_0:ReportCounter("PlayerDropDown-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "PlayerDropDown");
                v17.props.requestFriendship(l_selectedPlayer_0, true);
            end;
            return ;
        end;
    end or function()
        v17:setState({
            unfriendConfirm = true
        });
    end;
    local v21 = nil;
    if l_playerRelationship_0.friendStatus == Enum.FriendStatus.FriendRequestReceived then
        v21 = function()
            l_LocalPlayer_0:RevokeFriendship(l_selectedPlayer_0);
        end;
    end;
    local v22 = nil;
    if v17.state.unfriendConfirm then
        v22 = function()
            v17:setState({
                unfriendConfirm = false
            });
        end;
    end;
    local v23, v24 = v15(l_playerRelationship_0.friendStatus);
    return v4.createElement(v7, {
        layoutOrder = v17.props.layoutOrder, 
        text = v23, 
        icon = v24, 
        lastButton = false, 
        onActivated = v20, 
        forceShowOptions = v17.state.unfriendConfirm, 
        selectedPlayer = l_selectedPlayer_0, 
        onDecline = v21, 
        onDismiss = v22
    });
end;
v11.didUpdate = function(v25, v26, _)
    if v26.playerRelationship.friendStatus ~= v25.props.playerRelationship.friendStatus then
        v25:setState({
            unfriendConfirm = false
        });
    end;
    if not (v26.selectedPlayer == v25.props.selectedPlayer) or v26.dropDownOpen ~= v25.props.dropDownOpen then
        v25:setState({
            unfriendConfirm = false
        });
    end;
end;
return v11;
