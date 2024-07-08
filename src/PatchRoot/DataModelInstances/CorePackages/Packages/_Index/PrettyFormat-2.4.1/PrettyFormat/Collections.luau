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
                    v13 = v13 .. "," .. v6.spacingInner;
                elseif not v6.min then
                    v13 = v13 .. ",";
                end;
            end;
            v13 = v13 .. v6.spacingOuter .. v7;
        end;
        return v13;
    end, 
    printListItems = function(v20, v21, v22, v23, v24, v25)
        local v26 = "";
        if #v20 > 0 then
            v26 = v26 .. v21.spacingOuter;
            local v27 = v22 .. v21.indent;
            for v28 = 1, #v20 do
                v26 = v26 .. v27;
                if v20[v28] ~= nil then
                    v26 = v26 .. v25(v20[v28], v21, v27, v23, v24);
                end;
                if v28 < #v20 then
                    v26 = v26 .. "," .. v21.spacingInner;
                elseif not v21.min then
                    v26 = v26 .. ",";
                end;
            end;
            v26 = v26 .. v21.spacingOuter .. v22;
        end;
        return v26;
    end
};
