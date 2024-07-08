local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.includes);
local _ = require(l_Parent_0.join);
local v4 = require(l_Parent_0.keys);
local l_sort_0 = table.sort;
local function v6()
    return {
        visited = {}, 
        refs = {}, 
        nextRef = 1, 
        omit = {}
    };
end;
local function v7(v8, v9, v10)
    if v9 == -1 then
        return v10;
    elseif typeof(v8) == "table" then
        local v11 = v10 or v6();
        if not v11.visited[v8] then
            v11.visited[v8] = true;
            local v12 = v4(v8);
            l_sort_0(v12, function(v13, v14)
                if typeof(v13) == "number" and typeof(v14) == "number" then
                    return v13 < v14;
                else
                    return tostring(v13) < tostring(v14);
                end;
            end);
            for _, v16 in ipairs(v12) do
                local v17 = v8[v16];
                if not v2(v11.omit, v16) then
                    if not v9 then
                        v7(v16, nil, v11);
                        v7(v17, nil, v11);
                    else
                        v7(v16, v9 - 1, v11);
                        v7(v17, v9 - 1, v11);
                    end;
                end;
            end;
            return v11;
        else
            if not v11.refs[v8] then
                v11.refs[v8] = v11.nextRef;
                v11.nextRef = v11.nextRef + 1;
            end;
            return nil;
        end;
    else
        return nil;
    end;
end;
return v7;
