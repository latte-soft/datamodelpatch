local v0 = game:GetService("RunService"):IsStudio();
local v1 = false;
local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v3 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local v14 = false;
enableAvatarContextMenu = function(v15)
    v1 = not not v15;
    if not (not v1 or v14) then
        v14 = true;
        l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuEnabled", "placeId: " .. tostring(game.PlaceId));
    end;
end;
l_StarterGui_0:RegisterSetCore("SetAvatarContextMenuEnabled", enableAvatarContextMenu);
l_StarterGui_0:RegisterSetCore("AvatarContextMenuEnabled", enableAvatarContextMenu);
l_StarterGui_0:RegisterGetCore("AvatarContextMenuEnabled", function()
    return v1;
end);
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_AvatarContextMenu_0 = l_Modules_0:WaitForChild("AvatarContextMenu");
local l_ContextMenuGui_0 = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuGui"));
local l_ContextMenuItems_0 = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuItems"));
local l_ContextMenuUtil_0 = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuUtil"));
local l_SelectedCharacterIndicator_0 = require(l_AvatarContextMenu_0:WaitForChild("SelectedCharacterIndicator"));
local v22 = require(l_AvatarContextMenu_0.ThemeHandler);
local v23 = require(l_Modules_0.BackpackScript);
local v24 = require(l_Modules_0.EmotesMenu.EmotesMenuMaster);
local v25 = require(l_Modules_0.BlockingUtility);
local v26 = require(l_Modules_0.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
if not (l_LocalPlayer_0.UserId <= 0) or v0 then
    local v28 = nil;
    local v29 = nil;
    local v30 = false;
    local v31 = false;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    v29 = l_ContextMenuGui_0:CreateMenuFrame(v22:GetTheme());
    v28 = l_ContextMenuItems_0.new(v29.Content.ContextActionList);
    SetSelectedPlayer = function(v37, v38)
        if v32 == v37 then
            return ;
        else
            v32 = v37;
            l_SelectedCharacterIndicator_0:ChangeSelectedPlayer(v32, v22:GetTheme());
            if not v26 then
                v28:BuildContextMenuItems(v32);
            else
                local v39 = {};
                local l_status_0, l_result_0 = pcall(function()
                    return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
                end);
                v39.localPlayerChatEnabled = l_status_0 and (l_RunService_0:IsStudio() or l_result_0);
                v39.localPlayerCanChatWithSelectedPlayer = false;
                if v32 then
                    v39.localPlayerCanChatWithSelectedPlayer = l_ContextMenuUtil_0:GetCanChatWith(v32);
                end;
                v28:BuildContextMenuItems(v32, v39);
            end;
            l_ContextMenuGui_0:SwitchToPlayerEntry(v32, v38);
            return ;
        end;
    end;
    OpenMenu = function(v42)
        v30 = true;
        v29.Visible = true;
        v29.Content.ContextActionList.CanvasPosition = Vector2.new(0, 0);
        v29.Position = v42.OffScreenPosition;
        v36 = l_ContextMenuGui_0.SelectedPlayerChanged:connect(function()
            SetSelectedPlayer(l_ContextMenuGui_0:GetSelectedPlayer());
        end);
        v29.Position = v42.OffScreenPosition;
        local v43 = l_TweenService_0:Create(v29, v2, {
            Position = v42.OnScreenPosition
        });
        v43:Play();
        v43.Completed:wait();
        v30 = false;
    end;
    BindMenuActions = function()
        l_ContextActionService_0:BindCoreAction("EscapeAvatarContextMenu", function(_, v45, _)
            if v45 ~= Enum.UserInputState.Begin then
                return ;
            else
                CloseContextMenu();
                return ;
            end;
        end, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB);
        l_ContextActionService_0:BindCoreAction("SwitchPageAvatarContextMenu", function(_, v48, v49)
            if v48 == Enum.UserInputState.Begin then
                if v49.KeyCode == Enum.KeyCode.ButtonR1 then
                    l_ContextMenuGui_0:OffsetPlayerEntry(1);
                    return ;
                elseif v49.KeyCode == Enum.KeyCode.ButtonL1 then
                    l_ContextMenuGui_0:OffsetPlayerEntry(-1);
                end;
            end;
        end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
        local v50 = nil;
        v50 = l_GuiService_0.MenuOpened:connect(function()
            v50:disconnect();
            if Enum.UserInputState.Begin ~= Enum.UserInputState.Begin then
                return ;
            else
                CloseContextMenu();
                return ;
            end;
        end);
    end;
    BuildPlayerCarousel = function(_, v52)
        local v53 = {};
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        for v55 = 1, #l_l_Players_0_Players_0 do
            if not (l_l_Players_0_Players_0[v55].UserId <= 0 and not v0) and l_l_Players_0_Players_0[v55] ~= l_LocalPlayer_0 then
                local l_l_ContextMenuUtil_0_PlayerPosition_0 = l_ContextMenuUtil_0:GetPlayerPosition(l_l_Players_0_Players_0[v55]);
                if l_l_ContextMenuUtil_0_PlayerPosition_0 then
                    table.insert(v53, {
                        l_l_Players_0_Players_0[v55], 
                        (v52 - l_l_ContextMenuUtil_0_PlayerPosition_0).magnitude
                    });
                end;
            end;
        end;
        table.sort(v53, function(v57, v58)
            return v58[2] < v57[2];
        end);
        l_ContextMenuGui_0:BuildPlayerCarousel(v53, v22:GetTheme());
    end;
    l_Players_0.PlayerRemoving:connect(function(v59)
        if v31 and v59 ~= v32 then
            l_ContextMenuGui_0:RemovePlayerEntry(v59);
        end;
    end);
    local function _()
        if v24:isOpen() then
            v24:close();
        end;
        if v23.IsOpen then
            v23.OpenClose();
        end;
    end;
    OpenContextMenu = function(v61, v62)
        if not (v30 or v31) and v1 then
            v31 = true;
            if v24:isOpen() then
                v24:close();
            end;
            if v23.IsOpen then
                v23.OpenClose();
            end;
            BuildPlayerCarousel(v61, v62);
            l_ContextMenuUtil_0:DisablePlayerMovement();
            BindMenuActions();
            SetSelectedPlayer(v61, true);
            l_ContextMenuGui_0:UpdateGuiTheme(v22:GetTheme());
            OpenMenu(v22:GetTheme());
            return ;
        else
            return ;
        end;
    end;
    CloseContextMenu = function()
        l_GuiService_0.SelectedCoreObject = nil;
        l_ContextActionService_0:UnbindCoreAction("EscapeAvatarContextMenu");
        l_ContextActionService_0:UnbindCoreAction("SwitchPageAvatarContextMenu");
        l_ContextMenuUtil_0:EnablePlayerMovement();
        if v36 then
            v36:disconnect();
        end;
        local v63 = l_TweenService_0:Create(v29, v3, {
            Position = UDim2.new(0.5, 0, 1, v29.AbsoluteSize.Y)
        });
        v63:Play();
        v63.Completed:wait();
        v29.Visible = false;
        SetSelectedPlayer(nil);
        v31 = false;
    end;
    l_ContextMenuGui_0:SetCloseMenuFunc(CloseContextMenu);
    v28:SetCloseMenuFunc(CloseContextMenu);
    local function _(v64, v65, v66)
        local v67 = false;
        if v65.X <= v64.X then
            v67 = false;
            if v64.X <= v66.X then
                v67 = false;
                if v65.Y <= v64.Y then
                    v67 = v64.Y <= v66.Y;
                end;
            end;
        end;
        return v67;
    end;
    PointInSwipeArea = function(v69)
        local l_AbsolutePosition_0 = v29.AbsolutePosition;
        local l_NameTag_0 = v29.Content:FindFirstChild("NameTag");
        local v72 = Vector2.new(l_AbsolutePosition_0.x + v29.AbsoluteSize.x, l_NameTag_0.AbsolutePosition.y + l_NameTag_0.AbsoluteSize.y);
        local v73 = false;
        if l_AbsolutePosition_0.X <= v69.X then
            v73 = false;
            if v69.X <= v72.X then
                v73 = false;
                if l_AbsolutePosition_0.Y <= v69.Y then
                    v73 = v69.Y <= v72.Y;
                end;
            end;
        end;
        return v73;
    end;
    LocalPlayerHasToolEquipped = function()
        if l_LocalPlayer_0.Character then
            for _, v75 in ipairs(l_LocalPlayer_0.Character:GetChildren()) do
                if v75:IsA("BackpackItem") then
                    return true;
                end;
            end;
            return false;
        else
            return false;
        end;
    end;
    shouldIgnoreLocalCharacter = function()
        if l_LocalPlayer_0.Character then
            local l_Head_0 = l_LocalPlayer_0.Character:FindFirstChild("Head");
            if not (not l_Head_0 or not l_Head_0:IsA("BasePart")) then
                return l_Head_0.LocalTransparencyModifier >= 0.95;
            end;
        end;
    end;
    clickedOnPoint = function(v77)
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            if not LocalPlayerHasToolEquipped() then
                local v79 = l_CurrentCamera_0:ScreenPointToRay(v77.X, v77.Y);
                v79 = Ray.new(v79.Origin, v79.Direction * 100);
                local v80 = nil;
                local v81 = nil;
                if not shouldIgnoreLocalCharacter() then
                    local l_workspace_PartOnRay_0, v83 = workspace:FindPartOnRay(v79, nil, false, true);
                    v80 = l_workspace_PartOnRay_0;
                    v81 = v83;
                else
                    local l_workspace_PartOnRay_1, v85 = workspace:FindPartOnRay(v79, l_LocalPlayer_0.Character, false, true);
                    v80 = l_workspace_PartOnRay_1;
                    v81 = v85;
                end;
                local l_l_ContextMenuUtil_0_PlayerFromPart_0 = l_ContextMenuUtil_0:FindPlayerFromPart(v80);
                if l_l_ContextMenuUtil_0_PlayerFromPart_0 and (not (not v0 or l_l_ContextMenuUtil_0_PlayerFromPart_0 == l_LocalPlayer_0) or l_l_ContextMenuUtil_0_PlayerFromPart_0 ~= l_LocalPlayer_0 and l_l_ContextMenuUtil_0_PlayerFromPart_0.UserId > 0) then
                    if not v31 then
                        OpenContextMenu(l_l_ContextMenuUtil_0_PlayerFromPart_0, v81);
                        return ;
                    else
                        SetSelectedPlayer(l_l_ContextMenuUtil_0_PlayerFromPart_0);
                        return ;
                    end;
                else
                    if not (l_l_ContextMenuUtil_0_PlayerFromPart_0 or not v31) then
                        CloseContextMenu();
                    end;
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    OnUserInput = function(v87, v88)
        if v88.UserInputState == Enum.UserInputState.Begin and v33 == nil then
            v33 = v88;
            v34 = v87;
            return ;
        else
            if v33 == v88 and v88.UserInputState == Enum.UserInputState.Change then
                if (v87 - v34).magnitude > 5 then
                    v33 = nil;
                    v34 = nil;
                    return ;
                end;
            elseif v88.UserInputState == Enum.UserInputState.End and v33 == v88 then
                v33 = nil;
                v34 = nil;
                clickedOnPoint(v87);
            end;
            return ;
        end;
    end;
    OnMouseMoved = function(v89)
        if not (v31 or not v33) and (v89 - v34).magnitude > 20 then
            v33 = nil;
            v34 = nil;
        end;
    end;
    trackTouchSwipeInput = function(v90)
        if v90.UserInputType == Enum.UserInputType.Touch then
            if not v35 and v90.UserInputState == Enum.UserInputState.Begin then
                if PointInSwipeArea(v90.Position) then
                    v35 = v90;
                    return ;
                end;
            elseif v35 == v90 and v90.UserInputState == Enum.UserInputState.End then
                spawn(function()
                    v35 = nil;
                end);
            end;
        end;
    end;
    local function v93(v91, v92)
        trackTouchSwipeInput(v91);
        if not v92 then
            if not (v91.UserInputType ~= Enum.UserInputType.MouseButton1) or v91.UserInputType == Enum.UserInputType.Touch then
                OnUserInput(Vector2.new(v91.Position.X, v91.Position.Y), v91);
                return ;
            else
                if v91.UserInputType == Enum.UserInputType.MouseMovement then
                    OnMouseMoved(Vector2.new(v91.Position.X, v91.Position.Y));
                end;
                return ;
            end;
        else
            if v91 == v33 then
                v33 = nil;
            end;
            return ;
        end;
    end;
    l_UserInputService_0.InputBegan:Connect(v93);
    l_UserInputService_0.InputChanged:Connect(v93);
    l_UserInputService_0.InputEnded:Connect(v93);
    l_UserInputService_0.TouchSwipe:Connect(function(v94, _, v96)
        if v96 then
            if v31 then
                if v35 then
                    local v97 = 0;
                    if v94 == Enum.SwipeDirection.Left then
                        v97 = 1;
                    elseif v94 == Enum.SwipeDirection.Right then
                        v97 = -1;
                    end;
                    if v97 ~= 0 then
                        l_ContextMenuGui_0:OffsetPlayerEntry(v97);
                        SetSelectedPlayer(l_ContextMenuGui_0:GetSelectedPlayer());
                    end;
                    return ;
                else
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end);
    l_LocalPlayer_0.FriendStatusChanged:Connect(function(v98, v99)
        if v98 and v98 == v32 then
            v28:UpdateFriendButton(v99, (v25:IsPlayerBlockedByUserId(v98.UserId)));
        end;
    end);
    v23.StateChanged.Event:Connect(function(v100)
        if not (not v100 or not v31) then
            CloseContextMenu();
        end;
    end);
    v24.EmotesMenuToggled.Event:Connect(function(v101)
        if not (not v101 or not v31) then
            CloseContextMenu();
        end;
    end);
    GetWorldPoint = function(v102)
        if v102.Character then
            local l_HumanoidRootPart_0 = v102.Character:FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_0 then
                return l_HumanoidRootPart_0.Position;
            end;
        end;
        if v102 ~= l_LocalPlayer_0 then
            return GetWorldPoint(l_LocalPlayer_0);
        else
            return (Vector3.new(0, 0, 0));
        end;
    end;
    l_StarterGui_0:RegisterGetCore("AvatarContextMenuTarget", function()
        return v32;
    end);
    l_StarterGui_0:RegisterSetCore("AvatarContextMenuTarget", function(v104)
        local v105 = false;
        if typeof(v104) == "Instance" then
            v105 = v104:IsA("Player");
        end;
        if not v105 then
            if v104 == nil then
                CloseContextMenu();
                return ;
            else
                error("AvatarContextMenuTarget argument must be a Player or nil");
                return ;
            end;
        elseif v104.Parent ~= nil then
            if not v31 and not v30 then
                OpenContextMenu(v104, GetWorldPoint(v104));
                return ;
            else
                SetSelectedPlayer(v104, true);
                return ;
            end;
        else
            error("AvatarContextMenuTarget Player must be in the game");
            return ;
        end;
    end);
    local function v114()
        if l_LocalPlayer_0.Character then
            local l_HumanoidRootPart_1 = l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_1 then
                local l_Position_0 = l_HumanoidRootPart_1.Position;
                local v108 = nil;
                local l_huge_0 = math.huge;
                local v110 = nil;
                for _, v112 in ipairs((l_Players_0:GetPlayers())) do
                    if not (not (v112 ~= l_LocalPlayer_0) or not v112.Character) then
                        local l_HumanoidRootPart_2 = v112.Character:FindFirstChild("HumanoidRootPart");
                        if l_HumanoidRootPart_2 and (l_HumanoidRootPart_2.Position - l_Position_0).magnitude < l_huge_0 then
                            v108 = v112;
                            l_huge_0 = (l_HumanoidRootPart_2.Position - l_Position_0).magnitude;
                            v110 = l_HumanoidRootPart_2.Position;
                        end;
                    end;
                end;
                return v108, v110;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    l_ContextActionService_0:BindCoreAction("GamepadOpenAvatarContextMenu", function(_, v116, _)
        if v1 then
            if not l_GuiService_0.SelectedCoreObject and not l_GuiService_0.SelectedObject then
                if v116 ~= Enum.UserInputState.Begin then
                    return Enum.ContextActionResult.Sink;
                else
                    if not v31 then
                        local v118, v119 = v114();
                        if v118 then
                            OpenContextMenu(v118, v119);
                        end;
                    else
                        CloseContextMenu();
                    end;
                    return Enum.ContextActionResult.Sink;
                end;
            else
                return Enum.ContextActionResult.Pass;
            end;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, false, Enum.KeyCode.DPadUp);
    return ;
else
    return ;
end;
