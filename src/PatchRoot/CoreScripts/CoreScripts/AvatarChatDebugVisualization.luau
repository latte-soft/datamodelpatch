local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarChatProtocolDebugV1");
local l_FacialAnimationStreamingServiceV2_0 = game:GetService("FacialAnimationStreamingServiceV2");
local v6 = require(l_RobloxGui_0.Modules.Logger):new(script.Name);
local v7 = true;
local v8 = true;
v6:trace("AvatarChatDebugVisualization 3_3_2023__2");
local v9 = 0;
local v10 = "";
local v11 = Color3.new(0.00491341, 1, 0.0105745);
local v12 = Color3.new(0.96199, 0.736614, 0.0616617);
local v13 = Color3.new(0.96199, 0.0360113, 0);
local v14 = false;
local v15 = nil;
local v16 = {};
local v17 = {};
local v18 = {
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving"
};
clearConnection = function(v19, v20)
    if not (not v17[v19.UserId] or not v17[v19.UserId][v20]) then
        v17[v19.UserId][v20]:Disconnect();
        v17[v19.UserId][v20] = nil;
    end;
end;
clearAllConnections = function(v21)
    for _, v23 in ipairs(v18) do
        clearConnection(v21, v23);
    end;
    v17[v21.UserId] = {};
end;
getFaceControls = function(v24)
    return v24:FindFirstChildWhichIsA("FaceControls", true);
end;
findObjectOfNameAndTypeName = function(v25, v26, v27)
    for _, v29 in (v27:GetDescendants()), nil, nil do
        if not (not (v29.Name == v25) or not v29:IsA(v26)) then
            return v29;
        end;
    end;
end;
getHumanoidRootPart = function(v30)
    if v30 then
        return (v30:WaitForChild("HumanoidRootPart", 2));
    else
        return nil;
    end;
end;
getHead = function(v31, v32)
    if v31 then
        local v33 = nil;
        if v32 then
            v33 = v31:WaitForChild("Head", 5);
        end;
        local v34 = getFaceControls(v31);
        if v34 ~= nil then
            v33 = v34.Parent;
        end;
        if not v33 then
            v33 = findObjectOfNameAndTypeName("Head", "MeshPart", v31) or v31:FindFirstChild("Head", true) and (v33:IsA("Pose") and nil);
        end;
        v6:trace("Self View: fn getHead(), head: " .. tostring(v33));
        return v33;
    else
        return nil;
    end;
