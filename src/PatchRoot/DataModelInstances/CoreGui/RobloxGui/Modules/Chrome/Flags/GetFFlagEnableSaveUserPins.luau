local l_Players_0 = game:GetService("Players");
game:DefineFastFlag("EnableSaveUserPins", false);
return function()
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    while not l_LocalPlayer_0 do
        l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    end;
    return game:GetFastFlag("EnableSaveUserPins");
end;
