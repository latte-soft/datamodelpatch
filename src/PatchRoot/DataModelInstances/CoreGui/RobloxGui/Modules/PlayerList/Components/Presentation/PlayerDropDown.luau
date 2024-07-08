local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Otter);
local v8 = require(l_CorePackages_0.UIBlox);
local l_Parent_0 = script.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Connection.LayoutValues).WithLayoutValues;
local v11 = require(script.Parent.DropDownButton);
local v12 = require(script.Parent.DropDownPlayerHeader);
local v13 = require(script.Parent.FriendDropDownButton);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v16 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local l_Images_0 = v8.App.ImageSet.Images;
local v18 = require(l_RobloxGui_0.Modules.isNewInGameMenuEnabled);
local l_Parent_1 = l_Parent_0.Parent;
local v20 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v21 = require(l_Parent_1.Thunks.BlockPlayer);
local v22 = require(l_Parent_1.Thunks.UnblockPlayer);
local v23 = require(l_Parent_1.Thunks.RequestFriendship);
local v24 = v4.PureComponent:extend("PlayerDropDown");
v24.validateProps = v6.strictInterface({
    positionY = v6.number, 
    minPositionBoundY = v6.number, 
    maxPositionBoundY = v6.number, 
    contentsVisible = v6.boolean, 
    selectedPlayer = v6.optional(v6.instanceIsA("Player")), 
    isVisible = v6.boolean, 
    playerRelationship = v6.optional(v6.strictInterface({
        isBlocked = v6.boolean, 
        friendStatus = v6.enum(Enum.FriendStatus), 
        isFollowing = v6.boolean, 
        isFollower = v6.boolean
    })), 
    inspectMenuEnabled = v6.boolean, 
    isTenFootInterface = v6.boolean, 
    subjectToChinaPolicies = v6.boolean, 
    closeDropDown = v6.callback, 
    blockPlayer = v6.callback, 
    unblockPlayer = v6.callback, 
    requestFriendship = v6.callback
});
v24.init = function(v25)
    v25.innerFrameRef = v4.createRef();
    v25.motorOptions = {
        dampingRatio = 1, 
        frequency = 4
    };
    v25.motor = v7.createSingleMotor(1);
    v25.motor:onStep(function(v26)
        local l_current_0 = v25.innerFrameRef.current;
        if l_current_0 then
            if v26 == 1 then
                l_current_0.Visible = false;
            else
                l_current_0.Visible = true;
            end;
            l_current_0.Position = UDim2.new(v26, 0, 0, 0);
        end;
    end);
    v25.dropDownPosition = 0;
end;
v24.createFriendButton = function(v28, v29)
    return v4.createElement(v13, {
        layoutOrder = 1, 
        playerRelationship = v29, 
        selectedPlayer = v28.props.selectedPlayer, 
        dropDownOpen = v28.props.isVisible, 
        requestFriendship = v28.props.requestFriendship, 
        contentVisible = true
    });
end;
v24.createBlockButton = function(v30, v31)
    local l_selectedPlayer_0 = v30.props.selectedPlayer;
    return v4.createElement(v11, {
        layoutOrder = 4, 
        text = not not v31.isBlocked and v16:FormatByKey("PlayerDropDown.UnBlock") or v16:FormatByKey("PlayerDropDown.Block"), 
        icon = l_Images_0["icons/actions/block"], 
        lastButton = false, 
        forceShowOptions = false, 
        onActivated = function()
            if not v31.isBlocked then
                v30.props.blockPlayer(l_selectedPlayer_0);
                return ;
            else
                v30.props.unblockPlayer(l_selectedPlayer_0);
                return ;
            end;
        end
    });
end;
v24.createReportButton = function(v33)
    local l_selectedPlayer_1 = v33.props.selectedPlayer;
    return v4.createElement(v11, {
        layoutOrder = 5, 
        text = v16:FormatByKey("PlayerDropDown.Report"), 
        icon = l_Images_0["icons/actions/feedback"], 
        lastButton = true, 
        forceShowOptions = false, 
        onActivated = function()
            if not v18() then
                require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_selectedPlayer_1, v33.__componentName);
                v33.props.closeDropDown();
                return ;
            else
                require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(l_selectedPlayer_1, v33.__componentName);
                return ;
            end;
        end
    });
end;
v24.createInspectButton = function(v35)
    local l_selectedPlayer_2 = v35.props.selectedPlayer;
    return v4.createElement(v11, {
        layoutOrder = 3, 
        text = v16:FormatByKey("PlayerDropDown.Examine"), 
        icon = l_Images_0["icons/actions/zoomIn"], 
        lastButton = l_selectedPlayer_2 == l_LocalPlayer_0, 
        forceShowOptions = false, 
        onActivated = function()
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(l_selectedPlayer_2.UserId, "leaderBoard");
            v35.props.closeDropDown();
        end
    });