end;
if l_game_Service_0 then
    local l_l_game_Service_0_TrackerLodController_0 = l_game_Service_0:GetTrackerLodController();
    if not l_l_game_Service_0_TrackerLodController_0 then
        v6:trace("[FaceAnimatorUI] TrackerLodController is nil. UI disabled.");
    end;
    local v36 = Instance.new("Frame", l_RobloxGui_0);
    v36.Name = "AvatarChatDebugVisualizationFrame";
    v36.Position = UDim2.new(0, 0, 0, 0);
    v36.Size = UDim2.new(1, 0, 1, 0);
    v36.BackgroundTransparency = 1;
    local function v45()
        if l_game_Service_0:IsStarted() and l_l_game_Service_0_TrackerLodController_0 then
            local v37 = l_l_game_Service_0_TrackerLodController_0:getExtrapolation();
            local v38 = l_l_game_Service_0_TrackerLodController_0:isAudioEnabled();
            local v39 = l_l_game_Service_0_TrackerLodController_0:isVideoEnabled();
            local v40 = l_l_game_Service_0_TrackerLodController_0:getVideoLod();
            if v15 then
                local l_ForceDisabled_0 = Enum.TrackerExtrapolationFlagMode.ForceDisabled;
                if v37 == 1 then
                    l_ForceDisabled_0 = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose;
                end;
                if v37 == 2 then
                    l_ForceDisabled_0 = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly;
                end;
                local v42 = 0;
                if v39 then
                    v42 = v42 + 1;
                end;
                if v38 then
                    v42 = v42 + 1;
                end;
                v10 = "Tracker: \nLoD: ";
                if (v39 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ForceDisabled) and v40 == 0 then
                    v42 = v42 + 2;
                end;
                if (v39 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly) and v40 == 0 then
                    v42 = v42 + 1;
                end;
                if (v39 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ForceDisabled) and v40 == 1 then
                    v42 = v42 + 3;
                end;
                if (v39 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly) and v40 == 1 then
                    v42 = v42 + 2;
                end;
                if (v39 and l_ForceDisabled_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose) and v40 == 1 then
                    v42 = v42 + 1;
                end;
                v10 = v10 .. tostring(v42);
                local _ = "" .. tostring(l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode);
                v6:trace("lodController.VideoExtrapolationMode:" .. tostring(l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode) .. ", extrapolation:" .. tostring(Enum.TrackerExtrapolationFlagMode:GetEnumItems()[v37 + 1]) .. ", (Enum::any).TrackerExtrapolationFlagMode.ForceDisabled: " .. tostring(Enum.TrackerExtrapolationFlagMode.ForceDisabled));
                local v44 = l_game_Service_0.IsStarted and l_game_Service_0.VideoAnimationEnabled;
                v10 = v10 .. "\ntracker mode:";
                if not (not v38 or not v39) then
                    v10 = v10 .. "av2c";
                end;
                if not (not v38 or v39) then
                    v10 = v10 .. "a2c";
                end;
                if not (v38 or not v39) then
                    v10 = v10 .. "v2c";
                end;
                if not (v38 or v39) then
                    v10 = v10 .. "off";
                end;
                v10 = v10 .. "\nvideoLoD: " .. tostring(v40) .. "\nUser camera: ";
                if not v44 then
                    v10 = v10 .. "off";
                else
                    v10 = v10 .. "on";
                end;
                v15.Text = v10;
            end;
            return ;
        else
            v6:trace("[FaceAnimatorUI] FaceAnimatorService not started or LodController not enabled. Tracker LoD UI not active.");
            return ;
        end;
    end;
    if l_l_game_Service_0_TrackerLodController_0 then
        l_l_game_Service_0_TrackerLodController_0.UpdateState:connect(v45);
        v14 = true;
    end;
    destroyDebugUIOfPlayer = function(v46)
        local v47 = 0;
        for _, v49 in pairs(v16) do
            v47 = v47 + 1;
            if v49.player == v46 then
                if v49.debugLabel then
                    v49.debugLabel:Destroy();
                end;
                if v49.billboardGUI then
                    v49.billboardGUI:Destroy();
                end;
                if v49.markerCircle then
                    v49.markerCircle:Destroy();
                end;
                table.remove(v16, v47);
                v49.player = nil;
                v49 = nil;
            end;
        end;
    end;
    getBillboardAdornee = function(v50)
        if v50 then
            local _ = nil;
            local v52 = v50.Character or v50.CharacterAdded:Wait();
            v6:trace("character:" .. tostring(v52));
            local v53 = getHumanoidRootPart(v52);
            local _ = v52:WaitForChild("UpperTorso", 2);
            if not v53 then
                return (getHead(v52, true));
            else
                return v53;
            end;
        else
            return nil;
        end;
    end;
    prepDeltaTimesList = function(v55)
        for _ = 1, 61 do
            table.insert(v55, 1);
        end;
    end;
    createDebugUIOfPlayer = function(v57)
        local v58 = {};
        local v59 = v57.UserId == l_Players_0.LocalPlayer.UserId;
        v6:trace("createDebugUIOfPlayer(), isLocalPlayer:" .. tostring(v59) .. ",player.UserId: " .. tostring(v57.UserId) .. ",Players.LocalPlayer.UserId:" .. tostring(l_Players_0.LocalPlayer.UserId));
        local v60 = Instance.new("BillboardGui", v36);
        local v61 = getBillboardAdornee(v57);
        v60.Adornee = v61;
        v60.StudsOffsetWorldSpace = Vector3.new(0, 6.5, 0);
        v60.Name = "AboveAvatarBillboardGui_" .. tostring(v57.UserId);
        v60.Size = UDim2.new(0, 200, 0, 150);
        local v62 = nil;
        if not v59 then
            v62 = Instance.new("CylinderHandleAdornment", workspace);
            v62.Name = "markerCircle_" .. tostring(v57.UserId);
            v62.Color3 = v13;
            v62.Transparency = 0.25;
            v62.Adornee = v61;
            v62.Angle = 360;
            v62.CFrame = CFrame.new(0, -3, 0) * CFrame.Angles(1.5707963267948966, 0, 0);
            v62.Height = 0.1;
            v62.InnerRadius = 2.9;
            v62.Radius = 3;
        end;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.BackgroundColor3 = Color3.new(0, 0, 0);
        l_TextLabel_0.BackgroundTransparency = 0.4;
        l_TextLabel_0.Text = "";
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.TextStrokeColor3 = Color3.new(0.35935, 0.35761, 0.361074);
        l_TextLabel_0.TextStrokeTransparency = 0.2;
        l_TextLabel_0.Font = Enum.Font.Code;
        l_TextLabel_0.TextSize = 14;
        l_TextLabel_0.Position = UDim2.new(0, 20, 0, 20);
        l_TextLabel_0.Size = UDim2.new(0, 120, 0, 80);
        if not v59 then
            l_TextLabel_0.Parent = v60;
        else
            l_TextLabel_0.Parent = v36;
        end;
        if v59 then
            v15 = l_TextLabel_0;
            if v14 then
                v45();
            end;
        end;
        v58.isLocalPlayer = v59;
        v58.player = v57;
        v58.debugLabel = l_TextLabel_0;
        v58.billboardGUI = v60;
        v58.markerCircle = v62;
        v58.previousFacsRecv = 0;
        v58.timeLastReceived = 0;
        v58.facsFPS = 0;
        v58.deltaTimesList = {};
        prepDeltaTimesList(v58.deltaTimesList);
        v58.lastFrameIndex = 0;
        table.insert(v16, v58);
    end;
    calculateAverageFPS = function(v64)
        local v65 = 0;
        for _, v67 in ipairs(v64.deltaTimesList) do
            v65 = v65 + v67;
        end;
        return #v64.deltaTimesList / v65;
    end;
    updateDebugUIsOfPlayers = function()
        for _, v69 in pairs(v16) do
            if v69 ~= nil then
                local l_player_0 = v69.player;
                if not v69.isLocalPlayer then
                    if l_game_EngineFeature_0 then
                        local l_WithPlayerId_0 = l_FacialAnimationStreamingServiceV2_0:GetStats():GetWithPlayerId("facs/lost", l_player_0.UserId);
                        local l_WithPlayerId_1 = l_FacialAnimationStreamingServiceV2_0:GetStats():GetWithPlayerId("facs/recv", l_player_0.UserId);
                        local v73 = "" .. "recv: " .. l_WithPlayerId_1 .. "\nlost: " .. l_WithPlayerId_0;
                        if l_WithPlayerId_0 > 0 then
                            v73 = v73 .. "\nloss: " .. tostring((math.floor(100 * (l_WithPlayerId_0 / l_WithPlayerId_1)))) .. "%";
                        end;
                        local v74 = v9 - v69.timeLastReceived;
                        local l_v73_0 = v73;
                        if l_WithPlayerId_1 ~= v69.previousFacsRecv then
                            local v76 = math.floor(1 / v74);
                            v69.deltaTimesList[v69.lastFrameIndex + 1] = v74;
                            v69.lastFrameIndex = (v69.lastFrameIndex + 2) % #v69.deltaTimesList;
                            v69.facsFPS = tostring(v76) .. "\naverage: " .. tostring((math.floor((calculateAverageFPS(v69)))));
                            if v74 < 0.1 then
                                v69.markerCircle.Color3 = v11;
                            else
                                v69.markerCircle.Color3 = v12;
                            end;
                            v69.timeLastReceived = v9;
                        end;
                        l_v73_0 = l_v73_0 .. "\nFACS FPS: " .. v69.facsFPS;
                        if (l_WithPlayerId_1 == v69.previousFacsRecv and v74 > 0.17) and v74 <= 5 then
                            v69.markerCircle.Color3 = v12;
                        end;
                        if l_WithPlayerId_1 == v69.previousFacsRecv and v74 > 5 then
                            v69.markerCircle.Color3 = v13;
                            v69.facsFPS = 0;
                        end;
                        v69.previousFacsRecv = l_WithPlayerId_1;
                        v69.debugLabel.Text = l_v73_0;
                        v69.debugLabel.Visible = v8;
                    end;
                else
                    v15.Text = v10;
                    if not v7 then
                        v15.Visible = false;
                    else
                        v15.Visible = true;
                    end;
                end;
            end;
        end;
    end;
    renderStepped = function()
        v9 = time();
        updateDebugUIsOfPlayers();
    end;
    local _ = function(v77, _)
        createDebugUIOfPlayer(v77);
    end;
    local _ = function(v80, _)
        v6:trace("onCharacterRemoving: player: " .. tostring(v80));
        destroyDebugUIOfPlayer(v80);
        clearAllConnections(v80);
    end;
    onPlayerAdded = function(v83)
        if v83.Character then
            local _ = v83.Character;
            createDebugUIOfPlayer(v83);
        end;
        v17[v83.UserId] = {};
        v17[v83.UserId][v18.CharacterAdded] = v83.CharacterAdded:Connect(function(_)
            createDebugUIOfPlayer(v83);
        end);
        v17[v83.UserId][v18.CharacterRemoving] = v83.CharacterRemoving:Connect(function(_)
            local l_v83_0 = v83;
            v6:trace("onCharacterRemoving: player: " .. tostring(l_v83_0));
            destroyDebugUIOfPlayer(l_v83_0);
            clearAllConnections(l_v83_0);
        end);
    end;
    onPlayerRemoved = function(v88)
        destroyDebugUIOfPlayer(v88);
        clearAllConnections(v88);
    end;
    for _, v90 in pairs(l_Players_0:GetPlayers()) do
        onPlayerAdded(v90);
    end;
    l_Players_0.PlayerAdded:Connect(onPlayerAdded);
    l_Players_0.PlayerRemoving:Connect(onPlayerRemoved);
    l_RunService_0.RenderStepped:Connect(renderStepped);
    if v14 then
        v45();
    end;
    game:GetService("UserInputService").InputBegan:Connect(function(v91, v92)
        if not v92 then
            if v91.KeyCode == Enum.KeyCode.T then
                v7 = not v7;
                print("T pressed, showInfoOfLocalPlayer: " .. tostring(v7));
            end;
            if v91.KeyCode == Enum.KeyCode.F then
                v8 = not v8;
                print("F pressed, showInfoOfRemotePlayers: " .. tostring(v8));
            end;
        end;
    end);
    return ;
else
    v6:trace("[FaceAnimatorUI] FaceAnimatorService is nil. UI disabled.");
    return ;
end;
