local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local l_PromptCreator_0 = require(l_Modules_0:WaitForChild("PromptCreator"));
local l_SocialUtil_0 = require(l_Modules_0:WaitForChild("SocialUtil"));
local v7 = require(l_Modules_0.BlockingUtility);
local l_Size150x150_0 = Enum.ThumbnailSize.Size150x150;
local l_Size352x352_0 = Enum.ThumbnailSize.Size352x352;
local l_HeadShot_0 = Enum.ThumbnailType.HeadShot;
local l_AvatarThumbnail_0 = Enum.ThumbnailType.AvatarThumbnail;
createFetchImageFunction = function(...)
    local v12 = {
        ...
    };
    return function(v13)
        spawn(function()
            local v14 = l_SocialUtil_0.GetPlayerImage(unpack(v12));
            if not (not v13 or not v13.Parent) then
                v13.Image = v14;
            end;
        end);
    end;
end;
DoPromptBlockPlayer = function(v15)
    if not v7:IsPlayerBlockedByUserId(v15.UserId) then
        l_PromptCreator_0:CreatePrompt({
            WindowTitle = "Confirm Block", 
            MainText = string.format("Are you sure you want to block %s?", v15.Name), 
            ConfirmationText = "Block", 
            CancelText = "Cancel", 
            CancelActive = true, 
            Image = "", 
            ImageConsoleVR = "", 
            FetchImageFunction = createFetchImageFunction(v15.UserId, l_Size150x150_0, l_HeadShot_0), 
            FetchImageFunctionConsoleVR = createFetchImageFunction(v15.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
            PromptCompletedCallback = function(v16)
                if not (not v16 or v7:BlockPlayerAsync(v15)) then
                    while l_PromptCreator_0:IsCurrentlyPrompting() do
                        wait();
                    end;
                    l_PromptCreator_0:CreatePrompt({
                        WindowTitle = "Error Blocking User", 
                        MainText = string.format("An error occurred while blocking %s. Please try again later.", v15.Name), 
                        ConfirmationText = "Okay", 
                        CancelActive = false, 
                        Image = "", 
                        ImageConsoleVR = "", 
                        FetchImageFunction = createFetchImageFunction(v15.UserId, l_Size150x150_0, l_HeadShot_0), 
                        FetchImageFunctionConsoleVR = createFetchImageFunction(v15.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                        StripeColor = Color3.fromRGB(183, 34, 54)
                    });
                end;
            end
        });
        return ;
    else
        return ;
    end;
end;
PromptBlockPlayer = function(v17)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptBlockPlayer can not be called for guests");
    end;
    if not (typeof(v17) == "Instance") or not v17:IsA("Player") then
        error("Invalid argument to PromptBlockPlayer");
        return ;
    else
        if v17.UserId < 0 then
            error("PromptBlockPlayer can not be called on guests");
        end;
        if v17 == l_LocalPlayer_0 then
            error("PromptBlockPlayer: A user can not block themselves");
        end;
        DoPromptBlockPlayer(v17);
        return ;
    end;
end;
DoPromptUnblockPlayer = function(v18)
    local _ = not v7:IsPlayerBlockedByUserId(v18.UserId);
    l_PromptCreator_0:CreatePrompt({
        WindowTitle = "Confirm Unblock", 
        MainText = string.format("Would you like to unblock %s?", v18.Name), 
        ConfirmationText = "Unblock", 
        CancelText = "Cancel", 
        CancelActive = true, 
        Image = "", 
        ImageConsoleVR = "", 
        FetchImageFunction = createFetchImageFunction(v18.UserId, l_Size150x150_0, l_HeadShot_0), 
        FetchImageFunctionConsoleVR = createFetchImageFunction(v18.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
        PromptCompletedCallback = function(v20)
            if not (not v20 or v7:UnblockPlayerAsync(v18)) then
                while l_PromptCreator_0:IsCurrentlyPrompting() do
                    wait();
                end;
                l_PromptCreator_0:CreatePrompt({
                    WindowTitle = "Error Unblocking User", 
                    MainText = string.format("An error occurred while unblocking %s. Please try again later.", v18.Name), 
                    ConfirmationText = "Okay", 
                    Image = "", 
                    ImageConsoleVR = "", 
                    FetchImageFunction = createFetchImageFunction(v18.UserId, l_Size150x150_0, l_HeadShot_0), 
                    FetchImageFunctionConsoleVR = createFetchImageFunction(v18.UserId, l_Size352x352_0, l_AvatarThumbnail_0), 
                    StripeColor = Color3.fromRGB(183, 34, 54)
                });
            end;
        end
    });
end;
PromptUnblockPlayer = function(v21)
    if l_LocalPlayer_0.UserId < 0 then
        error("PromptUnblockPlayer can not be called for guests");
    end;
    if not (typeof(v21) == "Instance") or not v21:IsA("Player") then
        error("Invalid argument to PromptUnblockPlayer");
        return ;
    else
        if v21.UserId < 0 then
            error("PromptUnblockPlayer can not be called on guests");
        end;
        if v21 == l_LocalPlayer_0 then
            error("PromptUnblockPlayer: A user can not block themselves");
        end;
        DoPromptUnblockPlayer(v21);
        return ;
    end;
end;
GetBlockedUserIds = function()
    if l_LocalPlayer_0.UserId < 0 then
        error("GetBlockedUserIds can not be called for guests");
    end;
    return v7:GetBlockedUserIdsAsync();
end;
l_StarterGui_0:RegisterSetCore("PromptBlockPlayer", PromptBlockPlayer);
l_StarterGui_0:RegisterSetCore("PromptUnblockPlayer", PromptUnblockPlayer);
l_StarterGui_0:RegisterGetCore("GetBlockedUserIds", GetBlockedUserIds);
v7:InitBlockListAsync();
