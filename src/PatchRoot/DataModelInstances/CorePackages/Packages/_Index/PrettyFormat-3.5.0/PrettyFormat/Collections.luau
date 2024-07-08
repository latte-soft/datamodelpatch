local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Object_0 = v1.Object;
local l_Array_0 = v1.Array;
local _ = require(l_Parent_0.Types);
return {
    printTableEntries = function(v5, v6, v7, v8, v9, v10, v11)
        local v12 = v11 or ": ";
        local v13 = "";
        local v16 = l_Array_0.sort(l_Object_0.keys(v5), if v6.compareKeys ~= nil and v6.compareKeys ~= l_Object_0.None then v6.compareKeys else function(v14, v15)
            if type(v14) .. tostring(v14) < type(v15) .. tostring(v15) then
                return -1;
            elseif type(v14) .. tostring(v14) == type(v15) .. tostring(v15) then
                return 0;
            else
                return 1;
            end;
        end);
        if #v16 > 0 then
            v13 = v13 .. v6.spacingOuter;
            local v17 = v7 .. v6.indent;
            for v18 = 1, #v16 do
                local v19 = v16[v18];
                v13 = v13 .. v17 .. v10(v19, v6, v17, v8, v9) .. v12 .. v10(v5[v19], v6, v17, v8, v9);
                if v18 < #v16 then
                    v13 = v13 .. (",%s"):format((tostring(v6.spacingInner)));
                elseif not v6.min then
                    v13 = v13 .. ",";
                end;
            end;
            v13 = v13 .. v6.spacingOuter .. v7;
        end;
        return v13;
    end, 
    printMapEntries = function(v20, v21, v22, v23, v24, v25, v26)
        local v27 = v26 or " => ";
        local v28 = "";
        local v31 = l_Array_0.sort(l_Object_0.keys(v20), if v21.compareKeys ~= nil and v21.compareKeys ~= l_Object_0.None then v21.compareKeys else function(v29, v30)
            if type(v29) .. tostring(v29) < type(v30) .. tostring(v30) then
                return -1;
            elseif type(v29) .. tostring(v29) == type(v30) .. tostring(v30) then
                return 0;
            else
                return 1;
            end;
        end);
        if #v31 > 0 then
            v28 = v28 .. v21.spacingOuter;
            local v32 = v22 .. v21.indent;
            for v33 = 1, #v31 do
                local v34 = v31[v33];
                local v35 = v20[v34];
                v28 = v28 .. v32;
                if v33 == v21.maxWidth + 1 then
                    v28 = v28 .. "\226\128\166";
                    break;
                else
                    v28 = v28 .. v25(v34, v21, v32, v23, v24) .. v27 .. v25(v35, v21, v32, v23, v24);
                    if v33 < #v31 then
                        v28 = v28 .. (",%s"):format((tostring(v21.spacingInner)));
                    elseif not v21.min then
                        v28 = v28 .. ",";
                    end;
                end;
            end;
            v28 = v28 .. v21.spacingOuter .. v22;
        end;
        return v28;
    end, 
    printListItems = function(v36, v37, v38, v39, v40, v41)
        local v42 = "";
        if #v36 > 0 then
            v42 = v42 .. v37.spacingOuter;
            local v43 = v38 .. v37.indent;
            for v44 = 1, #v36 do
                v42 = v42 .. v43;
                if v44 == v37.maxWidth + 1 then
                    v42 = v42 .. "\226\128\166";
                    break;
                else
                    if v36[v44] ~= nil then
                        v42 = v42 .. v41(v36[v44], v37, v43, v39, v40);
                    end;
                    if v44 < #v36 then
                        v42 = v42 .. (",%s"):format((tostring(v37.spacingInner)));
                    elseif not v37.min then
                        v42 = v42 .. ",";
                    end;
                end;
            end;
            v42 = v42 .. v37.spacingOuter .. v38;
        end;
        return v42;
    end
};
