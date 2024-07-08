local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.append);
local v3 = require(l_Parent_0.assign);
local v4 = require(l_Parent_0.cycles);
local v5 = require(l_Parent_0.includes);
local v6 = require(l_Parent_0.join);
local v7 = require(l_Parent_0.map);
local v8 = require(l_Parent_0.keys);
local v9 = require(l_Parent_0.slice);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
local l_sort_0 = table.sort;
local function _(v13, v14)
    return v7(v13, function(v15)
        return v14 .. v15;
    end);
end;
local v17 = nil;
local function v18(v19, v20)
    v20 = v20 or {};
    if type(v19) == "table" then
        local v21 = v3({
            visited = {}, 
            indent = "\t", 
            depth = 2
        }, v20, {
            depth = not not v20.depth and v20.depth - 1 or nil, 
            cycles = v20.cycles or v4(v19, v20.depth, {
                visited = {}, 
                refs = {}, 
                nextRef = 0, 
                depth = v20.depth, 
                omit = v20.omit or {}
            })
        });
        if v21.depth == -1 then
            return {
                "..."
            };
        elseif not v21.visited[v19] then
            v21.visited[v19] = true;
            local v22 = not v21.multiline and ", " or ",";
            local v23 = v21.cycles.refs[v19];
            local v24 = {
                (not not v23 and ("<%s>"):format(v23) or "") .. "{"
            };
            local v25 = v6(v21, {
                noQuotes = true, 
                multiline = false
            });
            local v26 = 0;
            local v27 = true;
            for v28, v29 in ipairs(v19) do
                if not (v21.omit and v5(v21.omit, v28)) then
                    if not v27 then
                        v24[#v24] = v24[#v24] .. v22;
                    else
                        v27 = false;
                    end;
                    if not v21.multiline then
                        v24[#v24] = v24[#v24] .. v17(v29, v21);
                    else
                        local v30 = v18(v29, v21);
                        local l_indent_0 = v21.indent;
                        v2(v24, (v7(v30, function(v32)
                            return l_indent_0 .. v32;
                        end)));
                    end;
                    v26 = v28;
                end;
            end;
            if not (not (#v19 > 0) or not v21.arrayLength) then
                v24[1] = ("#%d %s"):format(#v19, v24[1]);
            end;
            local v33 = v8(v19);
            l_sort_0(v33, function(v34, v35)
                if typeof(v34) == "number" and typeof(v35) == "number" then
                    return v34 < v35;
                else
                    return tostring(v34) < tostring(v35);
                end;
            end);
            for _, v37 in ipairs(v33) do
                local v38 = v19[v37];
                if not (not (not ((typeof(v37) == "number" and v37 % 1 == 0) and v37 >= 1) or v37 > v26) or v21.omit and v5(v21.omit, v37)) then
                    if not v27 then
                        v24[#v24] = v24[#v24] .. v22;
                    else
                        v27 = false;
                    end;
                    if not v21.multiline then
                        v24[#v24] = ("%s%s = %s"):format(v24[#v24], v17(v37, v25), v17(v38, v21));
                    else
                        local v39 = v18(v37, v25);
                        local l_indent_1 = v21.indent;
                        local l_l_indent_1_0 = l_indent_1 --[[ copy: 20 -> 24 ]];
                        local v43 = v7(v39, function(v42)
                            return l_l_indent_1_0 .. v42;
                        end);
                        l_indent_1 = v18(v38, v21);
                        local v44 = v9(l_indent_1, 2);
                        local l_indent_2 = v21.indent;
                        local v47 = v7(v44, function(v46)
                            return l_indent_2 .. v46;
                        end);
                        v43[#v43] = ("%s = %s"):format(v43[#v43], l_indent_1[1]);
                        v2(v24, v43);
                        v2(v24, v47);
                    end;
                end;
            end;
            if not v21.multiline then
                v24[#v24] = ("%s}"):format(v24[#v24]);
                return v24;
            elseif not v27 then
                l_insert_0(v24, "}");
                return v24;
            else
                v24[#v24] = v24[#v24] .. "}";
                return v24;
            end;
        else
            return {
                "&" .. v21.cycles.refs[v19]
            };
        end;
    elseif not (type(v19) == "string") or v20.noQuotes then
        return {
            (tostring(v19))
        };
    else
        return {
            ("\"%s\""):format(v19)
        };
    end;
end;
v17 = function(v48, v49)
    return l_concat_0(v18(v48, v49), "\n");
end;
return v17;