end;
v24.render = function(v37)
    return l_WithLayoutValues_0(function(v38)
        local l_selectedPlayer_3 = v37.props.selectedPlayer;
        if l_selectedPlayer_3 and not v37.props.isTenFootInterface then
            local v40 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v38.DropDownButtonPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlayerHeader = v4.createElement(v12, {
                    player = v37.props.selectedPlayer
                })
            };
            local v41 = v38.DropDownButtonPadding + v38.DropDownHeaderSizeY;
            local l_playerRelationship_0 = v37.props.playerRelationship;
            if l_selectedPlayer_3 ~= l_LocalPlayer_0 then
                if not l_playerRelationship_0.isBlocked then
                    v40.FriendButton = v37:createFriendButton(l_playerRelationship_0);
                    v41 = (v41 + v38.DropDownButtonPadding) + v38.DropDownButtonSizeY;
                end;
                v40.BlockButton = v37:createBlockButton(l_playerRelationship_0);
                v41 = (v41 + v38.DropDownButtonPadding) + v38.DropDownButtonSizeY;
                v40.ReportButton = v37:createReportButton();
                v41 = (v41 + v38.DropDownButtonPadding) + v38.DropDownButtonSizeY;
            end;
            if v37.props.inspectMenuEnabled then
                v40.InspectButton = v37:createInspectButton();
                v41 = (v41 + v38.DropDownButtonPadding) + v38.DropDownButtonSizeY;
            end;
            v41 = v41 - v38.DropDownButtonPadding;
            local v43 = v37.dropDownPosition + (v38.DropDownHeaderBackgroundSize - v38.DropDownHeaderSizeY);
            if v37.props.maxPositionBoundY < v43 + v41 then
                v43 = v43 - ((v43 + v41) - v37.props.maxPositionBoundY);
            elseif v43 < v37.props.minPositionBoundY then
                v43 = v43 + (v37.props.minPositionBoundY - v43);
            end;
            return v4.createElement("Frame", {
                LayoutOrder = v37.props.layoutOrder, 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(0, 0, 0, v43), 
                Size = UDim2.new(0, v38.PlayerDropDownSizeX + v38.PlayerDropDownOffset, 0, v41), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                InnerFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, -v38.PlayerDropDownOffset, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    [v4.Ref] = v37.innerFrameRef
                }, v40)
            });
        else
            return nil;
        end;
    end);
end;
v24.getDropDownPosition = function(v44)
    if not v44.props.isVisible or not v44.props.contentsVisible then
        return 1;
    else
        return 0;
    end;
end;
v24.didMount = function(v45)
    local v46 = v45:getDropDownPosition();
    v45.motor:start();
    v45.motor:setGoal(v7.spring(v46, v45.motorOptions));
end;
v24.willUpdate = function(v47, v48, _)
    if v48.selectedPlayer ~= v47.props.selectedPlayer then
        v47.dropDownPosition = v48.positionY;
    end;
end;
v24.didUpdate = function(v50, v51, _)
    if v51.selectedPlayer ~= v50.props.selectedPlayer then
        v50.motor:setGoal(v7.instant(1));
        v50.motor:step(0);
    end;
    v50.motor:setGoal(v7.spring(v50:getDropDownPosition(), v50.motorOptions));
end;
v24.willUnmount = function(v53)
    v53.motor:destroy();
end;
return v5.UNSTABLE_connect2(function(v54)
    local l_selectedPlayer_4 = v54.playerDropDown.selectedPlayer;
    return {
        selectedPlayer = l_selectedPlayer_4, 
        isVisible = v54.playerDropDown.isVisible, 
        playerRelationship = l_selectedPlayer_4 and v54.playerRelationship[l_selectedPlayer_4.UserId], 
        inspectMenuEnabled = v54.displayOptions.inspectMenuEnabled, 
        isTenFootInterface = v54.displayOptions.isTenFootInterface, 
        subjectToChinaPolicies = v54.displayOptions.subjectToChinaPolicies
    };
end, function(v56)
    return {
        closeDropDown = function()
            return v56(v20());
        end, 
        blockPlayer = function(v57)
            return v56(v21(v57));
        end, 
        unblockPlayer = function(v58)
            return v56(v22(v58));
        end, 
        requestFriendship = function(v59, _)
            return v56(v23(v59));
        end
    };
end)(v24);
