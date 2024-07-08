local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.Parent.LuauPolyfill).Error;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = {};
local v4 = require(l_Parent_0.jsUtils.invariant);
local function v14(v5, v6, v7)
    local v8 = {};
    local v9 = 0;
    for v10 = 1, v6 do
        local v11 = v7(v10);
        local v12 = v11.offset + v11.length;
        for v13 = 1, #v5 do
            if v8[v13] == nil and v5[v13] <= v12 then
                v8[v13] = v10;
                v9 = v9 + 1;
                if v13 == #v5 then
                    if v9 ~= #v5 then
                        v4(v9 == #v5, "bad offsets input, should be in increasing order: %s", l_HttpService_0:JSONEncode(v5));
                    end;
                    return v8;
                end;
            end;
        end;
    end;
    return v8;
end;
v3.elementsThatOverlapOffsets = v14;
v3.newRangeCount = function(v15, v16)
    return ((v16.last - v16.first) + 1) - math.max(0, (1 + math.min(v16.last, v15.last)) - math.max(v16.first, v15.first));
end;
v3.computeWindowedRenderLimits = function(v17, v18, v19, v20, v21, v22, v23)
    local v24 = v18(v17);
    if v24 == 0 then
        return v21;
    else
        local l_offset_0 = v23.offset;
        local l_velocity_0 = v23.velocity;
        local l_visibleLength_0 = v23.visibleLength;
        local v28 = math.max(0, l_offset_0);
        local v29 = v28 + l_visibleLength_0;
        local v30 = (v20 - 1) * l_visibleLength_0;
        local v31 = l_velocity_0 > 1 and "after" or (l_velocity_0 < -1 and "before" or "none");
        local v32 = math.max(0, v28 - 0.5 * v30);
        local v33 = math.max(0, v29 + 0.5 * v30);
        if v22(v24).offset < v32 then
            return {
                first = math.max(1, v24 - v19), 
                last = v24
            };
        else
            local v34, v35, v36, v37 = table.unpack(v14({
                v32, 
                v28, 
                v29, 
                v33
            }, v24, v22), 1, 4);
            if v34 == nil then
                v34 = 1;
            end;
            if v35 == nil then
                v35 = math.max(1, v34);
            end;
            if v37 == nil then
                v37 = v24;
            end;
            if v36 == nil then
                v36 = math.min(v37, (v35 + v19) - 1);
            end;
            local v38 = {
                first = v35, 
                last = v36
            };
            local v39 = ((v38.last - v38.first) + 1) - math.max(0, (1 + math.min(v38.last, v21.last)) - math.max(v38.first, v21.first));
            while not (v35 <= v34) or v37 > v36 do
                local v40 = v19 <= v39;
                local v41 = true;
                if v35 > v21.first then
                    v41 = v21.last < v35;
                end;
                local v42 = false;
                if v34 < v35 then
                    v42 = not v40 or not v41;
                end;
                local v43 = true;
                if v21.last > v36 then
                    v43 = v36 < v21.first;
                end;
                local v44 = false;
                if v36 < v37 then
                    v44 = not v40 or not v43;
                end;
                if not (not (not v40 or v42) and not v44) then
                    if not (not v42 or not (not (v31 == "after") or not v44) and v43) then
                        if v41 then
                            v39 = v39 + 1;
                        end;
                        v35 = v35 - 1;
                    end;
                    if not (not v44 or not (not (v31 == "before") or not v42) and v41) then
                        if v43 then
                            v39 = v39 + 1;
                        end;
                        v36 = v36 + 1;
                    end;
                else
                    break;
                end;
            end;
            if not (((((v35 <= v36 and v35 >= 1) and v36 <= v24) and v34 <= v35) and v36 <= v37) and v35 <= v38.first) or v38.last > v36 then
                error(l_Error_0.new("Bad window calculation " .. l_HttpService_0:JSONEncode({
                    first = v35, 
                    last = v36, 
                    itemCount = v24, 
                    overscanFirst = v34, 
                    overscanLast = v37, 
                    visible = v38
                })));
            end;
            return {
                first = v35, 
                last = v36
            };
        end;
    end;
end;
v3.keyExtractor = function(v45, v46)
    if typeof(v45) == "table" and v45.key ~= nil then
        return v45.key;
    elseif typeof(v45) == "table" and v45.id ~= nil then
        return v45.id;
    else
        return (tostring(v46));
    end;
end;
return v3;
