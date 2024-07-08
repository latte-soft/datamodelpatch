game:DefineFastFlag("DebugLuaArgCheck", false);
local v0 = {
    isEnabled = function()
        return (game:GetFastFlag("DebugLuaArgCheck") or _G.__TESTEZ_RUNNING_TEST__) or game:GetService("RunService"):IsStudio();
    end
};
local function _(v1, v2)
    if v0.isEnabled() then
        assert(v1, v2);
    end;
end;
local function v4()
    return true;
end;
v0.wrap = function(v5)
    if not v0.isEnabled() then
        return v4;
    else
        return v5;
    end;
end;
v0.isNonNegativeNumber = function(v6, v7)
    local v8 = false;
    if typeof(v6) == "number" then
        v8 = v6 >= 0;
    end;
    local v9 = string.format("expects %s to be a non-negative number", v7);
    if v0.isEnabled() then
        assert(v8, v9);
    end;
    return v6;
end;
v0.isType = function(v10, v11, v12)
    local v13 = typeof(v10) == v11;
    local v14 = string.format("expects %s to be a %s %s", v12, v11, (typeof(v10)));
    if v0.isEnabled() then
        assert(v13, v14);
    end;
    return v10;
end;
v0.isInTypes = function(v15, v16, v17)
    for _, v19 in ipairs(v16) do
        if typeof(v15) == v19 then
            return v15;
        end;
    end;
    local v20 = string.format("expects %s to be one of expectedTypes %s", v17, (typeof(v15)));
    if v0.isEnabled() then
        assert(false, v20);
    end;
    return v15;
end;
v0.isTypeOrNil = function(v21, v22, v23)
    local v24 = true;
    if v21 ~= nil then
        v24 = typeof(v21) == v22;
    end;
    local v25 = string.format("expects %s to be a %s %s", v23, v22, (typeof(v21)));
    if v0.isEnabled() then
        assert(v24, v25);
    end;
    return v21;
end;
v0.isNotNil = function(v26, v27)
    local v28 = v26 ~= nil;
    local v29 = string.format("expects %s to be not nil", v27);
    if v0.isEnabled() then
        assert(v28, v29);
    end;
    return v26;
end;
v0.isNonEmptyString = function(v30, v31)
    local v32 = false;
    if typeof(v30) == "string" then
        v32 = v30 ~= "";
    end;
    local v33 = string.format("expects %s to be a non-empty string", v31);
    if v0.isEnabled() then
        assert(v32, v33);
    end;
    return v30;
end;
v0.isEqual = function(v34, v35, v36)
    local v37 = v34 == v35;
    local v38 = string.format("expects %s to equal %s %s", v36, tostring(v35), (tostring(v34)));
    if v0.isEnabled() then
        assert(v37, v38);
    end;
    return v34;
end;
v0.representsInteger = function(v39, v40)
    local v41 = tonumber(v39);
    local v42 = v41 ~= nil;
    local v43 = string.format("expects %s to represent a number", v40);
    if v0.isEnabled() then
        assert(v42, v43);
    end;
    v42 = v41 % 1 == 0;
    v43 = string.format("expects %s to represent an integer", v40);
    if v0.isEnabled() then
        assert(v42, v43);
    end;
    return v39;
end;
v0.matchesInterface = function(v44, v45, v46, v47)
    if v0.isEnabled() then
        local v48 = {
            integer = v0.representsInteger, 
            nonEmptyString = v0.isNonEmptyString
        };
        if type(v45) == "string" then
            if not v47 or not v47[v45] then
                local v49 = v48[v45];
                if type(v49) == "function" then
                    v49(v44, v46);
                    return v44;
                else
                    v0.isType(v44, v45, v46);
                    return v44;
                end;
            else
                v0.matchesInterface(v44, v47[v45], v46, v47);
                return v44;
            end;
        else
            v0.isType(v44, "table", v46);
            if v45[1] ~= nil then
                for v50, v51 in ipairs(v44) do
                    v0.matchesInterface(v51, v45[1], v46 .. "[" .. v50 .. "]", v47);
                end;
                return v44;
            else
                for v52, v53 in pairs(v45) do
                    if string.sub(v52, 1, 1) ~= "_" then
                        local v54 = v46 .. "." .. v52;
                        local v55 = v44[v52];
                        if v45._required and v45._required[v52] or v55 ~= nil then
                            v0.matchesInterface(v55, v53, v54, v47);
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v44;
end;
v0.assert = function(...)
    local v56, v57 = ...;
    if v0.isEnabled() then
        assert(v56, v57);
    end;
end;
return v0;
