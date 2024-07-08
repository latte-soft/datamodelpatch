local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v4 = {};
v4.__index = v4;
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v6 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v7 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleRadius);
local v8 = require(l_RobloxGui_0.Modules.Flags.FIntSafetyBubbleTransparencyPercent) * 0.01;
v4.new = function()
    local v9 = setmetatable({}, v4);
    v9.subjects = {};
    v9.mode = l_UserGameSettings_0.VRSafetyBubbleMode;
    v9.enabled = v9.mode ~= Enum.VRSafetyBubbleMode.Anyone;
    v9.updateCadence = 0.2;
    v9.Toggled = v6:Create("BindableEvent")({
        Name = "SafetyBubbleToggled"
    });
    l_UserGameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function()
        v9.mode = l_UserGameSettings_0.VRSafetyBubbleMode;
        local v10 = v9.mode ~= Enum.VRSafetyBubbleMode.Anyone;
        if v9.enabled ~= v10 then
            v9.enabled = v10;
            v9.Toggled:Fire();
            l_RbxAnalyticsService_0:ReportCounter("VR-SafetyBubble-" .. (not v10 and "Off" or "On"));
        end;
    end);
    return v9;
end;
v4.ToggleEnabled = function(v11)
    l_UserGameSettings_0.VRSafetyBubbleMode = not not v11.enabled and Enum.VRSafetyBubbleMode.Anyone or Enum.VRSafetyBubbleMode.NoOne;
end;
v4.HasToolAncestor = function(v12, v13)
    if not (v13 ~= nil) or v13.Parent == nil then
        return false;
    else
        return v13.Parent:IsA("Tool") or v12:HasToolAncestor(v13.Parent);
    end;
end;
v4.IsValidPartToModify = function(v14, v15)
    if not v15:IsA("BasePart") and not v15:IsA("Decal") then
        return false;
    else
        return not v14:HasToolAncestor(v15);
    end;
end;
v4.CachePartsRecursive = function(v16, v17, v18)
    if v17 then
        if v16:IsValidPartToModify(v17) then
            v16.subjects[v18].cachedParts[v17] = true;
            v16.subjects[v18].transparencyDirty = true;
        end;
        for _, v20 in pairs(v17:GetChildren()) do
            v16:CachePartsRecursive(v20, v18);
        end;
    end;
end;
v4.TeardownTransparency = function(v21, v22)
    for v23, _ in pairs(v21.subjects[v22].cachedParts) do
        v23.LocalTransparencyModifier = 0;
    end;
    v21.subjects[v22].cachedParts = {};
    v21.subjects[v22].transparencyDirty = true;
    v21.subjects[v22].lastTransparency = nil;
    if v21.subjects[v22].descendantAddedConn then
        v21.subjects[v22].descendantAddedConn:disconnect();
        v21.subjects[v22].descendantAddedConn = nil;
    end;
    if v21.subjects[v22].descendantRemovingConn then
        v21.subjects[v22].descendantRemovingConn:disconnect();
        v21.subjects[v22].descendantRemovingConn = nil;
    end;
    for v25, v26 in pairs(v21.subjects[v22].toolDescendantAddedConns) do
        v26:Disconnect();
        v21.subjects[v22].toolDescendantAddedConns[v25] = nil;
    end;
    for v27, v28 in pairs(v21.subjects[v22].toolDescendantRemovingConns) do
        v28:Disconnect();
        v21.subjects[v22].toolDescendantRemovingConns[v27] = nil;
    end;
end;
v4.GetSubjectIndex = function(v29, v30)
    local v31 = #v29.subjects;
    local v32 = 1;
    while true do
        if v32 <= v31 then
            if v29.subjects[v32].character == v30 then
                return v32;
            else
                v32 = v32 + 1;
            end;
        else
            return 0;
        end;
    end;
end;
v4.SubjectExists = function(v33, v34)
    return v33:GetSubjectIndex(v34) > 0;
end;
v4.SetupTransparency = function(v35, v36)
    local l_v35_SubjectIndex_0 = v35:GetSubjectIndex(v36);
    if l_v35_SubjectIndex_0 == 0 then
        return ;
    else
        if v35.subjects[l_v35_SubjectIndex_0].descendantAddedConn then
            v35.subjects[l_v35_SubjectIndex_0].descendantAddedConn:disconnect();
        end;
        v35.subjects[l_v35_SubjectIndex_0].descendantAddedConn = v36.DescendantAdded:Connect(function(v38)
            l_v35_SubjectIndex_0 = v35:GetSubjectIndex(v36);
            if l_v35_SubjectIndex_0 == 0 then
                return ;
            else
                if v35:IsValidPartToModify(v38) then
                    v35.subjects[l_v35_SubjectIndex_0].cachedParts[v38] = true;
                    v35.subjects[l_v35_SubjectIndex_0].transparencyDirty = true;
                end;
                return ;
            end;
        end);
        if v35.descendantRemovingConn then
            v35.descendantRemovingConn:disconnect();
        end;
        v35.descendantRemovingConn = v36.DescendantRemoving:connect(function(v39)
            l_v35_SubjectIndex_0 = v35:GetSubjectIndex(v36);
            if l_v35_SubjectIndex_0 == 0 then
                return ;
            else
                if not (not v35.subjects[l_v35_SubjectIndex_0] or not v35.subjects[l_v35_SubjectIndex_0].cachedParts[v39]) then
                    v35.subjects[l_v35_SubjectIndex_0].cachedParts[v39] = nil;
                    v39.LocalTransparencyModifier = 0;
                end;
                return ;
            end;
        end);
        v35:CachePartsRecursive(v36, l_v35_SubjectIndex_0);
        return ;
    end;
