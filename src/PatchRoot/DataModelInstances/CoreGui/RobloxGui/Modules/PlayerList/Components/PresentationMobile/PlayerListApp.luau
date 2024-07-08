local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Otter);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_RobloxTranslator_0 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("RobloxTranslator"));
local v10 = require(l_Modules_0.TopBar.Constants);
local v11 = require(l_Modules_0.Chrome.Enabled)();
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v14 = require(l_Parent_1.Actions.SetPlayerListVisibility);
local v15 = require(l_Parent_0.PlayerDropDown);
local v16 = require(l_Parent_0.PlayerListSorter);
local v17 = require(l_Parent_0.Parent.PresentationCommon.VoiceChatShield);
local l_Connection_0 = l_Parent_1.Components.Connection;
local v19 = require(l_Connection_0.EventConnections);
local v20 = require(l_Connection_0.ContextActionsBinder);
local v21 = require(l_Connection_0.TopStatConnector);
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v23 = require(l_Parent_1.Flags.FFlagPlayerListFixMobileScrolling);
local v24 = require(l_Parent_1.Flags.FFlagPlayerListFixBackgroundFlicker);
local v25 = require(l_Parent_1.Flags.GetFFlagPlayerListChromePushdown);
local v26 = {
    dampingRatio = 1, 
    frequency = 4
};
local function _(v27, v28, v29, v30, v31)
    return ((v27 - v28) * (v31 - v30)) / (v29 - v28) + v30;
end;
local v33 = v2.PureComponent:extend("PlayerListApp");
local function v41(v34)
    local v35 = math.min(v34.x, v34.y);
    local v36 = math.max(v34.x, v34.y);
    local v37 = ((v35 - 320) * 60) / 55 + 270;
    local v38 = ((v36 - 480) * 46) / 190 + 434;
    v37 = math.clamp(v37, math.min(270, v35 - 24), 500);
    v38 = math.clamp(v38, math.min(434, v36 - 24), 600);
    local v39 = v34.y < v34.x and v38 or v37;
    local v40 = v34.x < v34.y and v38 or v37;
    if not (not v25() or not v11) and v34.y < v34.x then
        v40 = v40 - (v10.TopBarHeight - 24);
    end;
    return UDim2.fromOffset(v39, v40);
end;
local _ = function(v42)
    for _, v44 in ipairs(v42) do
        if v44.Team == nil then
            return true;
        end;
    end;
    return false;
end;
local function v55(v46, v47)
    local v48 = {};
    local v49 = 0;
    for _, v51 in pairs(v46) do
        if not v48[v51.TeamColor.Number] then
            v48[v51.TeamColor.Number] = true;
            v49 = v49 + 1;
        end;
    end;
    if v49 > 0 then
        local v52;
        for _, v54 in ipairs(v47) do
            if v54.Team == nil then
                v52 = true;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v52 = false;
        ::label0::;
        if v52 then
            v49 = v49 + 1;
        end;
    end;
    return v49;
end;
v33.init = function(v56)
    v56.state = {
        visible = false
    };
    local v57, v58 = v2.createBinding(0.5);
    v56.bodyTransparency = v57;
    v56.updateBodyTransparency = v58;
    v56.bodyTransparencyMotor = v4.createSingleMotor(not v24 and 0 or 1);
    v56.bodyTransparencyMotor:onStep(function(v59)
        v56.updateBodyTransparency(v59);
        if not (v59 < 0.5) or not v56.props.displayOptions.isVisible then
            if v56.state.visible then
                v56:setState({
                    visible = false
                });
            end;
        elseif not v56.state.visible then
            v56:setState({
                visible = true
            });
        end;
        local l_setLayerCollectorEnabled_0 = v56.props.setLayerCollectorEnabled;
        local v61 = true;
        if v59 >= 0.99 then
            v61 = v56.props.displayOptions.isVisible;
        end;
        l_setLayerCollectorEnabled_0(v61);
    end);
    v57, v58 = v2.createBinding(0);
    v56.bgTransparency = v57;
    v56.updateBgTransparency = v58;
    v56.bgTransparencyMotor = v4.createSingleMotor(not v24 and 0 or 1);
    v56.bgTransparencyMotor:onStep(v56.updateBgTransparency);
    v57, v58 = v2.createBinding(1);
    v56.frameScale = v57;
    v56.updateFrameScale = v58;
    v56.frameScaleMotor = v4.createSingleMotor(0);
    v56.frameScaleMotor:onStep(function(v62)
        v56.updateFrameScale(v62);
    end);
    v56.titleRef = v2.createRef();
    v56.closeRef = v2.createRef();
end;
v33.renderBodyChildren = function(v63, _, v65)
    local l_visible_0 = v63.state.visible;
    local l_isDropDownVisible_0 = v63.props.isDropDownVisible;
    return {
        UIScale = v2.createElement("UIScale", {
            Scale = v63.frameScale
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }), 
        TitleText = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 44), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            Font = l_AppFonts_0.default:getBold(), 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            TextSize = 22, 
            TextColor3 = Color3.fromRGB(240, 240, 240), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = l_RobloxTranslator_0:FormatByKey("InGame.PlayerList.Leaderboard"), 
            [v2.Ref] = v63.titleRef
        }), 
        CloseButton = v2.createElement("ImageButton", {
            Image = "rbxasset://textures/ui/InspectMenu/x.png", 
            ImageColor3 = Color3.fromRGB(255, 255, 255), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.fromOffset(22, 22), 
            Position = UDim2.fromOffset(11, 22), 
            BackgroundTransparency = 1, 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            ZIndex = 0, 
            [v2.Ref] = v63.closeRef, 
            [v2.Event.Activated] = function()
                v63.props.setPlayerListVisible(false);
            end
        }), 
        ContentFrame = v2.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(1, 0, 1, -44), 
            BackgroundTransparency = 1, 
            Visible = l_visible_0 and not l_isDropDownVisible_0, 
            AutoLocalize = false
        }, v65)
    };
