local l_Players_0 = game:GetService("Players");
local v1 = game:DefineFastFlag("FixAvatarUtilCharacter", false);
local v2 = {};
v2.__index = v2;
v2.new = function(v3)
    local v4 = setmetatable({}, v2);
    v4.player = v3;
    v4.characterChangedEvent = Instance.new("BindableEvent");
    v4.eventQueued = false;
    v4.connections = {};
    v4.connections.characterAddedConnection = v3.CharacterAdded:Connect(function(v5)
        v4:onCharacterChanged(v5);
    end);
    v4.connections.characterAppearanceChangedConnection = v3.CharacterAppearanceLoaded:Connect(function(v6)
        v4:onCharacterChanged(v6);
    end);
    if not (not v1 or not v4.player.Character) then
        v4:onCharacterChanged(v4.player.Character);
    end;
    return v4;
end;
v2.removeConnection = function(v7, v8)
    if v7.connections[v8] then
        v7.connections[v8]:Disconnect();
        v7.connections[v8] = nil;
    end;
end;
v2.onCharacterChanged = function(v9, v10)
    v9:removeConnection("descendantAddedConnection");
    v9.connections.descendantAddedConnection = v10.DescendantAdded:Connect(function(v11)
        v9:onDescendantAdded(v11);
    end);
    v9:removeConnection("descendantRemovedConnection");
    v9.connections.descendantRemovedConnection = v10.DescendantRemoving:Connect(function(v12)
        v9:onDescendantRemoving(v12);
    end);
    for _, v14 in pairs(v10:GetDescendants()) do
        v9:onDescendantAdded(v14);
    end;
    v9:fireCharacterChanged();
end;
v2.onDescendantAdded = function(v15, v16)
    if v16:IsA("NumberValue") then
        local v17 = v16.Name .. "Connection";
        v15:removeConnection(v17);
        v15.connections[v17] = v16.Changed:Connect(function()
            v15:fireCharacterChanged();
        end);
    end;
    v15:fireCharacterChanged();
end;
v2.onDescendantRemoving = function(v18, v19)
    if v19:IsA("NumberValue") then
        v18:removeConnection(v19.Name .. "Connection");
    end;
    v18:fireCharacterChanged();
end;
v2.fireCharacterChanged = function(v20)
    if not v20.eventQueued then
        v20.eventQueued = true;
        task.delay(0.1, function()
            v20.eventQueued = false;
            local l_Character_0 = v20.player.Character;
            if l_Character_0 then
                v20.characterChangedEvent:Fire(l_Character_0);
            end;
        end);
        return ;
    else
        return ;
    end;
end;
local v22 = {};
v22.__index = v22;
v22.new = function()
    local v23 = setmetatable({}, v22);
    v23.playerConnections = {};
    return v23;
end;
v22.connectLocalCharacterChanges = function(v24, v25)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0.Changed:Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    v24:connectPlayerCharacterChanges(l_LocalPlayer_0, v25);
end;
v22.connectPlayerCharacterChanges = function(v27, v28, v29)
    if not v27.playerConnections[v28] then
        v27.playerConnections[v28] = v2.new(v28);
    end;
    v27.playerConnections[v28].characterChangedEvent.Event:Connect(v29);
    v27.playerConnections[v28]:fireCharacterChanged();
end;
return v22;
