local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Otter);
local l_withStyle_0 = v6.Style.withStyle;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local v12 = v6.App.ImageSet.getIconSize(l_IconSize_0.Small);
local l_Images_0 = v6.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local l_WithLayoutValues_0 = require(l_Parent_0.Connection.LayoutValues).WithLayoutValues;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v17 = require(l_RobloxGui_0.Modules.Interfaces.playerInterface);
local v18 = require(l_RobloxGui_0.Modules.Chrome.Enabled);
local v19 = require(script.Parent.PlayerEntry);
local v20 = require(script.Parent.TeamEntry);
local v21 = require(script.Parent.PlayerDropDown);
local v22 = require(script.Parent.TitleBar);
local l_Parent_1 = l_Parent_0.Parent;
local v24 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v25 = require(l_Parent_1.GetFakeNeutralTeam);
local v26 = v18() and not game:DefineFastFlag("DisablePlayerListDisplayCloseBtn", false);
local v27 = {
    dampingRatio = 1, 
    frequency = 4
};
local v28 = v4.PureComponent:extend("PlayerListDisplay");
v28.validateProps = v7.strictInterface({
    isVisible = v7.boolean, 
    isMinimized = v7.boolean, 
    isTenFootInterface = v7.boolean, 
    isUsingGamepad = v7.boolean, 
    screenSizeY = v7.integer, 
    entrySize = v7.integer, 
    sortedPlayers = v7.array(v17), 
    sortedTeams = v7.optional(v7.array(v7.instanceIsA("Team"))), 
    teamColorToPlayerMap = v7.optional(v7.map(v7.integer, v7.array(v7.instanceIsA("Player")))), 
    teamScores = v7.optional(v7.map(v7.instanceIsA("Team"), v7.map(v7.string, v7.any))), 
    teamNames = v7.map(v7.instanceIsA("Team"), v7.string), 
    teamColors = v7.map(v7.instanceIsA("Team"), v7.BrickColor), 
    playerTeam = v7.map(v7.integer, v7.instanceIsA("Team")), 
    playerStats = v7.map(v7.integer, v7.map(v7.string, v7.any)), 
    gameStats = v7.array(v7.strictInterface({
        name = v7.string, 
        text = v7.string, 
        addId = v7.integer, 
        isPrimary = v7.boolean, 
        priority = v7.number
    })), 
    playerIconInfo = v7.map(v7.integer, v7.strictInterface({
        isPlaceOwner = v7.boolean, 
        avatarIcon = v7.optional(v7.table), 
        specialGroupIcon = v7.optional(v7.table)
    })), 
    playerRelationship = v7.map(v7.integer, v7.strictInterface({
        isBlocked = v7.boolean, 
        friendStatus = v7.enum(Enum.FriendStatus), 
        isFollowing = v7.boolean, 
        isFollower = v7.boolean
    })), 
    dropDownPlayer = v7.optional(v7.instanceIsA("Player")), 
    dropDownVisible = v7.boolean, 
    dismissPlayerList = v7.callback
});
v28.init = function(v29)
    v29.scrollingFrameRef = v4.createRef();
    v29.firstPlayerRef = v4.createRef();
    v29.state = {
        containerSizeY = 100, 
        scrollingFramePositionY = 0, 
        lastCanvasPosition = Vector2.new(0, 0), 
        contentsVisible = true
    };
    v29.absoluteSizeChanged = function(v30)
        v29:setState({
            containerSizeY = v30.AbsoluteSize.Y
        });
    end;
    v29.canvasPositionChanged = function(v31)
        v29:setState({
            lastCanvasPosition = v31.CanvasPosition
        });
    end;
    v29.absolutePositionChanged = function(v32)
        v29:setState({
            scrollingFramePositionY = v32.AbsolutePosition.Y
        });
    end;
    local v33, v34 = v4.createBinding(0);
    v29.minimizedBinding = v33;
    v29.updateMinimizedBinding = v34;
    v29.minimizedMotor = v8.createSingleMotor(0);
    v29.minimizedMotor:onStep(v29.updateMinimizedBinding);
    v29.minimizedMotor:onComplete(function(v35)
        if v35 == 0 then
            v29:setState({
                contentsVisible = true
            });
        end;
    end);
end;
v28.inVerticalScrollWindow = function(v36, v37, v38)
    if (v37 + v38) + v38 * 3 < v36.state.lastCanvasPosition.Y then
        return false;
    elseif v36.state.lastCanvasPosition.Y + v36.state.containerSizeY < v37 - v38 * 3 then
        return false;
    else
        return true;
    end;
