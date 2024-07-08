local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_CorePackages_0.Cryo);
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Connection.LayoutValues).WithLayoutValues;
local v10 = require(script.Parent.EntryFrame);
local v11 = require(l_Parent_0.PresentationCommon.PlayerIcon);
local v12 = require(script.Parent.PlayerNameTag);
local v13 = require(script.Parent.StatEntry);
local v14 = require(script.Parent.CellExtender);
local l_Parent_1 = l_Parent_0.Parent;
local v16 = require(l_Parent_1.Actions.ClosePlayerDropDown);
local v17 = require(l_Parent_1.Actions.OpenPlayerDropDown);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v19 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local v20 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v22 = v4.PureComponent:extend("PlayerEntry");
v22.validateProps = v6.strictInterface(l_validatePropsWithForwardRef_0({
    player = v19, 
    titlePlayerEntry = v6.boolean, 
    hasDivider = v6.boolean, 
    entrySize = v6.integer, 
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
    [v4.Ref] = v6.optional(v6.table), 
    selectedPlayer = v6.optional(v6.instanceIsA("Player")), 
    dropDownOpen = v6.boolean, 
    isSmallTouchDevice = v6.boolean, 
    closeDropDown = v6.callback, 
    openDropDown = v6.callback
}));
v22.init = function(v23)
    v23.state = {
        isHovered = false, 
        isPressed = false
    };
    v23.onActivated = function()
        if not (v23.props.selectedPlayer == v23.props.player) or not v23.props.dropDownOpen then
            v23.props.openDropDown(v23.props.player);
            return ;
        else
            v23.props.closeDropDown();
            return ;
        end;
    end;
    v23.onSelectionGained = function()
        v23:setState({
            isHovered = true
        });
    end;
    v23.onSelectionLost = function()
        v23:setState({
            isHovered = false
        });
    end;
    v23.onMouseEnter = function()
        v23:setState({
            isHovered = true
        });
    end;
    v23.onMouseLeave = function()
        v23:setState({
            isHovered = false, 
            isPressed = false
        });
    end;
    v23.onMouseDown = function()
        v23:setState({
            isPressed = true
        });
    end;
    v23.onInputEnded = function()
        v23:setState({
            isPressed = false
        });
    end;
end;
v22.getBackgroundStyle = function(v24, v25, v26)
    local v27 = if not v20() then v26.Theme.BackgroundContrast.Color else v26.Theme.BackgroundUIContrast.Color;
    if v25.IsTenFoot then
        local v28 = v24.props.dropDownOpen and v24.props.selectedPlayer == v24.props.player;
        local l_isHovered_0 = v24.state.isHovered;
        if v24.props.titlePlayerEntry then
            if not l_isHovered_0 or not v25.BackgroundStyle.HoveredTitle then
                if v25.BackgroundStyle.Title then
                    return v25.BackgroundStyle.Title;
                end;
            else
                return v25.BackgroundStyle.HoveredTitle;
            end;
        end;
        if not v28 or not v25.BackgroundStyle.Selected then
            if not l_isHovered_0 or not v25.BackgroundStyle.Hovered then
                return v25.BackgroundStyle.Default;
            else
                return v25.BackgroundStyle.Hovered;
            end;
        else
            return v25.BackgroundStyle.Selected;
        end;
    else
        return {
            Color = v27, 
            Transparency = 1
        };
    end;
end;
v22.getOverlayStyle = function(v30, v31, v32)
    if not v31.IsTenFoot then
        local v33 = v30.props.dropDownOpen and v30.props.selectedPlayer == v30.props.player;
        if not v30.state.isPressed then
            if not v33 then
                if v30.state.isHovered then
                    return v32.Theme.BackgroundOnHover;
                end;
            else
                return v32.Theme.BackgroundOnPress;
            end;
        else
            return v32.Theme.BackgroundOnPress;
        end;
    end;
    return {
        Transparency = 1, 
        Color = Color3.new(1, 1, 1)
    };
end;
v22.getTextStyle = function(v34, v35, v36)
    if not v35.IsTenFoot then
        if not (v34.props.player == l_Players_0.LocalPlayer) then
            return v36.Theme.TextMuted;
        else
            return v36.Theme.TextEmphasis;
        end;
    elseif not v34.state.isHovered then
        return v35.DefaultTextStyle, v35.PlayerNameTextSize;
    else
        return v35.HoveredTextStyle, v35.PlayerNameTextSize;
    end;
end;
v22.getPlayerNameFont = function(v37, v38, v39)
    if not v38.IsTenFoot then
        if not (v37.props.player == l_Players_0.LocalPlayer) then
            return {
                Font = v39.Font.CaptionBody.Font, 
                Size = v39.Font.CaptionBody.RelativeSize * v39.Font.BaseSize, 
                MinSize = v39.Font.Footer.RelativeMinSize * v39.Font.BaseSize
            };
        else
            return {
                Font = v39.Font.CaptionHeader.Font, 
                Size = v39.Font.CaptionHeader.RelativeSize * v39.Font.BaseSize, 
                MinSize = v39.Font.Footer.RelativeMinSize * v39.Font.BaseSize
            };
        end;
    elseif not v37.props.titlePlayerEntry then
        return {
            Font = v38.PlayerEntryFont, 
            Size = v38.PlayerNameTextSize, 
            MinSize = v38.PlayerNameTextSize
        };
    else
        return {
            Font = v38.TitlePlayerEntryFont, 
            Size = v38.PlayerNameTextSize, 
            MinSize = v38.PlayerNameTextSize
        };
    end;
