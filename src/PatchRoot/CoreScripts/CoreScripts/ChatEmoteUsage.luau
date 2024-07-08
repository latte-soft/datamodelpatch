local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local _ = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Stats_0 = game:GetService("Stats");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_CoreGui_0.RobloxGui.Modules.EmotesMenu.Constants);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer);
while l_Players_0.LocalPlayer == nil do
    wait();
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function v9(v8)
    l_RbxAnalyticsService_0:SetRBXEventStream("client", "chat", "emoteTriggered", {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_LocalPlayer_0.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        assetID = if not v8.AssetId then nil else tostring(v8.AssetId), 
        slotNumber = if not v8.Slot then nil else tostring(v8.Slot)
    });
end;
local function v12(v10, v11)
    l_RbxAnalyticsService_0:SendEventDeferred("client", "chat", "emoteTriggerFailed", {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_LocalPlayer_0.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        assetID = if not not v11 and v11.AssetId then tostring(v11.AssetId) else nil, 
        slotNumber = if not not v11 and v11.Slot then tostring(v11.Slot) else nil, 
        errorType = v10, 
        invokedByCoreGui = false
    });
end;
local function _(v13)
    local l_Character_0 = v13.Character;
    if not l_Character_0 then
        return nil;
    else
        return l_Character_0:FindFirstChildOfClass("Humanoid");
    end;
end;
local function _(v16)
    local l_Character_1 = v16.Character;
    local v18 = if not l_Character_1 then nil else l_Character_1:FindFirstChildOfClass("Humanoid");
    if not v18 then
        return nil;
    else
        return v18:FindFirstChildOfClass("HumanoidDescription");
    end;
end;
local function _(v20)
    if string.sub(v20, 1, 3) == "/e " then
        return string.sub(v20, 4):lower();
    elseif string.sub(v20, 1, 7) == "/emote " then
        return string.sub(v20, 8):lower();
    else
        return nil;
    end;
end;
local _ = function(v22, v23)
    for _, v25 in ipairs((v22:GetEquippedEmotes())) do
        if v25.Slot == v23 then
            return v25;
        end;
    end;
    return nil;
end;
local function v31(v27, v28)
    for v29, v30 in pairs((v27:GetEmotes())) do
        if string.lower(v28.Name) == string.lower(v29) then
            return {
                Name = v29, 
                Slot = v28.Slot, 
                AssetId = v30[1]
            };
        end;
    end;
    return nil;
end;
local function v36(v32, v33)
    for v34, v35 in pairs((v32:GetEmotes())) do
        if string.lower(v33) == string.lower(v34) then
            return {
                Name = v34, 
                Slot = nil, 
                AssetId = v35[1]
            };
        end;
    end;
    return nil;
end;
local _ = function(v37, v38)
    local v39 = tonumber(v38);
    if not v39 then
        return (v36(v37, v38));
    else
        local v40;
        for _, v42 in ipairs((v37:GetEquippedEmotes())) do
            if v42.Slot == v39 then
                v40 = v42;
                goto label0 --[[  true, false  ]];
            end;
        end;
        v40 = nil;
        ::label0::;
        if not v40 then
            return nil;
        else
            return (v31(v37, v40));
        end;
    end;
end;
local v44 = {
    wave = {
        R6 = 128777973, 
        R15 = 507770239
    }, 
    point = {
        R6 = 128853357, 
        R15 = 507770453
    }, 
    dance = {
        R6 = 182435998, 
        R15 = 507771019
    }, 
    dance2 = {
        R6 = 182436842, 
        R15 = 507776043
    }, 
    dance3 = {
        R6 = 182436935, 
        R15 = 507777268
    }, 
    laugh = {
        R6 = 129423131, 
        R15 = 507770818
    }, 
    cheer = {
        R6 = 129423030, 
        R15 = 507770677
    }
};
local function _(v45, v46, v47)
    return {
        Name = v46, 
        Slot = nil, 
        AssetId = if not (v45.RigType == Enum.HumanoidRigType.R15) then v47.R6 else v47.R15
    };
end;
l_LocalPlayer_0.Chatted:Connect(function(v49, _)
    local v51 = if string.sub(v49, 1, 3) == "/e " then string.sub(v49, 4):lower() else if string.sub(v49, 1, 7) == "/emote " then string.sub(v49, 8):lower() else nil;
    if v51 then
        local v52 = nil;
        local v53 = v44[v51];
        if not v53 then
            local l_Character_2 = l_LocalPlayer_0.Character;
            local v55 = if not l_Character_2 then nil else l_Character_2:FindFirstChildOfClass("Humanoid");
            local v56 = if not v55 then nil else v55:FindFirstChildOfClass("HumanoidDescription");
            if v56 then
                local v57 = tonumber(v51);
                if not v57 then
                    v52 = v36(v56, v51);
                else
                    for _, v59 in ipairs((v56:GetEquippedEmotes())) do
                        if v59.Slot == v57 then
                            v55 = v59;
                            goto label1 --[[  true, false  ]];
                        end;
                    end;
                    v55 = nil;
                    ::label1::;
                    v52 = if not v55 then nil else v31(v56, v55);
                end;
            end;
        else
            local l_Character_3 = l_LocalPlayer_0.Character;
            local v61 = if not l_Character_3 then nil else l_Character_3:FindFirstChildOfClass("Humanoid");
            if v61 then
                v52 = {
                    Name = v51, 
                    Slot = nil, 
                    AssetId = if not (v61.RigType == Enum.HumanoidRigType.R15) then v53.R6 else v53.R15
                };
            end;
        end;
        do
            local l_v52_0 = v52;
            if not l_v52_0 then
                v12(v5.ErrorTypes.NoMatchingEmote);
            else
                v9(l_v52_0);
                v6(l_LocalPlayer_0, function(v63)
                    v12(v63, l_v52_0);
                end);
            end;
        end;
    end;
end);
