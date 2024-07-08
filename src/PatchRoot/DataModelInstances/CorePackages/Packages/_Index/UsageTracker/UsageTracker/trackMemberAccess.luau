local v0 = require(script:FindFirstAncestor("UsageTracker").Parent.Cryo);
local v1 = require(script.Parent.isReactComponent);
local v2 = require(script.Parent.UsageGraph);
return function(v3, v4, v5)
    local v6 = {};
    local v7 = {};
    local v8 = v5 or v1;
    local function v9(v10, v11)
        local v12 = {};
        local v13 = {};
        for v14, v15 in v11, nil, nil do
            if v14 ~= "__index" and typeof(v14) == "string" then
                local v16 = v10 .. "." .. v14;
                if not v8(v15) then
                    if not (typeof(v15) == "table") or v7[v15] then
                        v13[v14] = v15;
                    else
                        v13[v14] = v9(v16, v15);
                    end;
                else
                    v6[v16] = {};
                    v12[v14] = v15;
                end;
                v7[v15] = true;
            end;
        end;
        return (setmetatable(v13, {
            __index = function(_, v18)
                local v19 = v12[v18];
                if v19 then
                    local v20 = v10 .. "." .. v18;
                    local v21, v22 = debug.info(2, "sl");
                    v6[v20] = v0.List.join(v6[v20], {
                        {
                            dmPath = v21, 
                            lineNumber = v22
                        }
                    });
                    return v19;
                else
                    return (rawget(v13, v18));
                end;
            end
        }));
    end;
    local v23 = v9(v3, v4);
    v23[v2.UsageGraphKey] = v6;
    return v23;
end;