end;
v28.calculateDropDownAbsPosition = function(v39, v40, v41)
    local l_current_0 = v39.scrollingFrameRef.current;
    if not l_current_0 then
        return v40, nil;
    else
        v40 = v40 - l_current_0.CanvasPosition.Y;
        if l_current_0.AbsoluteSize.Y <= v40 + v41 then
            local v43 = (v40 + v41) - l_current_0.AbsoluteSize.Y;
            return v40 - v43, Vector2.new(0, l_current_0.CanvasPosition.Y + v43);
        else
            return v40, nil;
        end;
    end;
end;
v28.render = function(v44)
    return l_WithLayoutValues_0(function(v45)
        return l_withStyle_0(function(v46)
            local l_EntryPadding_0 = v45.EntryPadding;
            local l_TeamEntrySizeY_0 = v45.TeamEntrySizeY;
            local l_PlayerEntrySizeY_0 = v45.PlayerEntrySizeY;
            local v50 = {};
            local v51 = 0;
            local v52 = 0;
            if not v44.props.sortedTeams then
                for v53, v54 in ipairs(v44.props.sortedPlayers) do
                    if not (v53 ~= 1 and not v44:inVerticalScrollWindow(v51, l_PlayerEntrySizeY_0)) then
                        local l_UserId_0 = v54.UserId;
                        v50["p_" .. tostring(l_UserId_0)] = v4.createElement("Frame", {
                            Position = UDim2.fromOffset(0, v51), 
                            Size = UDim2.new(1, v45.EntryXOffset, 0, v45.PlayerEntrySizeY), 
                            BackgroundTransparency = 1
                        }, {
                            v4.createElement(v19, {
                                player = v54, 
                                playerStats = v44.props.playerStats[l_UserId_0], 
                                playerIconInfo = v44.props.playerIconInfo[l_UserId_0], 
                                playerRelationship = v44.props.playerRelationship[l_UserId_0], 
                                titlePlayerEntry = false, 
                                gameStats = v44.props.gameStats, 
                                hasDivider = v53 ~= #v44.props.sortedPlayers, 
                                entrySize = v44.props.entrySize, 
                                [v4.Ref] = v53 == 1 and v44.firstPlayerRef or nil
                            })
                        });
                    end;
                    if v54 == v44.props.dropDownPlayer then
                        v52 = v51;
                    end;
                    v51 = (v51 + l_PlayerEntrySizeY_0) + l_EntryPadding_0;
                end;
            else
                local v56 = 0;
                local v57 = true;
                for v58, v59 in ipairs(v44.props.sortedTeams) do
                    if v44:inVerticalScrollWindow(v51, l_TeamEntrySizeY_0) then
                        v50["t_" .. tostring(v58)] = v4.createElement("Frame", {
                            Position = UDim2.fromOffset(0, v51), 
                            Size = UDim2.new(1, v45.EntryXOffset, 0, v45.TeamEntrySizeY), 
                            BackgroundTransparency = 1
                        }, {
                            v4.createElement(v20, {
                                teamName = v44.props.teamNames[v59.team], 
                                teamColor = v44.props.teamColors[v59.team], 
                                leaderstats = v44.props.teamScores[v59.team], 
                                gameStats = v44.props.gameStats, 
                                entrySize = v44.props.entrySize
                            })
                        });
                    end;
                    v56 = v56 + 1;
                    v51 = (v51 + l_TeamEntrySizeY_0) + l_EntryPadding_0;
                    local v60 = nil;
                    if v59.team == v25 then
                        v60 = {};
                        for _, v62 in ipairs(v44.props.sortedPlayers) do
                            if v44.props.playerTeam[v62.UserId] == nil then
                                table.insert(v60, v62);
                            end;
                        end;
                    else
                        v60 = v44.props.teamColorToPlayerMap[v59.team.TeamColor.Number] or {};
                    end;
                    for v63, v64 in ipairs(v60) do
                        if not (not v57 and not v44:inVerticalScrollWindow(v51, l_PlayerEntrySizeY_0)) then
                            local l_UserId_1 = v64.UserId;
                            v50["p_" .. tostring(l_UserId_1)] = v4.createElement("Frame", {
                                Position = UDim2.fromOffset(0, v51), 
                                Size = UDim2.new(1, v45.EntryXOffset, 0, v45.PlayerEntrySizeY), 
                                BackgroundTransparency = 1
                            }, {
                                v4.createElement(v19, {
                                    player = v64, 
                                    playerStats = v44.props.playerStats[l_UserId_1], 
                                    playerIconInfo = v44.props.playerIconInfo[l_UserId_1], 
                                    playerRelationship = v44.props.playerRelationship[l_UserId_1], 
                                    titlePlayerEntry = false, 
                                    gameStats = v44.props.gameStats, 
                                    hasDivider = not (v63 == #v60), 
                                    entrySize = v44.props.entrySize, 
                                    [v4.Ref] = not not v57 and v44.firstPlayerRef or nil
                                })
                            });
                        end;
                        v57 = false;
                        if v64 == v44.props.dropDownPlayer then
                            v52 = v51;
                        end;
                        v51 = (v51 + l_PlayerEntrySizeY_0) + l_EntryPadding_0;
                        v56 = v56 + 1;
                    end;
                end;
            end;
            local v66, v67 = v44:calculateDropDownAbsPosition(v52, l_PlayerEntrySizeY_0);
            if not v45.IsTenFoot then
                local v68 = v44.state.containerSizeY - 8;
                if #v44.props.gameStats > 0 then
                    v68 = v68 - v45.TitleBarSizeY;
                end;
                local v69 = if not v18() then v46.Theme.BackgroundContrast.Color else v46.Theme.BackgroundUIContrast.Color;
                local v72 = v44.minimizedBinding:map(function(v70)
                    local v71 = v45.OverrideBackgroundTransparency * v46.Settings.PreferredTransparency;
                    return v71 + (v45.FadedBackgroundTransparency - v71) * v70;
                end);
                local l_contentsVisible_0 = v44.state.contentsVisible;
                local l_createElement_0 = v4.createElement;
                local v75 = "Frame";
                local v76 = {
                    Position = v45.PlayerScrollListPosition, 
                    Size = v45.PlayerScrollListSize, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v44.absoluteSizeChanged
                };
                local v77 = {};
                local l_createElement_1 = v4.createElement;
                local v79 = "Frame";
                local v80 = {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v82 = {
                    UIScale = v4.createElement("UIScale", {
                        Scale = v44.minimizedBinding:map(function(v81)
                            return 1 - v45.FadedBackgroundScaleDelta * v81;
                        end)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    TopRoundedRect = if v26 then v4.createElement("Frame", {
                        LayoutOrder = 1, 
                        ClipsDescendants = true, 
                        Size = UDim2.new(1, 0, 0, v12 + 2), 
                        BackgroundTransparency = 1
                    }, {
                        v4.createElement("Frame", {
                            Size = UDim2.new(1, 0, 0, (v12 + 2) * 2), 
                            BackgroundColor3 = v69, 
                            BackgroundTransparency = v72
                        }, {
                            v4.createElement(l_IconButton_0, {
                                Name = "DismissButton", 
                                position = UDim2.new(0, 1, 0, 1), 
                                iconSize = l_IconSize_0.Small, 
                                icon = l_Images_0["icons/navigation/close"], 
                                onActivated = v44.props.dismissPlayerList
                            }), 
                            v4.createElement("UICorner", {
                                CornerRadius = UDim.new(0, 7)
                            })
                        })
                    }) else v4.createElement("ImageLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
                        ImageColor3 = v69, 
                        ImageTransparency = v72, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 24, 18), 
                        SliceScale = 0.5, 
                        Size = UDim2.new(1, 0, 0, 4)
                    })
                };
                local v83 = false;
                if #v44.props.gameStats > 0 then
                    v83 = v4.createElement(v22, {
                        LayoutOrder = 2, 
                        contentsVisible = v44.state.contentsVisible, 
                        backgroundTransparency = v72, 
                        gameStats = v44.props.gameStats, 
                        Size = UDim2.new(1, 0, 0, v45.TitleBarSizeY), 
                        entrySize = v44.props.entrySize
                    });
                end;
                v82.TitleBar = v83;
                v82.ScrollingFrameContainer = v4.createElement("Frame", {
                    LayoutOrder = 3, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 0, (math.min(v51, v68))), 
                    BackgroundColor3 = v69, 
                    BackgroundTransparency = v72, 
                    BorderSizePixel = 0, 
                    [v4.Change.AbsolutePosition] = v44.absolutePositionChanged
                }, {
                    PlayerDropDown = v4.createElement(v21, {
                        contentsVisible = l_contentsVisible_0, 
                        selectedPlayer = v44.props.dropDownPlayer, 
                        positionY = v66, 
                        minPositionBoundY = -v44.state.scrollingFramePositionY + v45.DropDownScreenSidePadding, 
                        maxPositionBoundY = (v44.props.screenSizeY - v44.state.scrollingFramePositionY) - v45.DropDownScreenSidePadding
                    }), 
                    ScrollingFrameClippingFrame = v4.createElement("Frame", {
                        Visible = v44.state.contentsVisible, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        ClipsDescendants = true
                    }, {
                        ScollingFrame = v4.createElement("ScrollingFrame", {
                            Size = UDim2.new(1, -v45.ScrollBarOffset, 1, 0), 
                            CanvasSize = UDim2.new(0, 0, 0, v51), 
                            BackgroundTransparency = 1, 
                            ScrollBarImageColor3 = v45.ScrollImageColor, 
                            ScrollBarImageTransparency = v45.ScrollImageTransparency, 
                            BorderSizePixel = 0, 
                            ScrollBarThickness = v45.ScrollBarSize, 
                            VerticalScrollBarInset = Enum.ScrollBarInset.Always, 
                            ClipsDescendants = false, 
                            ScrollingEnabled = not v44.props.dropDownVisible, 
                            Selectable = false, 
                            CanvasPosition = not not v44.props.dropDownVisible and v67 or v44.state.lastCanvasPosition, 
                            [v4.Change.CanvasPosition] = v44.canvasPositionChanged, 
                            [v4.Ref] = v44.scrollingFrameRef
                        }, {
                            OffsetUndoFrame = v4.createElement("Frame", {
                                Size = UDim2.new(1, v45.ScrollBarOffset + v45.ScrollBarSize, 0, v51), 
                                BackgroundTransparency = 1
                            }, v50)
                        })
                    })
                });
                v82.BottomRoundedRect = if v26 then v4.createElement("Frame", {
                    LayoutOrder = 4, 
                    ClipsDescendants = true, 
                    Size = UDim2.new(1, 0, 0, 7), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    v4.createElement("Frame", {
                        Position = UDim2.new(0, 0, 0, -8), 
                        Size = UDim2.new(1, 0, 0, 14), 
                        BackgroundColor3 = v69, 
                        BackgroundTransparency = v72, 
                        BorderSizePixel = 0
                    }, {
                        v4.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 7)
                        })
                    })
                }) else v4.createElement("ImageLabel", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                    ImageColor3 = v69, 
                    ImageTransparency = v72, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    Size = UDim2.new(1, 0, 0, 4)
                });
                v77.SizeOffsetFrame = l_createElement_1(v79, v80, v82);
                return l_createElement_0(v75, v76, v77);
            else
                return v4.createElement("Frame", {
                    Position = v45.PlayerScrollListPosition, 
                    Size = v45.PlayerScrollListSize, 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v44.absoluteSizeChanged
                }, {
                    ScollingFrame = v4.createElement("ScrollingFrame", {
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        CanvasSize = UDim2.new(0, 0, 0, v51), 
                        BackgroundTransparency = 1, 
                        ScrollBarImageColor3 = v45.ScrollImageColor, 
                        ScrollBarImageTransparency = v45.ScrollImageTransparency, 
                        BorderSizePixel = 0, 
                        ScrollBarThickness = 6, 
                        ScrollingEnabled = not v44.props.dropDownVisible, 
                        Selectable = false, 
                        CanvasPosition = not not v44.props.dropDownVisible and v67 or v44.state.lastCanvasPosition, 
                        [v4.Change.CanvasPosition] = v44.canvasPositionChanged, 
                        [v4.Ref] = v44.scrollingFrameRef
                    }, v50)
                });
            end;
        end);
    end);
