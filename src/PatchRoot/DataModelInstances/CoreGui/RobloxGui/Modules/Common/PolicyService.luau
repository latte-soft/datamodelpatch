local l_Players_0 = game:GetService("Players");
local v1 = true;
local v2 = nil;
local v3 = false;
local v4 = false;
local l_BindableEvent_0 = Instance.new("BindableEvent");
return {
    InitAsync = function(_)
        if not _G.__TESTEZ_RUNNING_TEST__ then
            if not v3 then
                if not v4 then
                    v4 = true;
                    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                    while not l_LocalPlayer_0 do
                        l_Players_0.PlayerAdded:Wait();
                        l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                    end;
                    assert(l_LocalPlayer_0, "");
                    pcall(function()
                        v2 = game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
                    end);
                    if v2 then
                        v1 = v2.IsSubjectToChinaPolicies;
                    end;
                    v3 = true;
                    l_BindableEvent_0:Fire();
                    return ;
                else
                    l_BindableEvent_0.Event:Wait();
                    return ;
                end;
            else
                return ;
            end;
        else
            v1 = false;
            return ;
        end;
    end, 
    IsSubjectToChinaPolicies = function(v8)
        v8:InitAsync();
        return v1;
    end
};
