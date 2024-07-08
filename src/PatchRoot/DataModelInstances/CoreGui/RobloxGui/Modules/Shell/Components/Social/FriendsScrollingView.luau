local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = nil;
pcall(function()
    v2 = game:GetService("PlatformService");
end);
local v3 = require(l_Modules_0.Common.Roact);
local l_Components_0 = l_Modules_0.Shell.Components;
local v5 = require(l_Components_0.Social.PresenceCard);
local v6 = require(l_Components_0.Common.WindowedScrollingFrame);
local v7 = require(l_Modules_0.Common.Immutable);
local v8 = require(l_Components_0.Common.Spinner);
local v9 = require(l_Components_0.Common.SideBar);
local v10 = require(l_Modules_0.Shell.Utility);
local v11 = require(l_Modules_0.Shell.EventHub);
local v12 = require(l_Modules_0.Shell.GameJoin);
local v13 = require(l_Modules_0.Shell.LocalizedStrings);
local v14 = require(l_Modules_0.Shell.SoundManager);
local v15 = require(l_Modules_0.Shell.Components.Common.RedirectComponent);
local v16 = require(l_Components_0.Common.UserThumbnailLoader);
local v17 = {
    JoinGame = v13:LocalizedString("JoinGameWord"), 
    ViewDetails = v13:LocalizedString("ViewGameDetailsWord"), 
    ViewProfile = v13:LocalizedString("ViewGamerCardWord"), 
    EmptyFriendSideBar = v13:LocalizedString("EmptyFriendSideBarWord")
};
local v18 = v3.PureComponent:extend("FriendsScrollingView");
v18.init = function(v19)
    v19.state = {
        sideBarInFocus = false, 
        sideBarShow = false, 
        currentSelectedIndex = 1
    };
    v19.onSideBarClose = function()
        v19:setState({
            sideBarInFocus = false, 
            sideBarShow = false
        });
    end;
    v19.onSideBarOpen = function(_)
        v10.SetSelectedCoreObject(nil);
        v19:setState({
            sideBarInFocus = true, 
            sideBarShow = true
        });
    end;
    v19.groupKey = l_HttpService_0:GenerateGUID(false);
