local l_PolicyService_0 = game:GetService("PolicyService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Parent.Promise);
local v4 = require(l_Parent_0.Logger);
return function(v5)
    v5 = v5 or {};
    v5.PolicyService = v5.PolicyService or l_PolicyService_0;
    v5.PlayersService = v5.PlayersService or l_Players_0;
    assert(v5.PolicyService, "expected dependencies.PolicyService");
    assert(v5.PlayersService, "expected dependencies.PlayersService");
    local l_PolicyService_1 = v5.PolicyService;
    local l_PlayersService_0 = v5.PlayersService;
    return function()
        return {
            read = function()
                return nil;
            end, 
            onPolicyChanged = function(v8)
                local l_BindableEvent_0 = Instance.new("BindableEvent");
                local v10 = l_BindableEvent_0.Event:Connect(v8);
                v3.new(function(v11, v12)
                    local l_LocalPlayer_0 = l_PlayersService_0.LocalPlayer;
                    if not l_LocalPlayer_0 then
                        v12("LocalPlayer not found");
                        return ;
                    else
                        local l_status_0, l_result_0 = pcall(function()
                            return l_PolicyService_1:GetPolicyInfoForPlayerAsync(l_LocalPlayer_0);
                        end);
                        if not l_status_0 then
                            v12("GetPolicyInfoForPlayerAsync had an error when calling");
                            return ;
                        elseif not l_result_0 then
                            v12("GetPolicyInfoForPlayerAsync return nil value");
                            return ;
                        else
                            v11(l_result_0);
                            return ;
                        end;
                    end;
                end):andThen(function(v16)
                    l_BindableEvent_0:Fire(v16);
                end):catch(function(v17)
                    v4:warning("Could not fetch from PolicyService due to error: {}", v17);
                end);
                return v10;
            end
        };
    end;
end;
