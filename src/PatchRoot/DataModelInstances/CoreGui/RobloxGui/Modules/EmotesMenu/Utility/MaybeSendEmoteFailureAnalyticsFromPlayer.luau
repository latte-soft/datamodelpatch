local v0 = require(script.Parent.Parent.Constants);
return function(v1, v2)
    local l_Character_0 = v1.Character;
    if l_Character_0 then
        local v4 = not not l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid") or nil;
        if v4 then
            if v4 and v4.RigType ~= Enum.HumanoidRigType.R15 then
                v2(v0.ErrorTypes.SwitchToR15);
                return true;
            else
                local v5 = not not l_Character_0 and l_Character_0:FindFirstChild("Animate") or nil;
                local v6 = not not v4 and v4:FindFirstChildOfClass("HumanoidDescription") or nil;
                if v5 and v6 then
                    local v7 = not not v5 and v5:FindFirstChild("PlayEmote") or nil;
                    if v7 and v7:IsA("BindableFunction") then
                        return false;
                    else
                        v2(v0.ErrorTypes.NotSupported);
                        return true;
                    end;
                else
                    v2(v0.ErrorTypes.NotSupported);
                    return true;
                end;
            end;
        else
            v2(v0.ErrorTypes.TemporarilyUnavailable);
            return true;
        end;
    else
        v2(v0.ErrorTypes.TemporarilyUnavailable);
        return true;
    end;
end;
