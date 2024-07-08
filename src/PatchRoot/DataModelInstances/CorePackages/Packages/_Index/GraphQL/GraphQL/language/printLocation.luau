local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_String_0 = v1.String;
local l_getLocation_0 = require(l_Parent_0.location).getLocation;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local function v10(v9)
    return v7(v9.source, l_getLocation_0(v9.source, v9.start));
end;
v7 = function(v11, v12)
    local v13 = v11.locationOffset.column - 1;
    local v14 = v5(v13) .. v11.body;
    local v15 = (v12.line - 1) + 1;
    local v16 = v12.line + (v11.locationOffset.line - 1);
    local v17 = v12.column + (v12.line == 1 and v13 or 0);
    local v18 = v11.name .. ":" .. v16 .. ":" .. v17 .. "\n";
    local v19 = l_String_0.split(v14, {
        "\r\n", 
        "\n", 
        "\r"
    });
    local v20 = v19[v15];
    if string.len(v20) > 120 then
        local v21 = math.floor(v17 / 80) + 1;
        local v22 = v17 % 80;
        local v23 = {};
        for v24 = 1, string.len(v20), 80 do
            table.insert(v23, l_String_0.slice(v20, v24, v24 + 80));
        end;
        return v18 .. v8(l_Array_0.concat({
            {
                tostring(v16), 
                v23[1]
            }
        }, l_Array_0.map(l_Array_0.slice(v23, 2, v21 + 1), function(v25)
            return {
                "", 
                v25
            };
        end), {
            {
                " ", 
                v5(v22 - 1) .. "^"
            }
        }, {
            {
                "", 
                v23[v21 + 1]
            }
        }));
    else
        return v18 .. v8({
            {
                v16 - 1, 
                v19[v15 - 1]
            }, 
            {
                v16, 
                v20
            }, 
            {
                "", 
                v5(v17 - 1) .. "^"
            }, 
            {
                v16 + 1, 
                v19[v15 + 1]
            }
        });
    end;
end;
v8 = function(v26)
    local v28 = l_Array_0.filter(v26, function(v27)
        return v27[2] ~= nil;
    end);
    local v30 = math.max(table.unpack(l_Array_0.map(v28, function(v29)
        return (string.len(v29[1]));
    end)));
    return l_Array_0.join(l_Array_0.map(v28, function(v31)
        local v32 = v31[1];
        local v33 = v31[2];
        return v6(v30, v32) .. ((not not v33 and v33 ~= "") and " | " .. v33 or " |");
    end), "\n");
end;
v5 = function(v34)
    return string.rep(" ", v34);
end;
v6 = function(v35, v36)
    return v5(v35 - string.len(v36)) .. v36;
end;
return {
    printSourceLocation = v7, 
    printLocation = v10
};