end;
v28.didUpdate = function(v84, v85)
    if v84.props.isVisible ~= v85.isVisible then
        if not v84.props.isVisible then
            if not (not v84.props.isTenFootInterface or not v84.props.isUsingGamepad) then
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            end;
            if not (not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v84.scrollingFrameRef.current)) then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            l_GuiService_0:RemoveSelectionGroup("PlayerlistGuiSelection");
        else
            if not (not v84.props.isTenFootInterface or not v84.props.isUsingGamepad) then
                l_GuiService_0.SelectedCoreObject = v84.firstPlayerRef.current;
                l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
            end;
            l_GuiService_0:AddSelectionParent("PlayerlistGuiSelection", v84.scrollingFrameRef.current);
        end;
    end;
    if v84.props.isMinimized ~= v85.isMinimized then
        v84.minimizedMotor:setGoal(v8.spring(not v84.props.isMinimized and 0 or 1, v27));
        if v84.props.isMinimized then
            v84:setState({
                contentsVisible = false
            });
        end;
    end;
end;
return v5.UNSTABLE_connect2(function(v86)
    return {
        isVisible = v86.displayOptions.isVisible, 
        isMinimized = v86.displayOptions.isMinimized, 
        isTenFootInterface = v86.displayOptions.isTenFootInterface, 
        isUsingGamepad = v86.displayOptions.isUsingGamepad, 
        gameStats = v86.gameStats, 
        teamNames = v86.teamNames, 
        teamColors = v86.teamColors, 
        playerStats = v86.playerStats, 
        playerIconInfo = v86.playerIconInfo, 
        playerRelationship = v86.playerRelationship, 
        playerTeam = v86.playerTeam, 
        dropDownPlayer = v86.playerDropDown.selectedPlayer, 
        dropDownVisible = v86.playerDropDown.isVisible
    };
end, function(v87)
    return {
        dismissPlayerList = function()
            return v87(v24(false));
        end
    };
end)(v28);
