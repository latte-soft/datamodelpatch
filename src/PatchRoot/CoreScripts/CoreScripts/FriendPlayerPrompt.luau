local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_PromptCreator_0 = require(l_Modules_0:WaitForChild("PromptCreator"));
local l_SocialUtil_0 = require(l_Modules_0:WaitForChild("SocialUtil"));
local l_FriendingUtility_0 = require(l_Modules_0:WaitForChild("FriendingUtility"));
local l_RobloxTranslator_0 = require(l_Modules_0:WaitForChild("RobloxTranslator"));
local v11 = require(l_Modules_0.Common.LegacyThumbnailUrls);
local _ = v11.Thumbnail;
local _ = v11.Bust;
local l_Size150x150_0 = Enum.ThumbnailSize.Size150x150;
local l_Size352x352_0 = Enum.ThumbnailSize.Size352x352;
local l_HeadShot_0 = Enum.ThumbnailType.HeadShot;
local l_AvatarThumbnail_0 = Enum.ThumbnailType.AvatarThumbnail;
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v20 = l_status_0 and l_result_0;
local function _(v21, v22)
    pcall(function()
        v22 = l_RobloxTranslator_0:FormatByKey(v21);
    end);
    return v22;
end;
createFetchImageFunction = function(...)
    local v24 = {
        ...
    };
    return function(v25)
        spawn(function()
            local v26 = l_SocialUtil_0.GetPlayerImage(unpack(v24));
            if not (not v25 or not v25.Parent) then
                v25.Image = v26;
            end;
        end);
    end;
end;
SendFriendRequest = function(v27)
    l_RbxAnalyticsService_0:ReportCounter("FriendPlayerPrompt-RequestFriendship");
    l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt");
    return (pcall(function()
        l_LocalPlayer_0:RequestFriendship(v27);
    end));
end;
AtFriendLimit = function(v28)
    local l_l_FriendingUtility_0_FriendCountAsync_0 = l_FriendingUtility_0:GetFriendCountAsync(v28.UserId);
    if l_l_FriendingUtility_0_FriendCountAsync_0 == nil then
        return false;
    elseif l_FriendingUtility_0:MaxFriendCount() <= l_l_FriendingUtility_0_FriendCountAsync_0 then
        return true;
    else
        return false;
    end;
