local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Players_0 = game:GetService("Players");
local v3 = require(script.Parent.Parent.Flags.GetFFlagFixAppPolicyDefaultUserId);
local v4 = require(script.Parent.Parent.Flags.GetFFlagCacheParsePolicy);
return function(v5)
    v5 = v5 or {};
    v5.HttpService = v5.HttpService or l_HttpService_0;
    v5.MemStorageService = v5.MemStorageService or l_MemStorageService_0;
    v5.PlayersService = v5.PlayersService or l_Players_0;
    assert(v5.HttpService, "expected dependencies.HttpService");
    assert(v5.MemStorageService, "expected dependencies.MemStorageService");
    assert(v5.PlayersService, "expected dependencies.PlayersService");
    local l_HttpService_1 = v5.HttpService;
    local l_MemStorageService_1 = v5.MemStorageService;
    local l_PlayersService_0 = v5.PlayersService;
    return function(v9)
        assert(v9, "expected behavior");
        local function _()
            local v10 = -1;
            if not v3() then
                if l_PlayersService_0.LocalPlayer then
                    v10 = l_PlayersService_0.LocalPlayer.UserId;
                end;
            else
                local l_LocalPlayer_0 = l_PlayersService_0.LocalPlayer;
                if l_LocalPlayer_0 and l_LocalPlayer_0.UserId > 0 then
                    v10 = l_LocalPlayer_0.UserId;
                end;
            end;
            return "GUAC:" .. v10 .. ":" .. v9;
        end;
        local v13 = nil;
        local v14 = nil;
        local v15 = nil;
        local v16 = nil;
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local function v21(v18)
            if not (not (v18 ~= v15) or not v18) and #v18 > 0 then
                local l_status_0, l_result_0 = pcall(function()
                    return l_HttpService_1:JSONDecode(v18);
                end);
                if l_status_0 then
                    v15 = v18;
                    if v4() then
                        v16 = l_result_0;
                    end;
                    l_BindableEvent_0:Fire(l_result_0);
                end;
            end;
        end;
        return {
            read = function()
                local v22 = -1;
                if not v3() then
                    if l_PlayersService_0.LocalPlayer then
                        v22 = l_PlayersService_0.LocalPlayer.UserId;
                    end;
                else
                    local l_LocalPlayer_1 = l_PlayersService_0.LocalPlayer;
                    if l_LocalPlayer_1 and l_LocalPlayer_1.UserId > 0 then
                        v22 = l_LocalPlayer_1.UserId;
                    end;
                end;
                v22 = l_MemStorageService_1:GetItem("GUAC:" .. v22 .. ":" .. v9);
                if v22 and #v22 > 0 then
                    local l_status_1, l_result_1 = pcall(function()
                        return l_HttpService_1:JSONDecode(v22);
                    end);
                    if l_status_1 then
                        if v4() then
                            v16 = l_result_1;
                        end;
                        v15 = v22;
                        return l_result_1;
                    end;
                end;
                return nil;
            end, 
            onPolicyChanged = function(v26)
                local v27 = -1;
                if not v3() then
                    if l_PlayersService_0.LocalPlayer then
                        v27 = l_PlayersService_0.LocalPlayer.UserId;
                    end;
                else
                    local l_LocalPlayer_2 = l_PlayersService_0.LocalPlayer;
                    if l_LocalPlayer_2 and l_LocalPlayer_2.UserId > 0 then
                        v27 = l_LocalPlayer_2.UserId;
                    end;
                end;
                local v29 = "GUAC:" .. v27 .. ":" .. v9;
                v27 = l_BindableEvent_0.Event:Connect(v26);
                if v14 and v13 == v29 then
                    if not v4() then
                        if v15 then
                            local l_status_2, l_result_2 = pcall(function()
                                return l_HttpService_1:JSONDecode(v15);
                            end);
                            if l_status_2 then
                                v26(l_result_2);
                                return v27;
                            end;
                        end;
                    elseif v16 then
                        v26(v16);
                        return v27;
                    end;
                else
                    if v14 then
                        v14:Disconnect();
                    end;
                    v13 = v29;
                    v14 = l_MemStorageService_1:BindAndFire(v29, v21);
                end;
                return v27;
            end
        };
    end;
end;