end;
v18.render = function(v21)
    local l_props_0 = v21.props;
    local l_friendsData_0 = l_props_0.friendsData;
    local l_initialized_0 = l_props_0.initialized;
    local v25 = v21.props.actionPriority or 0;
    local l_hide_0 = l_props_0.hide;
    local l_inFocus_0 = l_props_0.inFocus;
    local v28 = false;
    local v29 = false;
    local v30 = {};
    if not (l_hide_0 or not l_inFocus_0) then
        v28 = v21.state.sideBarShow and v21.state.sideBarInFocus;
        if not v28 and #l_friendsData_0 > 0 then
            v29 = true;
        end;
    end;
    if not l_initialized_0 or not l_friendsData_0 then
        v30.Spinner = v3.createElement(v8);
    elseif #l_friendsData_0 > 0 then
        local v31 = Vector2.new(440, 120);
        local v32 = v31.Y + 20;
        local v33 = math.floor(v21.props.size.Y.Offset / v32);
        assert(v33 ~= 0, "The scrolling window is too small to accommodate any presence card.");
        v30.FriendsScrollingFrame = v3.createElement(v6, {
            items = l_friendsData_0, 
            itemSize = v31, 
            itemsPaddingOffset = 20, 
            itemOffsetStart = v33 > 2 and v32 or 0, 
            itemOffsetEnd = (v21.props.size.Y.Offset - v33 * v32) + 20, 
            scrollingDirection = Enum.ScrollingDirection.Y, 
            inFocus = v29, 
            renderItem = function(v34, v35)
                local v36 = v7.JoinDictionaries(v34, {
                    layoutOrder = v35, 
                    size = UDim2.new(0, v31.X, 0, v31.Y), 
                    focused = l_inFocus_0 and v21.state.currentSelectedIndex == v35, 
                    selected = v29 and v21.state.currentSelectedIndex == v35
                });
                v36.onActivated = function(_)
                    v14:Play("SideMenuSlideIn");
                    v21.onSideBarOpen();
                end;
                v36.onSelectionGained = function()
                    if v21.state.currentSelectedIndex ~= v35 then
                        v21:setState({
                            currentSelectedIndex = v35
                        });
                    end;
                end;
                return v3.createElement(v5, v36);
            end
        });
        local v38 = l_friendsData_0[v21.state.currentSelectedIndex];
        if not ((not l_inFocus_0 or not v38) or not v38.robloxuid) then
            v30.ProfileImage = v3.createElement(v16, {
                rbxuid = v38.robloxuid, 
                thumbnailType = Enum.ThumbnailType.AvatarThumbnail, 
                thumbnailSize = Enum.ThumbnailSize.Size352x352, 
                position = UDim2.new(1, 101, 0, 0), 
                size = UDim2.new(0, 680, 0, 680), 
                backgroundTransparency = 1, 
                showSpinner = true
            });
        end;
        if not (not v21.state.sideBarShow or not v38) then
            local v39 = nil;
            v39 = {};
            if (v38.robloxuid and v38.robloxuid > 0) and v38.robloxStatus == "InGame" then
                local l_placeId_0 = v38.placeId;
                local l_lastLocation_0 = v38.lastLocation;
                local l_robloxuid_0 = v38.robloxuid;
                table.insert(v39, {
                    text = v17.JoinGame, 
                    callback = function()
                        v12:StartGame(v12.JoinType.Follow, l_robloxuid_0, nil, "FriendsCarousel");
                    end
                });
                local l_l_placeId_0_0 = l_placeId_0 --[[ copy: 17 -> 21 ]];
                table.insert(v39, {
                    text = v17.ViewDetails, 
                    callback = function()
                        v11:dispatchEvent(v11.Notifications.OpenGameDetail, l_l_placeId_0_0, l_lastLocation_0, nil);
                    end
                });
            end;
            if not (not (v38.xuid and #v38.xuid > 0) or not v2) then
                local l_xuid_0 = v38.xuid;
                local l_l_xuid_0_0 = l_xuid_0 --[[ copy: 17 -> 20 ]];
                table.insert(v39, {
                    text = v17.ViewProfile, 
                    callback = function()
                        pcall(function()
                            v2:PopupProfileUI(Enum.UserInputType.Gamepad1, l_l_xuid_0_0);
                        end);
                    end
                });
            end;
            local v46 = nil;
            if #v39 == 0 then
                v46 = v17.EmptyFriendSideBar;
                v39 = nil;
            end;
            v30.SideBar = v3.createElement(v9, {
                actionPriority = v25 + 1, 
                text = v46, 
                buttons = v39, 
                inFocus = v28, 
                onClose = v21.onSideBarClose, 
                onRemoveFocus = function()
                    v21:setState({
                        sideBarInFocus = false
                    });
                end
            });
        end;
    else
        v30.NoFriendsView = l_props_0.noFriendsView;
    end;
    v30.NavObj = v3.createElement(v15, {
        ActionPriority = v25, 
        StringKey = v21.groupKey, 
        InFocus = l_inFocus_0, 
        RedirectBack = l_props_0.redirectBack, 
        RedirectLeft = l_props_0.redirectLeft, 
        RedirectRight = l_props_0.redirectRight, 
        RedirectUp = l_props_0.redirectUp, 
        RedirectDown = l_props_0.redirectDown
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v21.props.size, 
        Position = v21.props.position, 
        [v3.Ref] = function(v47)
            v21.ref = v47;
        end, 
        Visible = not l_hide_0
    }, v30);
end;
v18.didMount = function(v48)
    delay(0, function()
        if not (not (v48.props.hide == false) or not v48.props.inFocus) and v48.ref ~= nil then
            v10.RemoveSelectionGroup(v48.groupKey);
            v10.AddSelectionParent(v48.groupKey, v48.ref);
        end;
    end);
end;
v18.didUpdate = function(v49, v50, _)
    if v49.props.hide or v49.props.inFocus == v50.inFocus then
        return ;
    else
        if not v49.props.inFocus then
            v10.RemoveSelectionGroup(v49.groupKey);
        elseif v49.ref then
            v10.RemoveSelectionGroup(v49.groupKey);
            v10.AddSelectionParent(v49.groupKey, v49.ref);
            return ;
        end;
        return ;
    end;
end;
v18.willUnmount = function(v52)
    v10.RemoveSelectionGroup(v52.groupKey);
end;
return v18;
