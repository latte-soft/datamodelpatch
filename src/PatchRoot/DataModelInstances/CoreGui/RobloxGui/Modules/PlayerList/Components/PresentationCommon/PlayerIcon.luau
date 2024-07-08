local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Flags.FFlagMobilePlayerList);
local v3 = require(l_RobloxGui_0.Modules.Flags.FFlagPlayerIconAvatarFix);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local l_WithLayoutValues_0 = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v11 = v4.PureComponent:extend("PlayerIcon");
v11.validateProps = v7.strictInterface({
    player = v8, 
    layoutOrder = v7.optional(v7.integer), 
    isSmallTouchDevice = v7.optional(v7.boolean), 
    playerIconInfo = v7.strictInterface({
        isPlaceOwner = v7.boolean, 
        avatarIcon = v7.optional(v7.table), 
        specialGroupIcon = v7.optional(v7.table)
    }), 
    playerRelationship = v7.strictInterface({
        isBlocked = v7.boolean, 
        friendStatus = v7.enum(Enum.FriendStatus), 
        isFollowing = v7.boolean, 
        isFollower = v7.boolean
    })
});
local function _(v12, v13)
    local v14 = v12.FriendIcons[v13.friendStatus];
    if not v13.isBlocked then
        if not v14 then
            return nil;
        else
            return v14;
        end;
    else
        return v12.BlockedIcon;
    end;
end;
local function _(v16, v17, v18, v19)
    local v20 = v16.MembershipIcons[v17.MembershipType];
    local v21 = if not v19.isBlocked then v16.FriendIcons[v19.friendStatus] or nil else v16.BlockedIcon;
    if not v21 then
        if not v18.isPlaceOwner then
            if not v16.CustomPlayerIcons[v17.UserId] then
                if not v18.specialGroupIcon then
                    if not v19.isFollowing then
                        if not v20 then
                            return "";
                        else
                            return v20;
                        end;
                    else
                        return v16.FollowingIcon;
                    end;
                else
                    return v18.specialGroupIcon;
                end;
            else
                return v16.CustomPlayerIcons[v17.UserId];
            end;
        else
            return v16.PlaceOwnerIcon;
        end;
    else
        return v21;
    end;
end;
v11.render = function(v23)
    return l_WithLayoutValues_0(function(v24)
        local v25 = nil;
        v25 = if not v3 then v23.props.playerIconInfo.avatarIcon else v23.props.playerIconInfo and v23.props.playerIconInfo.avatarIcon;
        if v25 == nil then
            v25 = v24.DefaultThumbnail;
        end;
        if not v24.IsTenFoot then
            if not v2 or not v23.props.isSmallTouchDevice then
                local l_createElement_0 = v4.createElement;
                local l_l_ImageSetLabel_0_0 = l_ImageSetLabel_0;
                local v28 = {
                    LayoutOrder = v23.props.layoutOrder, 
                    Size = v24.PlayerIconSize, 
                    BackgroundTransparency = 1
                };
                local l_player_0 = v23.props.player;
                local l_playerIconInfo_0 = v23.props.playerIconInfo;
                local l_playerRelationship_0 = v23.props.playerRelationship;
                local v32 = v24.MembershipIcons[l_player_0.MembershipType];
                local v33 = if not l_playerRelationship_0.isBlocked then v24.FriendIcons[l_playerRelationship_0.friendStatus] or nil else v24.BlockedIcon;
                v28.Image = if not v33 then if l_playerIconInfo_0.isPlaceOwner then v24.PlaceOwnerIcon else if v24.CustomPlayerIcons[l_player_0.UserId] then v24.CustomPlayerIcons[l_player_0.UserId] else if l_playerIconInfo_0.specialGroupIcon then l_playerIconInfo_0.specialGroupIcon else if l_playerRelationship_0.isFollowing then v24.FollowingIcon else v32 or "" else v33;
                v28.BorderSizePixel = 0;
                return l_createElement_0(l_l_ImageSetLabel_0_0, v28);
            else
                local l_createElement_1 = v4.createElement;
                local l_l_ImageSetLabel_0_1 = l_ImageSetLabel_0;
                local v36 = {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, v24.PlayerNamePaddingXMobile, 0.5, 0), 
                    Size = v24.PlayerIconSizeMobile, 
                    BackgroundTransparency = 1
                };
                local l_player_1 = v23.props.player;
                local l_playerIconInfo_1 = v23.props.playerIconInfo;
                local l_playerRelationship_1 = v23.props.playerRelationship;
                local v40 = v24.MembershipIcons[l_player_1.MembershipType];
                local v41 = if not l_playerRelationship_1.isBlocked then v24.FriendIcons[l_playerRelationship_1.friendStatus] or nil else v24.BlockedIcon;
                v36.Image = if not v41 then if l_playerIconInfo_1.isPlaceOwner then v24.PlaceOwnerIcon else if v24.CustomPlayerIcons[l_player_1.UserId] then v24.CustomPlayerIcons[l_player_1.UserId] else if l_playerIconInfo_1.specialGroupIcon then l_playerIconInfo_1.specialGroupIcon else if l_playerRelationship_1.isFollowing then v24.FollowingIcon else v40 or "" else v41;
                v36.BorderSizePixel = 0;
                return l_createElement_1(l_l_ImageSetLabel_0_1, v36);
            end;
        else
            return v4.createElement("ImageLabel", {
                LayoutOrder = v23.props.layoutOrder or 1, 
                Size = v24.PlayerIconBackgroundSize, 
                BackgroundTransparency = 1, 
                Image = v24.PlayerBackgroundImage
            }, {
                v4.createElement("ImageLabel", {
                    Size = v24.PlayerIconSize, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = v25, 
                    BorderSizePixel = 0
                })
            });
        end;
    end);
end;
return v5.connect(function(v42)
    return {
        isSmallTouchDevice = v42.displayOptions.isSmallTouchDevice
    };
end, nil)(v11);
