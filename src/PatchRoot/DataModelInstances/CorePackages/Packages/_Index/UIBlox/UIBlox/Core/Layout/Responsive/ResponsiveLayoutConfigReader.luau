local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = function(v3, v4)
    for _, v6 in v3, nil, nil do
        if v6 == v4 then
            return true;
        end;
    end;
    return false;
end;
local _ = function(v8, v9)
    if not v8 or not v9 then
        return true;
    elseif typeof(v9) == "table" then
        for _, v11 in v9, nil, nil do
            if v11 == v8 then
                return true;
            end;
        end;
        return false;
    else
        return v9 == v8;
    end;
end;
local function v13(v14, v15, v16, v17, v18)
    local v19 = v14[v17];
    local v20 = if v19 ~= nil then v18 else -1;
    l_Array_0.forEach(v14, function(v21)
        local l_v15_0 = v15;
        local l_breakpoint_0 = v21.breakpoint;
        local v24;
        if not l_v15_0 or not l_breakpoint_0 then
            v24 = true;
        elseif typeof(l_breakpoint_0) == "table" then
            for _, v26 in l_breakpoint_0, nil, nil do
                if v26 == l_v15_0 then
                    v24 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v24 = false;
        else
            v24 = l_breakpoint_0 == l_v15_0;
        end;
        ::label0::;
        if v24 then
            l_v15_0 = v16;
            l_breakpoint_0 = v21.kind;
            if not l_v15_0 or not l_breakpoint_0 then
                v24 = true;
            elseif typeof(l_breakpoint_0) == "table" then
                for _, v28 in l_breakpoint_0, nil, nil do
                    if v28 == l_v15_0 then
                        v24 = true;
                        goto label1 --[[  true, false  ]];
                    end;
                end;
                v24 = false;
            else
                v24 = l_breakpoint_0 == l_v15_0;
            end;
            ::label1::;
            if v24 then
                v24, l_v15_0 = v13(v21, v15, v16, v17, v18 + 1);
                if v20 < l_v15_0 then
                    v19 = v24;
                    v20 = l_v15_0;
                end;
            end;
        end;
    end);
    return v19, v20;
end;
local v29 = {
    name = "_default", 
    min = math.huge, 
    max = 0
};
local function v35(v30, v31)
    local v34 = l_Array_0.find(v30, function(v32)
        local v33 = false;
        if type(v32) == "table" then
            v33 = false;
            if type(v32.breakpoint) == "string" then
                v33 = false;
                if v31 <= (v32.max or math.huge) then
                    v33 = (v32.min or 0) <= v31;
                end;
            end;
        end;
        return v33;
    end);
    if not v34 then
        return v29;
    else
        return {
            name = v34.breakpoint, 
            min = v34.min or 0, 
            max = v34.max or math.huge
        };
    end;
end;
local v37 = {
    [v1.strictInterface({
        Scale = v1.number, 
        Offset = v1.number
    })] = function(v36)
        return UDim.new(v36.Scale, v36.Offset);
    end
};
return {
    getValue = function(v38, v39)
        local l_config_0 = v38.config;
        local l_breakpoint_1 = v38.breakpoint;
        local l_kind_0 = v38.kind;
        local v43 = l_config_0[v39];
        local v44 = v43 ~= nil and 0 or -1;
        local l_forEach_0 = l_Array_0.forEach;
        local l_l_config_0_0 = l_config_0;
        local v47 = 0;
        local v48;
        do
            local l_v43_0, l_v44_0 = v43, v44;
            l_forEach_0(l_l_config_0_0, function(v51)
                local l_l_breakpoint_1_0 = l_breakpoint_1;
                local l_breakpoint_2 = v51.breakpoint;
                local v54;
                if not l_l_breakpoint_1_0 or not l_breakpoint_2 then
                    v54 = true;
                elseif typeof(l_breakpoint_2) == "table" then
                    for _, v56 in l_breakpoint_2, nil, nil do
                        if v56 == l_l_breakpoint_1_0 then
                            v54 = true;
                            goto label2 --[[  true, false  ]];
                        end;
                    end;
                    v54 = false;
                else
                    v54 = l_breakpoint_2 == l_l_breakpoint_1_0;
                end;
                ::label2::;
                if v54 then
                    l_l_breakpoint_1_0 = l_kind_0;
                    l_breakpoint_2 = v51.kind;
                    if not l_l_breakpoint_1_0 or not l_breakpoint_2 then
                        v54 = true;
                    elseif typeof(l_breakpoint_2) == "table" then
                        for _, v58 in l_breakpoint_2, nil, nil do
                            if v58 == l_l_breakpoint_1_0 then
                                v54 = true;
                                goto label3 --[[  true, false  ]];
                            end;
                        end;
                        v54 = false;
                    else
                        v54 = l_breakpoint_2 == l_l_breakpoint_1_0;
                    end;
                    ::label3::;
                    if v54 then
                        v54, l_l_breakpoint_1_0 = v13(v51, l_breakpoint_1, l_kind_0, v39, v47 + 1);
                        if l_v44_0 < l_l_breakpoint_1_0 then
                            l_v43_0 = v54;
                            l_v44_0 = l_l_breakpoint_1_0;
                        end;
                    end;
                end;
            end);
            v48 = l_v43_0;
            local _ = l_v44_0;
        end;
        for v60, v61 in v37, nil, nil do
            if v60(v48) then
                return v61(v48);
            end;
        end;
        return v48;
    end, 
    findBreakpoint = v35
};
