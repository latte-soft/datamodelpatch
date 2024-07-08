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
local v21 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v22 = require(l_Parent_1.Thunks.BlockPlayer);
local v23 = require(l_Parent_1.Thunks.UnblockPlayer);
local v24 = require(l_Parent_1.Thunks.RequestFriendship);
local v25 = v4.PureComponent:extend("PlayerDropDown");
v25.validateProps = v6.strictInterface({
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
    preferredTransparency = v6.number, 
    closeDropDown = v6.callback, 
    blockPlayer = v6.callback, 
    unblockPlayer = v6.callback, 
    requestFriendship = v6.callback, 
    setPlayerListVisibility = v6.callback
});
local v26 = {
    dampingRatio = 1, 
    frequency = 4
};
v25.init = function(v27)
    v27.state = {
        allVisible = false, 
        contentVisible = false
    };
    local v28, v29 = v4.createBinding(1);
    v27.containerScale = v28;
    v27.updateContainerScale = v29;
    v27.containerScaleMotor = v7.createSingleMotor(0);
    v27.containerScaleMotor:onStep(function(v30)
        v27.updateContainerScale(v30);
    end);
    v28, v29 = v4.createBinding(1);
    v27.transparency = v28;
    v27.updateTransparency = v29;
    v27.transparencyMotor = v7.createSingleMotor(0);
    v27.transparencyMotor:onStep(function(v31)
        v27.updateTransparency(v31);
        if (not (v31 < 0.5) or not v27.props.isVisible) or not v27.props.contentsVisible then
            v27:setState({
                contentVisible = false
            });
        else
            v27:setState({
                contentVisible = true
            });
        end;
        v27:setState({
            allVisible = v31 < 1
        });
    end);
    v28, v29 = v4.createBinding(1);
    v27.buttonTransparency = v28;
    v27.updateButtonTransparency = v29;
    v27.buttonTransparencyMotor = v7.createSingleMotor(0);
    v27.buttonTransparencyMotor:onStep(function(v32)
        v27.updateButtonTransparency(v32);
    end);
end;
v25.createFriendButton = function(v33, v34)
    return v4.createElement(v13, {
        layoutOrder = 1, 
        playerRelationship = v34, 
        selectedPlayer = v33.props.selectedPlayer, 
        dropDownOpen = v33.props.isVisible, 
        requestFriendship = v33.props.requestFriendship, 
        contentVisible = v33.state.contentVisible
    });
end;
v25.createBlockButton = function(v35, v36)
    local l_selectedPlayer_0 = v35.props.selectedPlayer;
    return v4.createElement(v11, {
        contentVisible = v35.state.contentVisible, 
        buttonTransparency = v35.buttonTransparency, 
        layoutOrder = 4, 
        text = not not v36.isBlocked and v16:FormatByKey("PlayerDropDown.UnBlock") or v16:FormatByKey("PlayerDropDown.Block"), 
        icon = l_Images_0["icons/actions/block"], 
        lastButton = false, 
        forceShowOptions = false, 
        onActivated = function()
            if not v36.isBlocked then
                v35.props.blockPlayer(l_selectedPlayer_0);
                return ;
            else
                v35.props.unblockPlayer(l_selectedPlayer_0);
                return ;
            end;
        end
    });
end;
v25.createReportButton = function(v38)
    local l_selectedPlayer_1 = v38.props.selectedPlayer;
    return v4.createElement(v11, {
        contentVisible = v38.state.contentVisible, 
        buttonTransparency = v38.buttonTransparency, 
        layoutOrder = 5, 
        text = v16:FormatByKey("PlayerDropDown.Report"), 
        icon = l_Images_0["icons/actions/feedback"], 
        lastButton = true, 
        forceShowOptions = false, 
        onActivated = function()
            if not v18() then
                require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage):ReportPlayer(l_selectedPlayer_1, v38.__componentName);
                v38.props.closeDropDown();
                return ;
            else
                require(l_RobloxGui_0.Modules.InGameMenuInit).openReportDialog(l_selectedPlayer_1, v38.__componentName);
                return ;
            end;
        end
    });
end;
v25.createInspectButton = function(v40)
    local l_selectedPlayer_2 = v40.props.selectedPlayer;
    return v4.createElement(v11, {
        contentVisible = v40.state.contentVisible, 
        buttonTransparency = v40.buttonTransparency, 
        layoutOrder = 3, 
        text = v16:FormatByKey("PlayerDropDown.Examine"), 
        icon = l_Images_0["icons/actions/zoomIn"], 
        lastButton = l_selectedPlayer_2 == l_LocalPlayer_0, 
        forceShowOptions = false, 
        onActivated = function()
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(l_selectedPlayer_2.UserId, "leaderBoard");
            v40.props.closeDropDown();
            v40.props.setPlayerListVisibility(false);
        end
    });