end;
v4.AddSubject = function(v40, v41)
    local v42 = #v40.subjects;
    local v43 = 1;
    while true do
        if v43 <= v42 then
            if v40.subjects[v43].character == v41 then
                return ;
            else
                v43 = v43 + 1;
            end;
        else
            table.insert(v40.subjects, {
                transparencyDirty = false, 
                lastTransparency = nil, 
                descendantAddedConn = nil, 
                descendantRemovingConn = nil, 
                toolDescendantAddedConns = {}, 
                toolDescendantRemovingConns = {}, 
                cachedParts = {}, 
                character = nil
            });
            v40.subjects[v43].character = v41;
            v40:SetupTransparency(v41);
            return ;
        end;
    end;
end;
v4.update = function(v44, v45)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 then
        if v44.enabled then
            local v47 = math.max(v7 * l_CurrentCamera_0.HeadScale, 0.1);
            local v48 = nil;
            local v49 = v47 + 3;
            local v50 = l_CurrentCamera_0.CFrame * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            v44.updateCadence = v44.updateCadence - v45;
            if v44.updateCadence <= 0 then
                v44.updateCadence = 0.2;
                for _, v52 in pairs(l_Players_0:GetPlayers()) do
                    if v52.Character and v52 ~= l_Players_0.LocalPlayer then
                        if not (v44.mode == Enum.VRSafetyBubbleMode.OnlyFriends) or not l_Players_0.LocalPlayer:IsFriendsWith(v52.UserId) then
                            if not (v44:SubjectExists(v52.Character) or not v52.Character) then
                                local l_BoundingBox_0, v54 = v52.Character:GetBoundingBox();
                                local v55 = (l_BoundingBox_0.Position - v50.Position).Magnitude - v54.Z;
                                if v55 < v49 then
                                    v49 = v55;
                                    v48 = v52.Character;
                                end;
                            end;
                        else
                            local l_v44_SubjectIndex_0 = v44:GetSubjectIndex(v52.Character);
                            if l_v44_SubjectIndex_0 > 0 then
                                v44:TeardownTransparency(l_v44_SubjectIndex_0);
                                table.remove(v44.subjects, l_v44_SubjectIndex_0);
                            end;
                        end;
                    end;
                end;
                if v48 then
                    v44:AddSubject(v48);
                end;
            end;
            if not v44.subjects or #v44.subjects == 0 then
                return ;
            else
                local v57 = #v44.subjects;
                while v57 > 0 do
                    local l_BoundingBox_1, v59 = v44.subjects[v57].character:GetBoundingBox();
                    if v47 * 2 < (l_BoundingBox_1.Position - v50.Position).Magnitude - v59.Z then
                        v44:TeardownTransparency(v57);
                        table.remove(v44.subjects, v57);
                    end;
                    v57 = v57 - 1;
                end;
                local v60 = #v44.subjects;
                v57 = 1;
                while v57 <= v60 do
                    local v61 = 0;
                    local l_character_0 = v44.subjects[v57].character;
                    local v63 = 0;
                    if not l_character_0.PrimaryPart then
                        local l_l_character_0_BoundingBox_0, v65 = l_character_0:GetBoundingBox();
                        v63 = (l_l_character_0_BoundingBox_0.Position - v50.Position).Magnitude - v65.Z;
                    else
                        v63 = (Vector3.new(l_character_0:GetPrimaryPartCFrame().p.x, v50.Position.Y, l_character_0:GetPrimaryPartCFrame().p.z) - v50.Position).Magnitude;
                    end;
                    if v63 < v47 then
                        if v60 > 3 then
                            v61 = 1;
                        else
                            local v66 = v47 * 0.75;
                            v61 = if v63 < v66 then v8 else (1 - (v63 - v66) / (v47 - v66)) * v8;
                        end;
                    end;
                    if not v44.subjects[v57].lastTransparency then
                        v44.subjects[v57].transparencyDirty = true;
                    end;
                    v61 = math.clamp(v61, 0, 1);
                    if v44.subjects[v57].transparencyDirty or v44.subjects[v57].lastTransparency ~= v61 then
                        for v67, _ in pairs(v44.subjects[v57].cachedParts) do
                            v67.LocalTransparencyModifier = v61;
                        end;
                        v44.subjects[v57].transparencyDirty = false;
                        v44.subjects[v57].lastTransparency = v61;
                    end;
                    local l_Tool_0 = l_character_0:FindFirstChildOfClass("Tool");
                    if l_Tool_0 then
                        for _, v71 in pairs(l_Tool_0:GetChildren()) do
                            if v71:IsA("BasePart") then
                                v71.LocalTransparencyModifier = v61;
                            end;
                        end;
                    end;
                    v57 = v57 + 1;
                end;
                return ;
            end;
        else
            if v44.subjects and #v44.subjects > 0 then
                for v72 = 1, #v44.subjects do
                    v44:TeardownTransparency(v72);
                end;
                v44.subjects = {};
            end;
            return ;
        end;
    else
        return ;
    end;
end;
return v4;
