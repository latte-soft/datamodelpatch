local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.StringSplit);
assertIsType = function(v2, v3, v4)
    if not (not l_RunService_0:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__) then
        assert(typeof(v2) == v3, string.format("expects %s to be a %s %s", v4, v3, (typeof(v2))));
    end;
end;
local function v7(v5)
    assertIsType(v5, "string", "input");
    return (string.gsub(string.gsub(v5, "%%(%x%x)", function(v6)
        return (string.char((tonumber(v6, 16))));
    end), "+", " "));
end;
return function(v8, v9)
    if v8 ~= nil then
        assertIsType(v8, "string", "input");
    end;
    if v9 ~= nil then
        assertIsType(v9, "function", "listKeyMapper");
    end;
    local v10 = type(v9) == "function";
    local v11 = {};
    if v8 and #v8 > 0 then
        for _, v13 in ipairs((v1(v8, "[&;]"))) do
            if v13 and #v13 > 0 then
                local v14, v15 = unpack(string.split(v13, "="));
                if v15 == nil then
                    v15 = "";
                end;
                v14 = v7(v14);
                v15 = v7(v15);
                if not v10 then
                    if v11[v14] == nil then
                        v11[v14] = {};
                    end;
                    table.insert(v11[v14], v15);
                elseif v11[v14] ~= nil then
                    local v16 = v9(v14);
                    if v16 == nil then
                        v16 = v14;
                    end;
                    if type(v11[v16]) ~= "table" then
                        v11[v16] = {
                            v11[v14]
                        };
                    end;
                    table.insert(v11[v16], v15);
                    if v14 ~= v16 then
                        v11[v14] = v15;
                    end;
                else
                    v11[v14] = v15;
                end;
            end;
        end;
    end;
    return v11;
end;
