local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_VRService_0 = game:GetService("VRService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.UIBlox);
local l_ContextualMenu_0 = v7.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v7.App.Menu.MenuDirection;
local l_Images_0 = v7.App.ImageSet.Images;
local l_withStyle_0 = v7.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v14 = require(l_Actions_0.SetKeepOutArea);
local v15 = require(l_Actions_0.RemoveKeepOutArea);
local v16 = require(l_Actions_0.SetMoreMenuOpen);
local v17 = require(l_Parent_0.Analytics);
local v18 = require(l_Parent_0.Flags.GetFFlagEnableTopBarAnalytics)();
local v19 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v20 = require(l_Parent_0.Constants);
local l_InputType_0 = v20.InputType;
local v22 = require(script.Parent.IconButton);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v24 = require(l_RobloxGui_0.Modules.TenFootInterface);
local v25 = require(l_RobloxGui_0.Modules.VR.VRHub);
local v26 = require(l_RobloxGui_0.Modules.EmotesMenu.EmotesMenuMaster);
local v27 = require(l_RobloxGui_0.Modules.BackpackScript);
local v28 = require(l_RobloxGui_0.Modules.ChatSelector);
local v29 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v30 = require(l_RobloxGui_0.Modules.EmotesMenu.Constants);
local v31 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v32 = require(l_RobloxGui_0.Modules.Flags.FFlagMobilePlayerList);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v34 = l_Images_0["icons/controls/emoteOn"];
local v35 = l_Images_0["icons/controls/emoteOff"];
local v36 = v4.PureComponent:extend("MoreMenu");
v36.validateProps = v6.strictInterface({
    layoutOrder = v6.integer, 
    moreMenuOpen = v6.boolean, 
    setMoreMenuOpen = v6.callback, 
    screenSize = v6.Vector2, 
    isSmallTouchDevice = v6.boolean, 
    topBarEnabled = v6.boolean, 
    leaderboardEnabled = v6.boolean, 
    emotesEnabled = v6.boolean, 
    backpackEnabled = v6.boolean, 
    leaderboardOpen = v6.boolean, 
    backpackOpen = v6.boolean, 
    emotesOpen = v6.boolean, 
    inputType = v6.string, 
    setKeepOutArea = v6.callback, 
    removeKeepOutArea = v6.callback
});
v36.init = function(v37)
    v37.rootRef = v4.createRef();
    if v18 then
        v37.analytics = v17.default;
    end;
    v37:setState({
        vrShowMenuIcon = false
    });
    v37.chatWasHidden = false;
    v37.boundAction = false;
    v37.moreButtonActivated = function()
        v37.props.setMoreMenuOpen(not v37.props.moreMenuOpen);
        if v37.analytics then
            v37.analytics:onMoreMenuActivated();
        end;
    end;
end;
v36.renderWithStyle = function(v38, v39)
    local v40 = {};
    local v41 = false;
    local v42 = v38.props.inputType == l_InputType_0.MouseAndKeyBoard;
    local v43 = v38.props.leaderboardEnabled and not v38.props.isSmallTouchDevice;
    if v32 then
        v43 = v38.props.leaderboardEnabled;
    end;
    if v43 then
        local v44 = "rbxasset://textures/ui/TopBar/leaderboardOn.png";
        if not v38.props.leaderboardOpen then
            v44 = "rbxasset://textures/ui/TopBar/leaderboardOff.png";
        end;
        table.insert(v40, {
            icon = v44, 
            text = v31:FormatByKey("CoreScripts.TopBar.Leaderboard"), 
            keyCodeLabel = not not v42 and Enum.KeyCode.Tab or nil, 
            onActivated = function()
                local l_leaderboardOpen_0 = v38.props.leaderboardOpen;
                if not l_VRService_0.VREnabled then
                    v29:SetVisibility(not v29:GetSetVisible());
                    v38.props.setMoreMenuOpen(false);
                else
                    require(l_RobloxGui_0.Modules.InGameMenu).openPlayersPage();
                end;
                if v38.analytics then
                    v38.analytics:onLeaderboardActivated(not l_leaderboardOpen_0);
                end;
            end
        });
        v41 = true;
    end;
    if v38.props.emotesEnabled then
        local l_v34_0 = v34;
        if not v38.props.emotesOpen then
            l_v34_0 = v35;
        end;
        table.insert(v40, {
            icon = l_v34_0, 
            text = v31:FormatByKey("CoreScripts.TopBar.Emotes"), 
            keyCodeLabel = not not v42 and v30.EmoteMenuOpenKey or nil, 
            onActivated = function()
                if not v26:isOpen() then
                    if v38.chatWasHidden then
                        v28:SetVisible(true);
                        v38.chatWasHidden = false;
                    end;
                    v26:open();
                else
                    v26:close();
                end;
                v38.props.setMoreMenuOpen(false);
                if v38.analytics then
                    v38.analytics:onEmotesActivated(v26:isOpen());
                end;
            end
        });
        v41 = true;
    end;
    if v38.props.backpackEnabled then
        local v47 = "rbxasset://textures/ui/TopBar/inventoryOn.png";
        if not v38.props.backpackOpen then
            v47 = "rbxasset://textures/ui/TopBar/inventoryOff.png";
        end;
        table.insert(v40, {
            icon = v47, 
            text = v31:FormatByKey("CoreScripts.TopBar.Inventory"), 
            keyCodeLabel = not not v42 and Enum.KeyCode.Backquote or nil, 
            onActivated = function()
                v27:OpenClose();
                v38.props.setMoreMenuOpen(false);
                if v38.analytics then
                    v38.analytics:onInventoryActivated(v27.IsOpen);
                end;
            end
        });
        v41 = true;
    end;
    local v48 = UDim2.new(0, 324, 0, v38.props.screenSize.Y);
    if v38.props.screenSize.X < 450 then
        v48 = UDim2.new(0, v38.props.screenSize.X - 24, 0, v38.props.screenSize.Y);
    end;
    local v49 = "rbxasset://textures/ui/TopBar/moreOn.png";
    if not v38.props.moreMenuOpen then
        v49 = "rbxasset://textures/ui/TopBar/moreOff.png";
    end;
    local v50 = ((not v24:IsEnabled() and v38.props.topBarEnabled) and v41) and not l_VRService_0.VREnabled;
    local function v52(v51)
        if not v50 or not v51 then
            v38.props.removeKeepOutArea(v20.MoreMenuKeepOutAreaId);
            return ;
        else
            v38.props.setKeepOutArea(v20.MoreMenuKeepOutAreaId, v51.AbsolutePosition, v51.AbsoluteSize);
            return ;
        end;
    end;
    if not (not v19 or not v38.rootRef.current) then
        local l_current_0 = v38.rootRef.current;
        if not v50 or not l_current_0 then
            v38.props.removeKeepOutArea(v20.MoreMenuKeepOutAreaId);
        else
            v38.props.setKeepOutArea(v20.MoreMenuKeepOutAreaId, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
        end;
    end;
    return v4.createElement("Frame", {
        Visible = v50, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 32, 1, 0), 
        LayoutOrder = v38.props.layoutOrder, 
        [v4.Change.AbsoluteSize] = if not v19 then nil else v52, 
        [v4.Change.AbsolutePosition] = if not v19 then nil else v52, 
        [v4.Ref] = v38.rootRef
    }, {
        OpenButton = v4.createElement(v22, {
            icon = v49, 
            iconSize = 24, 
            onActivated = v38.moreButtonActivated
        }), 
        MoreMenuContainer = v4.createElement("Frame", {
            ZIndex = 3, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(1, 12, 0, 0), 
            Size = v48, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            ContextualMenu = v4.createElement(l_ContextualMenu_0, {
                buttonProps = v40, 
                open = v38.props.moreMenuOpen, 
                menuDirection = l_MenuDirection_0.Down, 
                openPositionY = UDim.new(0, v20.TopBarHeight + 12), 
                background = v39.Theme.BackgroundUIContrast, 
                closeBackgroundVisible = false, 
                screenSize = v38.props.screenSize, 
                onDismiss = function()
                    v38.props.setMoreMenuOpen(false);
                    v29:SetMinimized(false);
                end
            })
        }), 
        ShowTopBarListener = v4.createElement(l_ExternalEventConnection_0, {
            event = v25.ShowTopBarChanged.Event, 
            callback = function()
                v38:setState({
                    vrShowMenuIcon = (l_VRService_0.VREnabled and v25.ShowTopBar) and v41
                });
            end
        })
    });
end;
v36.render = function(v54)
    return l_withStyle_0(function(v55)
        return v54:renderWithStyle(v55);
    end);
end;
v36.updateActionBound = function(v56)
    if not v56.props.moreMenuOpen then
        if v56.boundAction then
            l_ContextActionService_0:UnbindCoreAction("CloseMoreMenuAction");
            v56.boundAction = false;
        end;
        return ;
    else
        l_ContextActionService_0:BindCoreAction("CloseMoreMenuAction", function(_, v58, _)
            if v58 == Enum.UserInputState.Begin then
                v56.props.setMoreMenuOpen(false);
                return Enum.ContextActionResult.Sink;
            else
                return Enum.ContextActionResult.Pass;
            end;
        end, false, Enum.KeyCode.Escape);
        v56.boundAction = true;
        return ;
    end;
end;
v36.didUpdate = function(v60, v61, _)
    if v60.props.moreMenuOpen ~= v61.moreMenuOpen then
        v29:SetMinimized(v60.props.moreMenuOpen);
        v60:updateActionBound();
        if v60.props.screenSize.X < 600 then
            if not v60.props.moreMenuOpen or not v28:GetVisibility() then
                if not (v60.props.moreMenuOpen or not v60.chatWasHidden) then
                    v28:SetVisible(true);
                    v60.chatWasHidden = false;
                end;
            else
                v60.chatWasHidden = true;
                v28:SetVisible(false);
                return ;
            end;
        end;
    end;
end;
return v5.UNSTABLE_connect2(function(v63)
    return {
        screenSize = v63.displayOptions.screenSize, 
        moreMenuOpen = v63.moreMenu.open, 
        isSmallTouchDevice = v63.displayOptions.isSmallTouchDevice, 
        topBarEnabled = v63.displayOptions.topbarEnabled, 
        leaderboardEnabled = v63.coreGuiEnabled[Enum.CoreGuiType.PlayerList], 
        emotesEnabled = v63.moreMenu.emotesEnabled and v63.coreGuiEnabled[Enum.CoreGuiType.EmotesMenu], 
        backpackEnabled = v63.coreGuiEnabled[Enum.CoreGuiType.Backpack], 
        leaderboardOpen = v63.moreMenu.leaderboardOpen, 
        backpackOpen = v63.moreMenu.backpackOpen, 
        emotesOpen = v63.moreMenu.emotesOpen, 
        inputType = v63.displayOptions.inputType
    };
end, function(v64)
    return {
        setMoreMenuOpen = function(v65)
            return v64(v16(v65));
        end, 
        setKeepOutArea = function(v66, v67, v68)
            return v64(v14(v66, v67, v68));
        end, 
        removeKeepOutArea = function(v69)
            return v64(v15(v69));
        end
    };
end)(v36);
