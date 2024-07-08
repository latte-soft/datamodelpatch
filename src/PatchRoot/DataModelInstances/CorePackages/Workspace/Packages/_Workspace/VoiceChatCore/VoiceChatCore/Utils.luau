local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v2 = {};
v2.__index = v2;
v2.new = function()
    return (setmetatable({
        listeners = {}
    }, v2));
end;
v2.addListener = function(v3, v4, v5)
    if not v3.listeners[v4] then
        v3.listeners[v4] = {};
    end;
    table.insert(v3.listeners[v4], v5);
end;
v2.removeAllListeners = function(v6)
    table.clear(v6.listeners);
end;
v2.emit = function(v7, v8, ...)
    local v9 = v7.listeners[v8];
    if v9 then
        for _, v11 in (table.clone(v9)), nil, nil do
            pcall(function(...)
                v11(...);
                return nil;
            end, ...);
        end;
        return ;
    else
        return ;
    end;
end;
return {
    jsonDecode = function(v12)
        local l_status_0, l_result_0 = pcall(function()
            return l_HttpService_0:JSONDecode(v12);
        end);
        if not l_status_0 or not l_result_0 then
            return {};
        else
            return l_result_0;
        end;
    end, 
    EventEmitter = v2, 
    shorten = function(v15)
        return "..." .. string.sub(tostring(v15), -4);
    end, 
    avoidEmitting = function(v16)
        v16.DescendantAdded:Connect(function(v17)
            if v17:HasTag("RbxDefaultVoiceEmitter") then
                task.defer(function()
                    v17:Destroy();
                end);
            end;
        end);
        for _, v19 in v16:GetDescendants() do
            if v19:HasTag("RbxDefaultVoiceEmitter") then
                task.defer(function()
                    v19:Destroy();
                end);
            end;
        end;
    end, 
    destroyDefaultEmitter = function(v20)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 then
                if v20:IsDescendantOf(l_Character_0) then
                    task.defer(function()
                        v20:Destroy();
                    end);
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end, 
    bind = function(v23, v24)
        return function(...)
            return v23[v24](v23, ...);
        end;
    end
};
