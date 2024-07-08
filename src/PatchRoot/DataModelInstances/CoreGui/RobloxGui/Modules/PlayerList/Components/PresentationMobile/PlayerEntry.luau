local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v6 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v8 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Interfaces.playerInterface);
local l_Parent_0 = script.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Connection.LayoutValues).WithLayoutValues;
local v11 = require(l_Parent_0.PresentationCommon.PlayerIcon);
local v12 = require(script.Parent.PlayerNameTag);
local v13 = require(script.Parent.StatEntry);
local l_Parent_1 = l_Parent_0.Parent;
local v15 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v16 = require(l_Parent_1.Actions.OpenPlayerDropDown);
local v17 = v3.PureComponent:extend("PlayerEntry");
v17.validateProps = v6.strictInterface({
    topDiv = v6.optional(v6.boolean), 
    bottomDiv = v6.optional(v6.boolean), 
    player = v8, 
    titlePlayerEntry = v6.boolean, 
    entrySize = v6.integer, 
    layoutOrder = v6.optional(v6.integer), 
    playerStats = v6.map(v6.string, v6.any), 
    playerIconInfo = v6.strictInterface({
        isPlaceOwner = v6.boolean, 
        avatarIcon = v6.optional(v6.table), 
        specialGroupIcon = v6.optional(v6.table)
    }), 
    playerRelationship = v6.strictInterface({
        isBlocked = v6.boolean, 
        friendStatus = v6.enum(Enum.FriendStatus), 
        isFollowing = v6.boolean, 
        isFollower = v6.boolean
    }), 
    gameStats = v6.array(v6.strictInterface({
        name = v6.string, 
        text = v6.string, 
        addId = v6.integer, 
        isPrimary = v6.boolean, 
        priority = v6.number
    })), 
    [v3.Ref] = v6.optional(v6.table), 
    selectedPlayer = v6.optional(v6.instanceIsA("Player")), 
    dropDownOpen = v6.boolean, 
    isSmallTouchDevice = v6.boolean, 
    closeDropDown = v6.callback, 
    openDropDown = v6.callback, 
    Position = v6.optional(v6.UDim2)
});
v17.init = function(v18)
    v18.state = {
        isHovered = false, 
        isPressed = false
    };
    v18.onActivated = function()
        if not v18.props.dropDownOpen then
            v18.props.openDropDown(v18.props.player);
            return ;
        else
            v18.props.closeDropDown();
            return ;
        end;
    end;
    v18.onSelectionGained = function()
        v18:setState({
            isHovered = true
        });
    end;
    v18.onSelectionLost = function()
        v18:setState({
            isHovered = false
        });
    end;
    v18.onMouseEnter = function()
        v18:setState({
            isHovered = true
        });
    end;
    v18.onMouseLeave = function()
        v18:setState({
            isHovered = false, 
            isPressed = false
        });
    end;
    v18.onMouseDown = function()
        v18:setState({
            isPressed = true
        });
    end;
    v18.onInputEnded = function()
        v18:setState({
            isPressed = false
        });
    end;
end;
v17.getBackgroundColor = function(v19, v20)
    return not not (v19.state.isHovered or v19.state.isPressed) and v20.RowHoverColor or v20.RowDefaultColor;
end;
v17.getTextStyle = function(v21, v22, v23)
    if not v22.IsTenFoot then
        if not (v21.props.player == l_LocalPlayer_0) then
            return v23.Theme.TextMuted;
        else
            return v23.Theme.TextEmphasis;
        end;
    elseif not v21.state.isHovered then
        return v22.DefaultTextStyle, v22.PlayerNameTextSizeMobile;
    else
        return v22.HoveredTextStyle, v22.PlayerNameTextSizeMobile;
    end;
end;
v17.getPlayerNameFont = function(v24, _, v26)
    if not (v24.props.player == l_LocalPlayer_0) then
        return {
            Font = l_AppFonts_0.default:getDefault(), 
            Size = v26.Font.CaptionBody.RelativeSize * v26.Font.BaseSize, 
            MinSize = v26.Font.Footer.RelativeMinSize * v26.Font.BaseSize
        };
    else
        return {
            Font = l_AppFonts_0.default:getMedium(), 
            Size = v26.Font.CaptionHeader.RelativeSize * v26.Font.BaseSize, 
            MinSize = v26.Font.Footer.RelativeMinSize * v26.Font.BaseSize
        };
    end;
end;
v17.render = function(v27)
    return l_WithLayoutValues_0(function(v28)
        return l_withStyle_0(function(v29)
            local v30 = v27:getTextStyle(v28, v29);
            local v31 = {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                NameFrame = v3.createElement("Frame", {
                    LayoutOrder = 0, 
                    Size = UDim2.new(0, v28.PlayerNameSizeXMobile, 0, v28.PlayerEntrySizeY), 
                    BackgroundTransparency = 1
                }, {
                    PlayerIcon = v3.createElement(v11, {
                        player = v27.props.player, 
                        playerIconInfo = v27.props.playerIconInfo, 
                        playerRelationship = v27.props.playerRelationship
                    }), 
                    PlayerName = v3.createElement(v12, {
                        player = v27.props.player, 
                        isTitleEntry = v27.props.titlePlayerEntry, 
                        isHovered = v27.state.isHovered, 
                        textStyle = v30, 
                        textFont = v27:getPlayerNameFont(v28, v29)
                    })
                })
            };
            for v32, v33 in ipairs(v27.props.gameStats) do
                if v28.MaxLeaderstats >= v32 then
                    v31["GameStat_" .. v33.name] = v3.createElement(v13, {
                        statValue = v27.props.playerStats[v33.name], 
                        isTitleEntry = v27.props.titlePlayerEntry, 
                        isTeamEntry = false, 
                        layoutOrder = v32, 
                        textStyle = v30
                    });
                else
                    break;
                end;
            end;
            return v3.createElement("ImageButton", {
                Position = v27.props.Position, 
                Size = UDim2.new(1, v28.EntryXOffset, 0, v28.PlayerEntrySizeY), 
                AutoButtonColor = false, 
                BackgroundColor3 = v27:getBackgroundColor(v28), 
                BackgroundTransparency = 0.8, 
                BorderSizePixel = 0, 
                Image = "", 
                LayoutOrder = v27.props.layoutOrder, 
                [v3.Event.Activated] = v27.onActivated, 
                [v3.Event.SelectionGained] = v27.onSelectionGained, 
                [v3.Event.SelectionLost] = v27.onSelectionLost, 
                [v3.Event.MouseButton1Down] = v27.onMouseDown, 
                [v3.Event.InputEnded] = v27.onInputEnded
            }, {
                ChildrenFrame = v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1
                }, v31), 
                TopDiv = not not (v27.props.topDiv or false) and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0, 0), 
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 0.8
                }) or nil, 
                BottomDiv = not not (v27.props.bottomDiv or false) and v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                    BackgroundTransparency = 0.8
                }) or nil
            });
        end);
    end);
end;
return v4.connect(function(v34)
    return {
        selectedPlayer = v34.playerDropDown.selectedPlayer, 
        dropDownOpen = v34.playerDropDown.isVisible, 
        isSmallTouchDevice = v34.displayOptions.isSmallTouchDevice
    };
end, function(v35)
    return {
        closeDropDown = function()
            return v35(v15());
        end, 
        openDropDown = function(v36)
            return v35(v16(v36));
        end
    };
end)(v17);
