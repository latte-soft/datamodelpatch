local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = {};
local l_DefaultSoundEvents_0 = l_ReplicatedStorage_0:FindFirstChild("DefaultSoundEvents");
if not l_DefaultSoundEvents_0 then
    l_DefaultSoundEvents_0 = Instance.new("Folder");
    l_DefaultSoundEvents_0.Name = "DefaultSoundEvents";
    l_DefaultSoundEvents_0.Archivable = false;
    l_DefaultSoundEvents_0.Parent = l_ReplicatedStorage_0;
end;
local function _(v4, v5)
    local l_l_DefaultSoundEvents_0_FirstChild_0 = l_DefaultSoundEvents_0:FindFirstChild(v4);
    if not l_l_DefaultSoundEvents_0_FirstChild_0 then
        l_l_DefaultSoundEvents_0_FirstChild_0 = Instance.new(v5);
        l_l_DefaultSoundEvents_0_FirstChild_0.Name = v4;
        l_l_DefaultSoundEvents_0_FirstChild_0.Parent = l_DefaultSoundEvents_0;
    end;
    return l_l_DefaultSoundEvents_0_FirstChild_0;
end;
local l_DefaultServerSoundEvent_0 = l_DefaultSoundEvents_0:FindFirstChild("DefaultServerSoundEvent");
if not l_DefaultServerSoundEvent_0 then
    l_DefaultServerSoundEvent_0 = Instance.new("RemoteEvent");
    l_DefaultServerSoundEvent_0.Name = "DefaultServerSoundEvent";
    l_DefaultServerSoundEvent_0.Parent = l_DefaultSoundEvents_0;
end;
local l_l_DefaultServerSoundEvent_0_0 = l_DefaultServerSoundEvent_0;
local l_AddCharacterLoadedEvent_0 = l_DefaultSoundEvents_0:FindFirstChild("AddCharacterLoadedEvent");
if not l_AddCharacterLoadedEvent_0 then
    l_AddCharacterLoadedEvent_0 = Instance.new("RemoteEvent");
    l_AddCharacterLoadedEvent_0.Name = "AddCharacterLoadedEvent";
    l_AddCharacterLoadedEvent_0.Parent = l_DefaultSoundEvents_0;
end;
l_DefaultServerSoundEvent_0 = l_AddCharacterLoadedEvent_0;
local l_RemoveCharacterEvent_0 = l_DefaultSoundEvents_0:FindFirstChild("RemoveCharacterEvent");
if not l_RemoveCharacterEvent_0 then
    l_RemoveCharacterEvent_0 = Instance.new("RemoteEvent");
    l_RemoveCharacterEvent_0.Name = "RemoveCharacterEvent";
    l_RemoveCharacterEvent_0.Parent = l_DefaultSoundEvents_0;
end;
l_AddCharacterLoadedEvent_0 = l_RemoveCharacterEvent_0;
l_RemoveCharacterEvent_0 = function(v12, v13, v14, v15)
    if v2[v12] then
        l_l_DefaultServerSoundEvent_0_0:FireClient(v12, v13, v14, v15);
    end;
end;
local function v17(v16)
    v2[v16] = true;
end;
local function v19(v18)
    v2[v18] = nil;
end;
local l_SoundDispatcher_0 = l_DefaultSoundEvents_0:FindFirstChild("SoundDispatcher");
if not l_SoundDispatcher_0 then
    l_SoundDispatcher_0 = Instance.new("BindableEvent");
    l_SoundDispatcher_0.Name = "SoundDispatcher";
    l_SoundDispatcher_0.Parent = l_DefaultSoundEvents_0;
end;
l_SoundDispatcher_0.Event:Connect(l_RemoveCharacterEvent_0);
l_l_DefaultServerSoundEvent_0_0.OnServerEvent:Connect(function()
end);
l_DefaultServerSoundEvent_0.OnServerEvent:Connect(v17);
l_AddCharacterLoadedEvent_0.OnServerEvent:Connect(v19);
l_Players_0.PlayerRemoving:Connect(v19);
