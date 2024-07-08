local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = {};
local v5 = require(l_Parent_0.jsUtils.invariant);
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    local v8 = setmetatable({}, v6);
    v5(v7 >= 0, "CellRenderMask must contain a non-negative number os cells");
    v8._numCells = v7;
    if v7 == 0 then
        v8._regions = {};
        return v8;
    else
        v8._regions = {
            {
                first = 0, 
                last = v7 - 1, 
                isSpacer = true
            }
        };
        return v8;
    end;
end;
v6.enumerateRegions = function(v9)
    return v9._regions;
end;
v6.addCells = function(v10, v11)
    local l_v5_0 = v5;
    local v13 = false;
    if v11.first >= 0 then
        v13 = false;
        if v11.first < v10._numCells then
            v13 = false;
            if v11.last >= 0 then
                v13 = false;
                if v11.last < v10._numCells then
                    v13 = v11.first <= v11.last;
                end;
            end;
        end;
    end;
    l_v5_0(v13, "CellRenderMask.addCells called with invalid cell range");
    l_v5_0, v13 = v10:_findRegion(v11.first);
    local v14, v15 = v10:_findRegion(v11.last);
    if not (v13 == v15) or l_v5_0.isSpacer then
        local v16 = {};
        local v17 = {};
        local v18 = l_Object_0.assign({}, v11, {
            isSpacer = false
        });
        if l_v5_0.first < v18.first then
            if not l_v5_0.isSpacer then
                v18.first = l_v5_0.first;
            else
                table.insert(v16, {
                    first = l_v5_0.first, 
                    last = v18.first - 1, 
                    isSpacer = true
                });
            end;
        end;
        if v18.last < v14.last then
            if not v14.isSpacer then
                v18.last = v14.last;
            else
                table.insert(v17, {
                    first = v18.last + 1, 
                    last = v14.last, 
                    isSpacer = true
                });
            end;
        end;
        l_Array_0.splice(v10._regions, v13, (v15 - v13) + 1, table.unpack((l_Array_0.concat(v16, {
            v18
        }, v17))));
        return ;
    else
        return ;
    end;
end;
v6.equals = function(v19, v20)
    local v21 = false;
    if v19._numCells == v20._numCells then
        v21 = false;
        if #v19._regions == #v20._regions then
            v21 = l_Array_0.every(v19._regions, function(v22, v23)
                local v24 = false;
                if v22.first == v20._regions[v23].first then
                    v24 = false;
                    if v22.last == v20._regions[v23].last then
                        v24 = v22.isSpacer == v20._regions[v23].isSpacer;
                    end;
                end;
                return v24;
            end);
        end;
    end;
    return v21;
end;
v6._findRegion = function(v25, v26)
    local v27 = 1;
    local v28 = #v25._regions;
    while true do
        if v27 <= v28 then
            local v29 = math.floor((v27 + v28) / 2);
            local v30 = v25._regions[v29];
            if v30.first <= v26 and v26 <= v30.last then
                return v30, v29;
            elseif v26 < v30.first then
                v28 = v29 - 1;
            elseif v30.last < v26 then
                v27 = v29 + 1;
            end;
        else
            v5(false, string.format("A region was not found containing cellIdx %s", (tostring(v26))));
            return nil, nil;
        end;
    end;
end;
v4.CellRenderMask = v6;
return v4;
