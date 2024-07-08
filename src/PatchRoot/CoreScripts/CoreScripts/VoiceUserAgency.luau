local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Images_0 = require(l_CorePackages_0.InGameMenuDependencies).UIBlox.App.ImageSet.Images;
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui", math.huge).Modules;
local v10 = require(l_Modules_0.Common.Create);
local v11 = require(l_Modules_0.Common.IXPServiceWrapper);
local v12 = require(l_Modules_0.Logger):new(script.Name);
local v13 = require(l_Modules_0.RobloxTranslator);
local l_default_0 = require(l_Modules_0.VoiceChat.VoiceChatServiceManager).default;
local v15 = require(l_Modules_0.VoiceChat.Constants);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v17 = require(l_Modules_0.Flags.GetFFlagVoiceUserAgencyEnableIXP);
local v18 = require(l_Modules_0.Flags.GetFStringVoiceUserAgencyIXPLayerName);
local v19 = game:DefineFastInt("VoiceUserAgencyAlertInitTimeOffset", 5);
local v20 = game:DefineFastInt("VoiceUserAgencyAlertStartTimeOffset", 3);
local v21 = game:DefineFastInt("VoiceUserAgencyAlertTimerDuration", 7);
local v22 = require(l_Modules_0.Flags.FFlagMuteNonFriendsEvent);
local v23 = require(l_Modules_0.Settings.Flags.GetFFlagShowMuteToggles);
local v24 = game:DefineFastFlag("VoiceUserAgencyAddMuteDecisionAnalytics", false);
local v25 = game:DefineFastFlag("VoiceUserAgencyAdjustDescriptionText", false);
local v26 = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.Remember");
local v27 = tostring(game.PlaceId);
local l_UserId_0 = l_Players_0.LocalPlayer.UserId;
local function v33()
    local l_status_0, l_result_0 = pcall(function()
        return l_AppStorageService_0:GetItem("VoiceUserAgencyPlaceIds");
    end);
    if l_status_0 then
        local l_status_1, l_result_1 = pcall(function()
            return l_HttpService_0:JSONDecode(l_result_0);
        end);
        if l_status_1 then
            return l_result_1;
        end;
    end;
    return {};
end;
local v34 = false;
local _ = function()
    if not v34 then
        local l_status_2, l_result_2 = pcall(function()
            local v35 = v33();
            for v36, _ in v35, nil, nil do
                if v36 == v27 then
                    v35[v36] = nil;
                    l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v35));
                    l_AppStorageService_0:Flush();
                    v34 = true;
                    return ;
                end;
            end;
        end);
        if not l_status_2 then
            v12:trace(l_result_2);
        end;
        return ;
    else
        return ;
    end;
end;
local function v57()
    l_default_0.muteAllChanged.Event:Connect(function(_)
        if not v22 then
            if not v34 then
                local l_status_3, l_result_3 = pcall(function()
                    local v42 = v33();
                    for v43, _ in v42, nil, nil do
                        if v43 == v27 then
                            v42[v43] = nil;
                            l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v42));
                            l_AppStorageService_0:Flush();
                            v34 = true;
                            return ;
                        end;
                    end;
                end);
                if not l_status_3 then
                    v12:trace(l_result_3);
                end;
            else
                return ;
            end;
        elseif not v34 then
            local l_status_4, l_result_4 = pcall(function()
                local v47 = v33();
                for v48, _ in v47, nil, nil do
                    if v48 == v27 then
                        v47[v48] = nil;
                        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v47));
                        l_AppStorageService_0:Flush();
                        v34 = true;
                        return ;
                    end;
                end;
            end);
            if not l_status_4 then
                v12:trace(l_result_4);
                return ;
            end;
        else
            return ;
        end;
    end);
    if v22 then
        l_default_0.mutedNonFriends.Event:Connect(function()
            if not v34 then
                local l_status_5, l_result_5 = pcall(function()
                    local v52 = v33();
                    for v53, _ in v52, nil, nil do
                        if v53 == v27 then
                            v52[v53] = nil;
                            l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v52));
                            l_AppStorageService_0:Flush();
                            v34 = true;
                            return ;
                        end;
                    end;
                end);
                if not l_status_5 then
                    v12:trace(l_result_5);
                end;
                return ;
            else
                return ;
            end;
        end);
    end;