end;
v33.render = function(v68)
    return l_WithLayoutValues_0(function(v69)
        local v70 = nil;
        if not v69.IsTenFoot then
            v70 = v69.EntryBaseSizeX + 4 * v69.EntrySizeIncreasePerStat;
            local v71 = v69.ContainerPadding * 2 + (v69.PlayerDropDownSizeXMobile + v69.PlayerDropDownOffset);
            if v68.props.screenSizeX - v71 < v70 then
                v70 = v68.props.screenSizeX - v71;
            end;
        else
            v70 = v69.EntrySizeX;
        end;
        local l_huge_0 = math.huge;
        local v73 = false;
        if l_Players_0.MaxPlayers >= 6 then
            v73 = l_Players_0.MaxPlayers <= 12;
        end;
        if v73 then
            l_huge_0 = l_Players_0.MaxPlayers * 26 + v55(v68.props.teams, v68.props.players) * 20;
        end;
        local v74 = {};
        if v68.state.visible then
            v74.PlayerScrollList = v2.createElement(v16, {
                screenSizeY = v68.props.screenSizeY, 
                entrySize = v70
            });
        end;
        v74.EventConnections = v2.createElement(v19);
        v74.ContextActionsBindings = v2.createElement(v20);
        v74.TopStatConnector = v2.createElement(v21);
        if not (game:GetEngineFeature("XboxRemoveVoiceChatButton") or not v68.props.displayOptions.hasPermissionToVoiceChat) then
            v74.VoiceChatShield = v2.createElement(v17);
        end;
        return v2.createElement("ImageButton", {
            Active = v68.props.displayOptions.isVisible, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = Color3.fromRGB(17, 18, 20), 
            BackgroundTransparency = v68.bgTransparency, 
            BorderColor3 = Color3.fromRGB(0, 0, 0), 
            BorderSizePixel = 0, 
            AutoLocalize = false, 
            AutoButtonColor = false, 
            Selectable = not v23, 
            Image = "", 
            [v2.Event.Activated] = function()
                v68.props.setPlayerListVisible(false);
            end
        }, {
            PlayerDropDown = v2.createElement(v15, {
                contentsVisible = true, 
                selectedPlayer = v68.props.dropDownPlayer
            }), 
            BodyPadding = if (not not v25() and v11) and v68.props.screenSizeY < v68.props.screenSizeX then v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v10.TopBarHeight)
            }) else nil, 
            BodyBackground = v2.createElement("Frame", {
                Size = v41(Vector2.new(v68.props.screenSizeX, v68.props.screenSizeY)), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                BackgroundColor3 = Color3.fromRGB(17, 18, 20), 
                BackgroundTransparency = v68.bodyTransparency, 
                BorderColor3 = Color3.fromRGB(0, 0, 0), 
                BorderSizePixel = 0
            }, v68:renderBodyChildren(l_huge_0, v74))
        });
    end);
end;
v33.didMount = function(v75)
    v75.props.setLayerCollectorEnabled(false);
    v75:setState({
        visible = v75.props.displayOptions.isVisible
    });
end;
v33.willUnmount = function(v76)
    v76.props.setLayerCollectorEnabled(true);
end;
v33.didUpdate = function(v77, v78, _)
    local l_isVisible_0 = v77.props.displayOptions.isVisible;
    local l_isDropDownVisible_1 = v77.props.isDropDownVisible;
    if not (not (l_isVisible_0 ~= v78.displayOptions.isVisible) or l_isVisible_0) then
        v77:setState({
            visible = l_isVisible_0
        });
    end;
    v77.bgTransparencyMotor:setGoal(v4.spring((l_isDropDownVisible_1 or l_isVisible_0) and 0.7 or 1, v26));
    local v82 = 1.25;
    if not l_isDropDownVisible_1 then
        if l_isVisible_0 then
            v82 = 1;
        end;
    else
        v82 = 0.95;
    end;
    v77.frameScaleMotor:setGoal(v4.spring(v82, v26));
    local v83 = 1;
    if not l_isDropDownVisible_1 then
        if l_isVisible_0 then
            v83 = 0.2 * v77.props.preferredTransparency;
        end;
    else
        v83 = 0.8 * v77.props.preferredTransparency;
    end;
    v77.bodyTransparencyMotor:setGoal(v4.spring(v83, v26));
end;
return v3.connect(function(v84)
    return {
        isDropDownVisible = v84.playerDropDown.isVisible, 
        screenSizeX = v84.screenSize.X, 
        screenSizeY = v84.screenSize.Y, 
        preferredTransparency = v84.settings.preferredTransparency, 
        displayOptions = v84.displayOptions, 
        players = v84.players, 
        playerStats = v84.playerStats, 
        playerIconInfo = v84.playerIconInfo, 
        playerRelationship = v84.playerRelationship, 
        gameStats = v84.gameStats, 
        teams = v84.teams
    };
end, function(v85)
    return {
        setPlayerListVisible = function(v86)
            return v85(v14(v86));
        end
    };
end)(v33);