end;
DoPromptRequestFriendPlayer = function(v30)
    if not l_LocalPlayer_0:IsFriendsWith(v30.UserId) then
        local function v46(v31)
            if v31 then
                if not AtFriendLimit(l_LocalPlayer_0) then
                    if not AtFriendLimit(v30) then
                        if not SendFriendRequest(v30) then
                            while l_PromptCreator_0:IsCurrentlyPrompting() do
                                wait();
                            end;
                            local v32 = string.format("An error occurred while sending %s a friend request. Please try again later.", v30.Name);
                            if v20 then
                                local l_gsub_0 = string.gsub;
                                local l_v32_0 = v32;
                                local l_pcall_0 = pcall;
                                local v36 = "FriendPlayerPrompt.promptCompletedCallback.UnknownError";
                                local v37;
                                do
                                    local l_l_v32_0_0 = l_v32_0;
                                    l_pcall_0(function()
                                        l_l_v32_0_0 = l_RobloxTranslator_0:FormatByKey(v36);
                                    end);
                                    v37 = l_l_v32_0_0;
                                end;
                                v32 = l_gsub_0(v37, "{RBX_NAME}", v30.Name);
                            end;
                            l_PromptCreator_0:CreatePrompt({
                                WindowTitle = "Error Sending Friend Request", 
                                MainText = v32, 
                                ConfirmationText = "Okay", 
                                CancelActive = false, 
                                Image = "", 
                                ImageConsoleVR = "", 
                                FetchImageFunction = createFetchImageFunction(v30.UserId, l_Size150x150_0, l_HeadShot_0), 
                                FetchImageFunctionConsoleVR = createFetchImageFunction(v30.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                                StripeColor = Color3.fromRGB(183, 34, 54)
                            });
                        end;
                    else
                        local v39 = string.format("You can not send a friend request to %s because they are at the max friend limit.", v30.Name);
                        if v20 then
                            local l_gsub_1 = string.gsub;
                            local l_v39_0 = v39;
                            local l_pcall_1 = pcall;
                            local v43 = "FriendPlayerPrompt.promptCompletedCallback.AtFriendLimit";
                            local v44;
                            do
                                local l_l_v39_0_0 = l_v39_0;
                                l_pcall_1(function()
                                    l_l_v39_0_0 = l_RobloxTranslator_0:FormatByKey(v43);
                                end);
                                v44 = l_l_v39_0_0;
                            end;
                            v39 = l_gsub_1(v44, "{RBX_NAME}", v30.Name);
                        end;
                        l_PromptCreator_0:CreatePrompt({
                            WindowTitle = "Error Sending Friend Request", 
                            MainText = v39, 
                            ConfirmationText = "Okay", 
                            CancelActive = false, 
                            Image = "", 
                            ImageConsoleVR = "", 
                            FetchImageFunction = createFetchImageFunction(v30.UserId, l_Size150x150_0, l_HeadShot_0), 
                            FetchImageFunctionConsoleVR = createFetchImageFunction(v30.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                            StripeColor = Color3.fromRGB(183, 34, 54)
                        });
                        return ;
                    end;
                else
                    while l_PromptCreator_0:IsCurrentlyPrompting() do
                        wait();
                    end;
                    l_PromptCreator_0:CreatePrompt({
                        WindowTitle = "Friend Limit Reached", 
                        MainText = "You can not send a friend request because you are at the max friend limit.", 
                        ConfirmationText = "Okay", 
                        CancelActive = false, 
                        Image = "", 
                        ImageConsoleVR = "", 
                        FetchImageFunction = createFetchImageFunction(v30.UserId, l_Size150x150_0, l_HeadShot_0), 
                        FetchImageFunctionConsoleVR = createFetchImageFunction(v30.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                        StripeColor = Color3.fromRGB(183, 34, 54)
                    });
                    return ;
                end;
            end;
        end;
        local v47 = string.format("Would you like to send %s a Friend Request?", v30.Name);
        if v20 then
            local l_gsub_2 = string.gsub;
            local l_v47_0 = v47;
            local l_pcall_2 = pcall;
            local v51 = "FriendPlayerPrompt.DoPromptRequestFriendPlayer";
            local v52;
            do
                local l_l_v47_0_0 = l_v47_0;
                l_pcall_2(function()
                    l_l_v47_0_0 = l_RobloxTranslator_0:FormatByKey(v51);
                end);
                v52 = l_l_v47_0_0;
            end;
            v47 = l_gsub_2(v52, "{RBX_NAME}", v30.Name);
        end;
        l_PromptCreator_0:CreatePrompt({
            WindowTitle = "Send Friend Request?", 
            MainText = v47, 
            ConfirmationText = "Send Request", 
            CancelText = "Cancel", 
            CancelActive = true, 
            Image = "", 
            ImageConsoleVR = "", 
            FetchImageFunction = createFetchImageFunction(v30.UserId, l_Size150x150_0, l_HeadShot_0), 
            FetchImageFunctionConsoleVR = createFetchImageFunction(v30.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
            PromptCompletedCallback = v46
        });
        return ;
    else
        return ;
    end;
end;
PromptRequestFriendPlayer = function(v54)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptSendFriendRequest can not be called for guests");
    end;
    if not (typeof(v54) == "Instance") or not v54:IsA("Player") then
        error("Invalid argument to PromptSendFriendRequest");
        return ;
    else
        if v54.UserId < 0 then
            error("PromptSendFriendRequest can not be called on guests");
        end;
        if v54 == l_LocalPlayer_0 then
            error("PromptSendFriendRequest: A user can not friend themselves");
        end;
        DoPromptRequestFriendPlayer(v54);
        return ;
    end;
end;
UnFriendPlayer = function(v55)
    return (pcall(function()
        l_LocalPlayer_0:RevokeFriendship(v55);
    end));
end;
DoPromptUnfriendPlayer = function(v56)
    if l_LocalPlayer_0:IsFriendsWith(v56.UserId) then
        local function v65(v57)
            if not (not v57 or UnFriendPlayer(v56)) then
                while l_PromptCreator_0:IsCurrentlyPrompting() do
                    wait();
                end;
                local v58 = string.format("An error occurred while unfriending %s. Please try again later.", v56.Name);
                if v20 then
                    local l_gsub_3 = string.gsub;
                    local l_v58_0 = v58;
                    local l_pcall_3 = pcall;
                    local v62 = "FriendPlayerPrompt.promptCompletedCallback.UnknownError";
                    local v63;
                    do
                        local l_l_v58_0_0 = l_v58_0;
                        l_pcall_3(function()
                            l_l_v58_0_0 = l_RobloxTranslator_0:FormatByKey(v62);
                        end);
                        v63 = l_l_v58_0_0;
                    end;
                    v58 = l_gsub_3(v63, "{RBX_NAME}", v56.Name);
                end;
                l_PromptCreator_0:CreatePrompt({
                    WindowTitle = "Error Unfriending Person", 
                    MainText = v58, 
                    ConfirmationText = "Okay", 
                    CancelActive = false, 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v56.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v56.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
            end;
        end;
        local v66 = string.format("Would you like to remove %s from your friends list?", v56.Name);
        if v20 then
            local l_gsub_4 = string.gsub;
            local l_v66_0 = v66;
            local l_pcall_4 = pcall;
            local v70 = "FriendPlayerPrompt.DoPromptUnfriendPlayer";
            local v71;
            do
                local l_l_v66_0_0 = l_v66_0;
                l_pcall_4(function()
                    l_l_v66_0_0 = l_RobloxTranslator_0:FormatByKey(v70);
                end);
                v71 = l_l_v66_0_0;
            end;
            v66 = l_gsub_4(v71, "{RBX_NAME}", v56.Name);
        end;
        l_PromptCreator_0:CreatePrompt({
            WindowTitle = "Unfriend Person?", 
            MainText = v66, 
            ConfirmationText = "Unfriend", 
            CancelText = "Cancel", 
            CancelActive = true, 
            Image = "", 
            ImageConsoleVR = "", 
            FetchImageFunction = createFetchImageFunction(v56.UserId, l_Size150x150_0, l_HeadShot_0), 
            FetchImageFunctionConsoleVR = createFetchImageFunction(v56.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
            PromptCompletedCallback = v65
        });
        return ;
    else
        return ;
    end;
end;
PromptUnfriendPlayer = function(v73)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptUnfriend can not be called for guests");
    end;
    if not (typeof(v73) == "Instance") or not v73:IsA("Player") then
        error("Invalid argument to PromptUnfriend");
        return ;
    else
        if v73.UserId < 0 then
            error("PromptUnfriend can not be called on guests");
        end;
        if v73 == l_LocalPlayer_0 then
            error("PromptUnfriend: A user can not unfriend themselves");
        end;
        DoPromptUnfriendPlayer(v73);
        return ;
    end;
end;
l_StarterGui_0:RegisterSetCore("PromptSendFriendRequest", PromptRequestFriendPlayer);
l_StarterGui_0:RegisterSetCore("PromptUnfriend", PromptUnfriendPlayer);
