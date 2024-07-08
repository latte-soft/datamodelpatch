local v0 = {};
v0.__index = v0;
v0.new = function(v1)
    local v2 = {};
    setmetatable(v2, v0);
    v2.aggregatedData = v1;
    v2.sounds = {};
    return v2;
end;
v0.addSound = function(v3, v4, v5)
    local v6 = v3.sounds[v4];
    if v6 == nil then
        v3.sounds[v4] = {
            count = 0, 
            starttime = os.time(), 
            maxLoopCount = 1, 
            instances = {}
        };
        v6 = v3.sounds[v4];
    end;
    if v6.instances[v5] == nil then
        v6.instances[v5] = 1;
        v6.count = v6.count + 1;
    end;
end;
v0.removeSound = function(v7, v8, v9)
    local v10 = v7.sounds[v8];
    if v10 == nil then
        return ;
    else
        if v10.instances[v9] then
            v10.instances[v9] = nil;
            v10.count = v10.count - 1;
        end;
        if v10.count == 0 then
            v7.aggregatedData:addPlay(v8, os.time() - v10.starttime, v10.maxLoopCount);
            v7.sounds[v8] = nil;
        end;
        return ;
    end;
end;
v0.loopSound = function(v11, v12, v13)
    local v14 = v11.sounds[v12];
    if not (v14 ~= nil) or v14.instances[v13] == nil then
        return ;
    else
        local l_instances_0 = v14.instances;
        l_instances_0[v13] = l_instances_0[v13] + 1;
        v14.maxLoopCount = math.max(v14.maxLoopCount, v14.instances[v13]);
        return ;
    end;
end;
return v0;