end;
local function v62(v58, v59, v60)
    v58:Destroy();
    if v59 then
        local v61 = v33();
        v61[v27] = v60;
        l_AppStorageService_0:SetItem("VoiceUserAgencyPlaceIds", l_HttpService_0:JSONEncode(v61));
        l_AppStorageService_0:Flush();
    end;
    if v24 then
        l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "SelectJoinWithVoice", {
            userId = l_UserId_0, 
            voiceSessionId = l_default_0:getService():GetSessionId(), 
            voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
            isMuteAll = v60, 
            isRememberSetting = v59
        });
    end;
    if v23() then
        l_default_0:FireUserAgencySelectedEvent(v60);
    end;
    v57();
end;
local function v80()
    local v63 = false;
    local v64 = false;
    if v17() then
        local l_status_6, l_result_6 = pcall(function()
            return v11:GetLayerData(v18());
        end);
        if l_status_6 then
            if l_result_6 then
                if not l_result_6.VoiceUserAgencyEnabled then
                    return ;
                end;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    local l_status_7, l_result_7 = pcall(function()
        for v67, v68 in pairs((v33())) do
            if v67 == v27 and v68 ~= nil then
                return v68;
            end;
        end;
    end);
    if l_status_7 then
        if l_result_7 ~= nil then
            l_default_0:MuteAll(l_result_7, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
            if v23() then
                l_default_0:FireUserAgencySelectedEvent(l_result_7);
            end;
            v57();
            l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "JoinWithVoice", {
                userId = l_UserId_0, 
                voiceSessionId = l_default_0:getService():GetSessionId(), 
                voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
                isMutedAll = l_result_7
            });
            return ;
        else
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "VoiceUserAgency";
            l_ScreenGui_0.ResetOnSpawn = false;
            l_ScreenGui_0.DisplayOrder = -1;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = l_CoreGui_0;
            local v72 = v10("TextButton")({
                Name = "MuteAllButton", 
                BorderSizePixel = 0, 
                Size = UDim2.new(0.5, -6, 0, 36), 
                Font = l_AppFonts_0.default:getDefault(), 
                Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinMuted"), 
                TextSize = 16, 
                BackgroundColor3 = Color3.fromRGB(57, 59, 61), 
                TextColor3 = Color3.fromRGB(178, 178, 178), 
                LayoutOrder = 1; 
                v10("UICorner")({
                    CornerRadius = UDim.new(0, 8)
                }), 
                v10("UIStroke")({
                    Thickness = 1, 
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                    Color = Color3.fromRGB(178, 178, 178)
                })
            });
            v72.Activated:Connect(function()
                v63 = true;
                l_default_0:MuteAll(v63, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
                v62(l_ScreenGui_0, v64, v63);
            end);
            local v73 = v10("TextButton")({
                Name = "UnmuteAllButton", 
                BorderSizePixel = 0, 
                Size = UDim2.new(0.5, -6, 0, 36), 
                Font = l_AppFonts_0.default:getDefault(), 
                Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted"), 
                TextSize = 16, 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                TextColor3 = Color3.fromRGB(57, 59, 61), 
                LayoutOrder = 2; 
                v10("UICorner")({
                    CornerRadius = UDim.new(0, 8)
                })
            });
            v73.Activated:Connect(function()
                v63 = false;
                l_default_0:MuteAll(v63, v15.VOICE_CONTEXT_TYPE.USER_AGENCY);
                v62(l_ScreenGui_0, v64, v63);
            end);
            local v74 = v10("Frame")({
                Name = "TimerBar", 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
                BackgroundTransparency = 0
            });
            local v75 = l_TweenService_0:Create(v74, TweenInfo.new(v21, Enum.EasingStyle.Sine), {
                Size = UDim2.fromScale(1, 1)
            });
            v75.Completed:Connect(function(v76)
                if v76 == Enum.PlaybackState.Completed then
                    v62(l_ScreenGui_0, v64, v63);
                end;
            end);
            local v77 = v10("ImageLabel")({
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/status/success_small"].Image, 
                ImageRectOffset = l_Images_0["icons/status/success_small"].ImageRectOffset, 
                ImageRectSize = l_Images_0["icons/status/success_small"].ImageRectSize
            });
            local v78 = v10("ImageButton")({
                Size = UDim2.new(0, 14, 0, 14), 
                BackgroundTransparency = 1, 
                Image = l_Images_0["squircles/hollow"].Image, 
                ImageRectOffset = l_Images_0["squircles/hollow"].ImageRectOffset, 
                ImageRectSize = l_Images_0["squircles/hollow"].ImageRectSize
            });
            v77.Visible = false;
            v77.Parent = v78;
            v78.Activated:Connect(function()
                v77.Visible = not v77.Visible;
                v64 = v77.Visible;
                v75:Pause();
                l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "RememberJoinWithVoice", {
                    userId = l_UserId_0, 
                    voiceSessionId = l_default_0:getService():GetSessionId(), 
                    voiceExperienceId = l_default_0:getService():GetVoiceExperienceId(), 
                    shouldRememberStatus = v64
                });
            end);
            local v79 = v10("TextLabel")({
                Name = "CheckboxTextLabel", 
                Font = l_AppFonts_0.default:getDefault(), 
                Text = v26, 
                TextColor3 = Color3.fromRGB(190, 190, 190), 
                TextSize = 16, 
                TextWrapped = true, 
                Size = UDim2.new(0, 350, 0, 24), 
                BackgroundTransparency = 1, 
                TextTransparency = 0, 
                LayoutOrder = 2
            });
            v79.Size = UDim2.new(0, l_TextService_0:GetTextSize(v26, 16, l_AppFonts_0.default:getDefault(), Vector2.new(350, 24)).X + 10, 0, 24);
            v10("Frame")({
                Name = "VoiceUserAgencyFrame", 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.new(0.9, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 4), 
                BackgroundColor3 = Color3.fromRGB(57, 59, 61), 
                BorderSizePixel = 0; 
                v10("UICorner")({
                    CornerRadius = UDim.new(0, 8)
                }), 
                v10("UISizeConstraint")({
                    MaxSize = Vector2.new(400, 216)
                }), 
                v10("UIPadding")({
                    PaddingTop = UDim.new(0, 24), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                v10("UIListLayout")({
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                v10("TextLabel")({
                    Name = "Title", 
                    Font = l_AppFonts_0.default:getBold(), 
                    Text = v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Title"), 
                    TextSize = 20, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 22), 
                    BackgroundTransparency = 1, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextTransparency = 0, 
                    LayoutOrder = 1
                }), 
                v10("TextLabel")({
                    Name = "Lower", 
                    Font = l_AppFonts_0.default:getDefault(), 
                    Text = not not v25 and v13:FormatByKey("Feature.SettingsHub.Prompt.VoiceUserAgency.JoinUnmuted.Description") or v13:FormatByKey("Feature.SettingsHub.VoiceUserAgency.JoinUnmuted.Description"), 
                    TextColor3 = Color3.fromRGB(190, 190, 190), 
                    TextSize = 16, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 60), 
                    BackgroundTransparency = 1, 
                    TextTransparency = 0, 
                    LayoutOrder = 2
                }), 
                v10("Frame")({
                    Name = "TimerFrame", 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                    Size = UDim2.new(1, 48, 0, 3), 
                    BackgroundTransparency = 0, 
                    LayoutOrder = 3; 
                    v74
                }), 
                v10("Frame")({
                    Name = "ButtonsContainer", 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 62), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4; 
                    v10("UIListLayout")({
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12)
                    }), 
                    v73, 
                    v72
                }), 
                v10("Frame")({
                    Name = "CheckboxContainer", 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 0, 28), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 5; 
                    v10("UIListLayout")({
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 8)
                    }), 
                    v78, 
                    v79
                })
            }).Parent = l_ScreenGui_0;
            task.delay(v20, function()
                l_RbxAnalyticsService_0:SendEventDeferred("client", "voiceChat", "ShowJoinWithVoice", {
                    userId = l_UserId_0, 
                    voiceSessionId = l_default_0:getService():GetSessionId(), 
                    voiceExperienceId = l_default_0:getService():GetVoiceExperienceId()
                });
                v75:Play();
            end);
            return ;
        end;
    else
        v12:trace(l_result_7);
        return ;
    end;
end;
task.delay(v19, function()
    l_default_0:asyncInit():andThen(function()
        v80();
    end):catch(function()
        v12:trace("VoiceChatServiceManager did not initialize for VoiceUserAgency");
    end);
end);
