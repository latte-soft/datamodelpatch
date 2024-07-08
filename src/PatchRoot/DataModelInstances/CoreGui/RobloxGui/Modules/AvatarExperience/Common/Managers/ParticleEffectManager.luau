local l_Workspace_0 = game:GetService("Workspace");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(game:GetService("CorePackages").Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = {};
v8.__index = v8;
v8.new = function(v9, v10)
    local v11 = {};
    setmetatable(v11, v8);
    v11.connections = {};
    v11.store = v9;
    v11.avatarRoute = v10;
    v11.avatarSwapPFX = {};
    for _ = 1, 4 do
        table.insert(v11.avatarSwapPFX, l_ReplicatedStorage_0:WaitForChild("AvatarSwap-PFX"):Clone());
    end;
    v11.emissionId = 0;
    v11.destroyed = false;
    return v11;
end;
v8.setAvatarRoute = function(v13, v14)
    v13.avatarRoute = v14;
end;
v8.start = function(v15)
    for _, v17 in v15.avatarSwapPFX, nil, nil do
        v17.Parent = l_Workspace_0;
        v17.MainEmitter.Rate = 10;
        v17.MediumEmitter.MediumEmissions.Rate = 20;
        v17.SmallerEmitter.SmallerEmissions.Rate = 20;
    end;
    table.insert(v15.connections, (v15.store.changed:connect(function(v18, v19)
        v15:update(v18, v19);
    end)));
    v15.oldAccessories = {};
    v15.changedAccessories = {};
    v15.curCharacter = nil;
    v15.accessoryPositions = {};
end;
v8.stop = function(v20)
    for _, v22 in v20.avatarSwapPFX, nil, nil do
        v22.Parent = l_ReplicatedStorage_0;
    end;
    for _, v24 in v20.connections, nil, nil do
        v24:disconnect();
    end;
    v20.connections = {};
end;
local l_next_0 = next;
v8.getAttachmentOrPartPosition = function(v26, v27)
    local v28 = v7.AssetTypeIdToPartsAndAttachments[v26.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType][v27];
    if v28 == nil then
        return nil;
    else
        local v29 = {};
        for _, v31 in v28, nil, nil do
            local v32 = not not v31 and (v31.Attachment and v5.getAttachmentCFrame(v26.curCharacter, v31.Part, v31.Attachment) or v5.getPartCFrame(v26.curCharacter, v31.Part)) or nil;
            if v32 ~= nil and v32.Position ~= nil then
                table.insert(v29, v32.Position);
            end;
        end;
        return v29;
    end;
end;
v8.getChangedTryOnPart = function(v33, v34, v35)
    local v36 = v35.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    local v37 = v34.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    if v37 == v36 then
        return nil, nil;
    else
        return v37.itemId or v36.itemId, v33:getAttachmentOrPartPosition(v37.itemSubType or v36.itemSubType);
    end;
end;
v8.getChangedEquippedPart = function(v38, v39, v40)
    local v41, v42 = l_next_0((v6.getEquippedDiffs(v39.AvatarExperience.AvatarEditor.Character.EquippedAssets or {}, v40.AvatarExperience.AvatarEditor.Character.EquippedAssets or {})));
    if not v41 then
        return nil, nil;
    else
        return v42[1], v38:getAttachmentOrPartPosition(v41);
    end;
end;
v8.setPositions = function(v43, v44)
    for v45, v46 in v44, nil, nil do
        if v45 <= 4 then
            v43.avatarSwapPFX[v45].Position = v46;
            v43.avatarSwapPFX[v45].MediumEmitter.Position = v46;
            v43.avatarSwapPFX[v45].SmallerEmitter.Position = v46;
        else
            break;
        end;
    end;
end;
v8.getChangedAttachmentPosition = function(v47, v48, v49)
    if not l_next_0(v47.changedAccessories) then
        local v50, v51 = v47:getChangedEquippedPart(v48, v49);
        if not v51 then
            local v52, v53 = v47:getChangedTryOnPart(v48, v49);
            v50 = v52;
            v51 = v53;
        end;
        return v51;
    else
        local v54 = {};
        local v55 = {};
        for _, v57 in v47.changedAccessories, nil, nil do
            local v58 = v47.accessoryPositions[v57.accessory.Name];
            if not v58 then
                if not v57.removed then
                    table.insert(v55, v57);
                end;
            else
                table.insert(v54, v58);
                if v57.removed then
                    v47.accessoryPositions[v57.accessory.Name] = nil;
                end;
            end;
        end;
        v47.changedAccessories = v55;
        return v54;
    end;
end;
v8.getAccessories = function(v59, _)
    return (v59.curCharacter:FindFirstChildOfClass("Humanoid"):GetAccessories());
end;
v8.cachePosition = function(v61, v62)
    local l_BasePart_0 = v62:FindFirstChildWhichIsA("BasePart");
    if l_BasePart_0 then
        v61.accessoryPositions[v62.Name] = l_BasePart_0.Position;
    end;
    return l_BasePart_0;
end;
v8.updateChangedAccessory = function(v64, v65)
    local v66 = v64:getAccessories(v65);
    local v67 = v6.diffList(v66, v64.oldAccessories);
    local l_oldAccessories_0 = v64.oldAccessories;
    v64.changedAccessories = v3.List.join(v64.changedAccessories, (v3.List.map(v67, function(v69)
        if not v3.List.find(l_oldAccessories_0, v69) then
            return {
                accessory = v69, 
                removed = false
            };
        else
            return {
                accessory = v69, 
                removed = true
            };
        end;
    end)));
    for _, v71 in v64.changedAccessories, nil, nil do
        if not v64.accessoryPositions[v71.accessory.Name] then
            v64:cachePosition(v71.accessory);
        end;
    end;
    v64.oldAccessories = v66;
end;
v8.update = function(v72, v73, v74)
    if v73.AvatarExperience.AvatarScene.Character.CurrentCharacter then
        v72.curCharacter = v73.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        v72:updateChangedAccessory(v73);
        local v75 = v73.AvatarExperience.AvatarEditor.Character.EquippedAssets ~= v74.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local v76 = v73.AvatarExperience.AvatarEditor.Character.AvatarType ~= v74.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v77 = v73.AvatarExperience.AvatarEditor.Character.BodyColors ~= v74.AvatarExperience.AvatarEditor.Character.BodyColors;
        local v78 = v73.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems ~= v74.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local l_name_0 = v72.avatarRoute.opaque.name;
        if not (l_name_0 ~= "ProfilePictureEditorEmotes" and l_name_0 ~= "ProfilePictureEditorCamera") or l_name_0 == "ProfilePictureEditorFinal" then
            for v80 = 1, #v72.avatarSwapPFX do
                v72.avatarSwapPFX[v80].MainEmitter.Enabled = false;
                v72.avatarSwapPFX[v80].MediumEmitter.MediumEmissions.Enabled = false;
                v72.avatarSwapPFX[v80].SmallerEmitter.SmallerEmissions.Enabled = false;
            end;
            return ;
        else
            if not (not (((v75 or v76) or v77) or v78) and not l_next_0(v72.changedAccessories)) then
                local v81 = v72:getChangedAttachmentPosition(v73, v74);
                if not (not v81 or not l_next_0(v81)) then
                    v72:setPositions(v81);
                    v72:runParticleEmitter(#v81);
                end;
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v8.runParticleEmitter = function(v82, v83)
    task.spawn(function()
        local v84 = math.min(v83, 4);
        for v85, v86 in v82.avatarSwapPFX, nil, nil do
            if v84 < v85 then
                v86.MainEmitter.Enabled = false;
                v86.MediumEmitter.MediumEmissions.Enabled = false;
                v86.SmallerEmitter.SmallerEmissions.Enabled = false;
            else
                v86.MainEmitter.Enabled = true;
                v86.MediumEmitter.MediumEmissions.Enabled = true;
                v86.SmallerEmitter.SmallerEmissions.Enabled = true;
            end;
        end;
        v82.emissionId = v82.emissionId + 1;
        local l_emissionId_0 = v82.emissionId;
        task.wait(0.3);
        if not v82.destroyed then
            if v82.emissionId == l_emissionId_0 then
                for v88 = 1, v84 do
                    v82.avatarSwapPFX[v88].MainEmitter.Enabled = false;
                    v82.avatarSwapPFX[v88].MediumEmitter.MediumEmissions.Enabled = false;
                    v82.avatarSwapPFX[v88].SmallerEmitter.SmallerEmissions.Enabled = false;
                end;
            end;
            return ;
        else
            return ;
        end;
    end);
end;
v8.onDestroy = function(v89)
    v89.avatarSwapPFX[1]:Destroy();
    v89.avatarSwapPFX[2]:Destroy();
    v89.avatarSwapPFX[3]:Destroy();
    v89.avatarSwapPFX[4]:Destroy();
    v89.destroyed = true;
end;
return v8;
