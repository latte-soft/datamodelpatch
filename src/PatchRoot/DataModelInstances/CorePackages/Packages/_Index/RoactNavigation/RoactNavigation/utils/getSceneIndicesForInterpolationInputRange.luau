local l_Array_0 = require(script.Parent.Parent.Parent.LuauPolyfill).Array;
return function(v1)
    local l_scene_0 = v1.scene;
    local l_scenes_0 = v1.scenes;
    local l_index_0 = l_scene_0.index;
    local v5 = #l_scenes_0;
    if not l_scenes_0[v5].isActive then
        local v6 = l_Array_0.indexOf(l_scenes_0, l_scene_0);
        local v7 = nil;
        for v8, v9 in l_scenes_0, nil, nil do
            if v9.isActive then
                v7 = v8;
                break;
            end;
        end;
        local l_index_1 = l_scenes_0[v7].index;
        local l_index_2 = l_scenes_0[v5].index;
        if l_index_0 ~= l_index_1 and v6 == v5 then
            return {
                first = math.min(l_index_1, l_index_0 - 1), 
                last = l_index_0 + 1
            };
        elseif l_index_0 == l_index_1 and v6 == v7 then
            return {
                first = l_index_0 - 1, 
                last = math.max(l_index_2, l_index_0 + 1)
            };
        elseif not (l_index_0 ~= l_index_1) or v7 < v6 then
            return nil;
        end;
    end;
    return {
        first = l_index_0 - 1, 
        last = l_index_0 + 1
    };
end;