end;
v25.render = function(v42)
    return l_WithLayoutValues_0(function(v43)
        local l_selectedPlayer_3 = v42.props.selectedPlayer;
        if l_selectedPlayer_3 and not v42.props.isTenFootInterface then
            local v45 = {
                UIScale = v4.createElement("UIScale", {
                    Scale = v42.containerScale
                }), 
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, v43.DropDownButtonPadding), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlayerHeader = v4.createElement(v12, {
                    player = v42.props.selectedPlayer, 
                    contentVisible = v42.state.contentVisible, 
                    transparency = v42.transparency
                })
            };
            local v46 = 4 * v43.DropDownButtonSizeY + v43.DropDownHeaderSizeY;
            local v47 = v43.DropDownButtonPadding + v43.DropDownHeaderSizeY;
            local l_playerRelationship_0 = v42.props.playerRelationship;
            if l_selectedPlayer_3 ~= l_LocalPlayer_0 then
                if not l_playerRelationship_0.isBlocked then
                    v45.FriendButton = v42:createFriendButton(l_playerRelationship_0);
                    v47 = (v47 + v43.DropDownButtonPadding) + v43.DropDownButtonSizeY;
                end;
                v45.BlockButton = v42:createBlockButton(l_playerRelationship_0);
                v47 = (v47 + v43.DropDownButtonPadding) + v43.DropDownButtonSizeY;
                v45.ReportButton = v42:createReportButton();
                v47 = (v47 + v43.DropDownButtonPadding) + v43.DropDownButtonSizeY;
            end;
            if v42.props.inspectMenuEnabled then
                v45.InspectButton = v42:createInspectButton();
                v47 = (v47 + v43.DropDownButtonPadding) + v43.DropDownButtonSizeY;
            end;
            return v4.createElement("ImageButton", {
                LayoutOrder = v42.props.layoutOrder, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Selectable = false, 
                Modal = false, 
                Visible = v42.state.allVisible, 
                AutoButtonColor = false, 
                Active = v42.props.isVisible, 
                Image = "", 
                [v4.Event.Activated] = v42.props.closeDropDown, 
                [v4.Ref] = v42.imageButtonRef
            }, {
                Container = v4.createElement("Frame", {
                    LayoutOrder = v42.props.layoutOrder, 
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, -v46 / 2), 
                    Size = UDim2.new(0, v43.PlayerDropDownSizeXMobile, 0, v47 - v43.DropDownButtonPadding), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true
                }, v45)
            });
        else
            return nil;
        end;
    end);
end;
v25.getScale = function(v49)
    if not v49.props.isVisible or not v49.props.contentsVisible then
        return 1.25;
    else
        return 1;
    end;
end;
v25.getTransparency = function(v50)
    if not v50.props.isVisible or not v50.props.contentsVisible then
        return 1;
    else
        return 0;
    end;
end;
v25.getButtonTransparency = function(v51)
    if not v51.props.isVisible or not v51.props.contentsVisible then
        return 1;
    else
        return v51.props.preferredTransparency * 0.3;
    end;
end;
v25.didUpdate = function(v52, _, _)
    v52.containerScaleMotor:setGoal(v7.spring(v52:getScale(), v26));
    v52.transparencyMotor:setGoal(v7.spring(v52:getTransparency(), v26));
    v52.buttonTransparencyMotor:setGoal(v7.spring(v52:getButtonTransparency(), v26));
end;
v25.didMount = function(_)
end;
v25.willUnmount = function(v56)
    v56.transparencyMotor:destroy();
    v56.containerScaleMotor:destroy();
    v56.buttonTransparencyMotor:destroy();
    v56.transparencyMotor = nil;
    v56.containerScaleMotor = nil;
    v56.buttonTransparencyMotor = nil;
end;
return v5.connect(function(v57)
    local l_selectedPlayer_4 = v57.playerDropDown.selectedPlayer;
    return {
        selectedPlayer = l_selectedPlayer_4, 
        isVisible = v57.playerDropDown.isVisible, 
        playerRelationship = l_selectedPlayer_4 and v57.playerRelationship[l_selectedPlayer_4.UserId], 
        inspectMenuEnabled = v57.displayOptions.inspectMenuEnabled, 
        isTenFootInterface = v57.displayOptions.isTenFootInterface, 
        subjectToChinaPolicies = v57.displayOptions.subjectToChinaPolicies, 
        preferredTransparency = v57.settings.preferredTransparency
    };
end, function(v59)
    return {
        closeDropDown = function()
            return v59(v20());
        end, 
        setPlayerListVisibility = function(v60)
            return v59(v21(v60));
        end, 
        blockPlayer = function(v61)
            return v59(v22(v61));
        end, 
        unblockPlayer = function(v62)
            return v59(v23(v62));
        end, 
        requestFriendship = function(v63, _)
            return v59(v24(v63));
        end
    };
end)(v25);
