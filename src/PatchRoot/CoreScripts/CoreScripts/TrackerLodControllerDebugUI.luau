local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_game_Service_0 = game:FindService("FaceAnimatorService");
local v4 = Color3.fromRGB(0, 196, 221);
local v5 = Color3.fromRGB(18, 217, 40);
local v6 = Color3.fromRGB(150, 150, 150);
local v7 = Color3.fromRGB(128, 196, 128);
local v8 = Color3.fromRGB(255, 196, 128);
if l_game_Service_0 then
    local l_l_game_Service_0_TrackerLodController_0 = l_game_Service_0:GetTrackerLodController();
    if l_l_game_Service_0_TrackerLodController_0 then
        local v10 = Instance.new("Frame", l_RobloxGui_0);
        v10.Name = "LodFrame";
        v10.Position = UDim2.new(1, -190, 0, 10);
        v10.Size = UDim2.fromOffset(180, 250);
        v10.BackgroundColor3 = Color3.fromRGB(0, 86, 158);
        v10.BorderColor3 = Color3.fromRGB(27, 42, 53);
        local v11 = Instance.new("Frame", v10);
        v11.Name = "ContentFrame";
        v11.Position = UDim2.fromOffset(10, 10);
        v11.Size = UDim2.fromOffset(160, 230);
        v11.BackgroundColor3 = v10.BackgroundColor3;
        v11.BorderColor3 = v10.BorderColor3;
        v11.BorderSizePixel = 0;
        local v12 = Instance.new("UIListLayout", v11);
        v12.Padding = UDim.new(0, 10);
        v12.SortOrder = Enum.SortOrder.LayoutOrder;
        local function v17(v13, v14, v15)
            local v16 = Instance.new("TextButton", v11);
            v16.Name = v14;
            v16.Font = Enum.Font.SourceSans;
            v16.Text = v15;
            v16.TextSize = 18;
            v16.Size = UDim2.fromOffset(160, 20);
            v16.BackgroundColor3 = v6;
            v16.BorderColor3 = Color3.fromRGB(27, 42, 53);
            v16.LayoutOrder = v13;
            return v16;
        end;
        local v18 = v17(1, "AutoButton", "Auto");
        local v19 = v17(2, "VideoAudioAccurateButton", "Video Audio Accurate");
        local v20 = v17(3, "VideoAudioFastButton", "Video Audio Fast");
        local v21 = v17(4, "VideoAccurateButton", "Video Accurate");
        local v22 = v17(5, "VideoFastButton", "Video Fast");
        local v23 = v17(6, "AudioButton", "Audio");
        local v24 = v17(7, "OffButton", "Off");
        local v25 = v17(8, "ExtrapolationButton", "Extrapolation");
        local v26 = {
            v22, 
            v21, 
            v20, 
            v19, 
            v23
        };
        l_l_game_Service_0_TrackerLodController_0.UpdateState:connect(function()
            if l_game_Service_0:IsStarted() then
                local v27 = l_l_game_Service_0_TrackerLodController_0.AudioMode == Enum.TrackerLodFlagMode.Auto;
                local v28 = l_l_game_Service_0_TrackerLodController_0.VideoMode == Enum.TrackerLodFlagMode.Auto;
                local v29 = l_l_game_Service_0_TrackerLodController_0.VideoLodMode == Enum.TrackerLodValueMode.Auto;
                local v30 = l_l_game_Service_0_TrackerLodController_0:getExtrapolation();
                local v31 = l_l_game_Service_0_TrackerLodController_0:isAudioEnabled();
                local v32 = l_l_game_Service_0_TrackerLodController_0:isVideoEnabled();
                local v33 = l_l_game_Service_0_TrackerLodController_0:getVideoLod();
                if v31 or v32 then
                    v24.BackgroundColor3 = v6;
                    if not (v27 or v28) and not v29 then
                        v18.BackgroundColor3 = v6;
                    else
                        v18.BackgroundColor3 = v5;
                    end;
                else
                    v24.BackgroundColor3 = v4;
                    v18.BackgroundColor3 = v6;
                end;
                if v30 == 1 then
                    v25.BackgroundColor3 = v7;
                elseif v30 == 2 then
                    v25.BackgroundColor3 = v8;
                else
                    v25.BackgroundColor3 = v6;
                end;
                local v34 = nil;
                if not v32 then
                    if v31 then
                        v34 = v26[5];
                    end;
                else
                    v34 = v26[(1 + ({
                        [true] = 1, 
                        [false] = 0
                    })[v31] * 2) + v33];
                end;
                for _, v36 in ipairs(v26) do
                    if v36 == v34 then
                        v36.BackgroundColor3 = v4;
                    else
                        v36.BackgroundColor3 = v6;
                    end;
                end;
                return ;
            else
                v24.BackgroundColor3 = v4;
                print("[FaceAnimatorUI] FaceAnimatorService not started or LodController not enabled. UI not active.");
                return ;
            end;
        end);
        local function v37()
            l_l_game_Service_0_TrackerLodController_0.VideoMode = Enum.TrackerLodFlagMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.AudioMode = Enum.TrackerLodFlagMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.VideoLodMode = Enum.TrackerLodValueMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.Auto;
        end;
        local function v38()
            l_l_game_Service_0_TrackerLodController_0.VideoMode = Enum.TrackerLodFlagMode.ForceFalse;
            l_l_game_Service_0_TrackerLodController_0.AudioMode = Enum.TrackerLodFlagMode.ForceFalse;
            l_l_game_Service_0_TrackerLodController_0.VideoLodMode = Enum.TrackerLodValueMode.Auto;
            l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.Auto;
        end;
        local function v44(v39, v40, v41)
            local v42 = {
                [true] = Enum.TrackerLodFlagMode.ForceTrue, 
                [false] = Enum.TrackerLodFlagMode.ForceFalse
            };
            local v43 = {
                [0] = Enum.TrackerLodValueMode.Force0, 
                [1] = Enum.TrackerLodValueMode.Force1
            };
            return function()
                l_l_game_Service_0_TrackerLodController_0.VideoMode = v42[v39];
                l_l_game_Service_0_TrackerLodController_0.AudioMode = v42[v40];
                l_l_game_Service_0_TrackerLodController_0.VideoLodMode = v43[v41];
            end;
        end;
        local function v46()
            local l_VideoExtrapolationMode_0 = l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode;
            if l_VideoExtrapolationMode_0 == Enum.TrackerExtrapolationFlagMode.ForceDisabled then
                l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose;
                return ;
            elseif l_VideoExtrapolationMode_0 == Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsAndPose then
                l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.ExtrapolateFacsOnly;
                return ;
            else
                l_l_game_Service_0_TrackerLodController_0.VideoExtrapolationMode = Enum.TrackerExtrapolationFlagMode.ForceDisabled;
                return ;
            end;
        end;
        v18.Activated:Connect(v37);
        v24.Activated:Connect(v38);
        v25.Activated:Connect(v46);
        v22.Activated:Connect((v44(true, false, 0)));
        v21.Activated:Connect((v44(true, false, 1)));
        v20.Activated:Connect((v44(true, true, 0)));
        v19.Activated:Connect((v44(true, true, 1)));
        v23.Activated:Connect((v44(false, true, 1)));
        return ;
    else
        print("[FaceAnimatorUI] TrackerLodController is nil. UI disabled.");
        return ;
    end;
else
    print("[FaceAnimatorUI] FaceAnimatorService is nil. UI disabled.");
    return ;
end;