end;
v22.render = function(v40)
    return l_WithLayoutValues_0(function(v41)
        return l_withStyle_0(function(v42)
            local v43 = v40:getBackgroundStyle(v41, v42);
            local v44 = v40:getTextStyle(v41, v42);
            local v45 = v40:getPlayerNameFont(v41, v42);
            local v46 = v40:getOverlayStyle(v41, v42);
            local l_entrySize_0 = v40.props.entrySize;
            local v48 = {};
            local v49 = nil;
            if v41.IsTenFoot then
                v49 = UDim.new(0, v41.PlayerEntryPadding);
            end;
            v48.Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = v49
            });
            local l_isPressed_0 = v40.state.isPressed;
            v48.NameFrame = v4.createElement("Frame", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_entrySize_0, 0, v41.PlayerEntrySizeY), 
                BackgroundTransparency = 1
            }, {
                Shadow = v4.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v41.ShadowImage, 
                    Position = UDim2.new(0, -v41.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v41.ShadowSize * 2, 1, v41.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v41.ShadowSliceRect, 
                    Visible = v41.IsTenFoot
                }), 
                BGFrame = v4.createElement(v10, {
                    sizeX = l_entrySize_0, 
                    sizeY = v41.PlayerEntrySizeY, 
                    isTeamFrame = false, 
                    backgroundStyle = v43, 
                    overlayStyle = v46, 
                    doubleOverlay = l_isPressed_0, 
                    onActivated = v40.onActivated, 
                    onSelectionGained = v40.onSelectionGained, 
                    onSelectionLost = v40.onSelectionLost, 
                    onMouseEnter = v40.onMouseEnter, 
                    onMouseLeave = v40.onMouseLeave, 
                    onMouseDown = v40.onMouseDown, 
                    onInputEnded = v40.onInputEnded, 
                    [v4.Ref] = v40.props.forwardRef
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v41.PlayerEntryNamePadding)
                    }), 
                    InitalPadding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v41.InitalPlayerEntryPadding)
                    }), 
                    PlayerIcon = v4.createElement(v11, {
                        player = v40.props.player, 
                        playerIconInfo = v40.props.playerIconInfo, 
                        playerRelationship = v40.props.playerRelationship, 
                        layoutOrder = 1
                    }), 
                    PlayerName = v4.createElement(v12, {
                        player = v40.props.player, 
                        isTitleEntry = v40.props.titlePlayerEntry, 
                        isHovered = v40.state.isHovered, 
                        layoutOrder = 3, 
                        textStyle = v44, 
                        textFont = v45
                    })
                })
            });
            local l_MaxLeaderstats_0 = v41.MaxLeaderstats;
            if v40.props.isSmallTouchDevice then
                l_MaxLeaderstats_0 = v41.MaxLeaderstatsSmallScreen;
            end;
            for v52, v53 in ipairs(v40.props.gameStats) do
                if l_MaxLeaderstats_0 >= v52 then
                    v48["GameStat_" .. v53.name] = v4.createElement(v13, {
                        statName = v53.name, 
                        statValue = v40.props.playerStats[v53.name], 
                        isTitleEntry = v40.props.titlePlayerEntry, 
                        isTeamEntry = false, 
                        layoutOrder = v52, 
                        backgroundStyle = v43, 
                        overlayStyle = v46, 
                        doubleOverlay = l_isPressed_0, 
                        textStyle = v44, 
                        onActivated = v40.onActivated, 
                        onSelectionGained = v40.onSelectionGained, 
                        onSelectionLost = v40.onSelectionLost, 
                        onMouseEnter = v40.onMouseEnter, 
                        onMouseLeave = v40.onMouseLeave, 
                        onMouseDown = v40.onMouseDown, 
                        onInputEnded = v40.onInputEnded
                    });
                else
                    break;
                end;
            end;
            if not v41.IsTenFoot then
                v48.BackgroundExtender = v4.createElement(v14, {
                    layoutOrder = 100, 
                    size = UDim2.new(0, v41.ExtraContainerPadding, 1, 0), 
                    backgroundStyle = v43, 
                    overlayStyle = v46, 
                    doubleOverlay = l_isPressed_0
                });
            end;
            return v4.createFragment({
                ChildrenFrame = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1
                }, v48), 
                Divider = (not v41.IsTenFoot and v40.props.hasDivider) and v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v42.Theme.Divider.Transparency, 
                    BackgroundColor3 = v42.Theme.Divider.Color, 
                    BorderSizePixel = 0
                })
            });
        end);
    end);
end;
v22 = v5.UNSTABLE_connect2(function(v54)
    return {
        selectedPlayer = v54.playerDropDown.selectedPlayer, 
        dropDownOpen = v54.playerDropDown.isVisible, 
        isSmallTouchDevice = v54.displayOptions.isSmallTouchDevice
    };
end, function(v55)
    return {
        closeDropDown = function()
            return v55(v16());
        end, 
        openDropDown = function(v56)
            return v55(v17(v56));
        end
    };
end)(v22);
return v4.forwardRef(function(v57, v58)
    return v4.createElement(v22, v3.Dictionary.join(v57, {
        forwardRef = v58
    }));
end);
