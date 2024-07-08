local l_Map_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Map;
local v1 = {};
local function v2()
end;
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5)
    local l_v4_0 = v4;
    local l_v5_0 = v5;
    if l_v4_0 == nil then
        l_v4_0 = math.huge;
    end;
    if l_v5_0 == nil then
        l_v5_0 = v2;
    end;
    local v8 = setmetatable({}, v3);
    v8.map = l_Map_0.new(nil);
    v8.newest = nil;
    v8.oldest = nil;
    v8.max = l_v4_0;
    v8.dispose = l_v5_0;
    return v8;
end;
v3.has = function(v9, v10)
    return v9.map:has(v10);
end;
v3.get = function(v11, v12)
    local v13 = v11:getNode(v12);
    if not v13 then
        return v13;
    else
        return v13.value;
    end;
end;
v3.getNode = function(v14, v15)
    local v16 = v14.map:get(v15);
    if v16 and v16 ~= v14.newest then
        local l_older_0 = v16.older;
        local l_newer_0 = v16.newer;
        if l_newer_0 then
            l_newer_0.older = l_older_0;
        end;
        if l_older_0 then
            l_older_0.newer = l_newer_0;
        end;
        v16.older = v14.newest;
        v16.older.newer = v16;
        v16.newer = nil;
        v14.newest = v16;
        if v16 == v14.oldest then
            v14.oldest = l_newer_0;
        end;
    end;
    return v16;
end;
v3.set = function(v19, v20, v21)
    local v22 = v19:getNode(v20);
    if not v22 then
        v22 = {
            key = v20, 
            value = v21, 
            newer = nil, 
            older = v19.newest
        };
        if v19.newest then
            v19.newest.newer = v22;
        end;
        v19.newest = v22;
        v19.oldest = v19.oldest or v22;
        v19.map:set(v20, v22);
        return v22.value;
    else
        v22.value = v21;
        return v22.value;
    end;
end;
v3.clean = function(v23)
    while v23.oldest and v23.max < v23.map.size do
        v23:delete(v23.oldest.key);
    end;
end;
v3.delete = function(v24, v25)
    local v26 = v24.map:get(v25);
    if not v26 then
        return false;
    else
        if v26 == v24.newest then
            v24.newest = v26.older;
        end;
        if v26 == v24.oldest then
            v24.oldest = v26.newer;
        end;
        if v26.newer then
            v26.newer.older = v26.older;
        end;
        if v26.older then
            v26.older.newer = v26.newer;
        end;
        v24.map:delete(v25);
        v24.dispose(v26.value, v25);
        return true;
    end;
end;
v1.Cache = v3;
return v1;
