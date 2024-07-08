local l_Players_0 = game:GetService("Players");
local v1 = require(game:GetService("CorePackages").Packages.React);
useHealthBinding = function()
    local v2, v3 = v1.useBinding(0);
    v1.useEffect(function()
        local v4 = nil;
        local v5 = nil;
        local v6 = nil;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        while not l_LocalPlayer_0 do
            l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
            l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        end;
        local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
        local function v10()
            local v9 = 0;
            if v4 and v4.MaxHealth > 0 then
                v9 = v4.Health / v4.MaxHealth;
            end;
            v3(v9);
        end;
        local function _()
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
        end;
        local function v12()
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
            local l_Character_0 = l_l_LocalPlayer_0_0.Character;
            if l_Character_0 then
                v4 = l_Character_0:FindFirstChildOfClass("Humanoid");
                if not v4 then
                    v6 = l_Character_0.ChildAdded:Connect(function(v14)
                        if v14:isA("Humanoid") then
                            v12();
                        end;
                    end);
                else
                    v5 = v4.HealthChanged:Connect(v10);
                end;
            end;
            local v15 = 0;
            if v4 and v4.MaxHealth > 0 then
                v15 = v4.Health / v4.MaxHealth;
            end;
            v3(v15);
        end;
        local v16 = l_l_LocalPlayer_0_0.CharacterAdded:Connect(v12);
        local v17 = l_l_LocalPlayer_0_0.CharacterRemoving:Connect(v12);
        v12();
        return function()
            v16:Disconnect();
            v17:Disconnect();
            if v6 then
                v6:Disconnect();
                v6 = nil;
            end;
            if v5 then
                v5:Disconnect();
                v5 = nil;
            end;
        end;
    end, {});
    return v2;
end;
return useHealthBinding;
