local v0 = require(script.Parent.LuauPolyfill);
local l_Array_0 = v0.Array;
local l_String_0 = v0.String;
local l_toJSBoolean_0 = v0.Boolean.toJSBoolean;
local _ = nil;
local v5 = nil;
local function v7(v6)
    return l_String_0.trim(v6 or "");
end;
local function _(v8)
    if not v8:find("%s*at.*%(?:%d*:%d*%)?") and not v8:find("%s*at.*%(?native%)?") then
        return v8;
    else
        return v7(v8);
    end;
end;
local function v14(v10, v11)
    local v12 = 0;
    return l_Array_0.filter(v10, function(v13)
        if not v13:find("^%s+at <anonymous>.*$") then
            if not v13:find("^%s+at Promise %(<anonymous>%).*$") and not v13:find("^%s+at new Promise %(<anonymous>%).*$") then
                if not v13:find("^%s+at Generator.next %(<anonymous>%).*$") then
                    if not v13:find("^%s+at next %(native%).*$") then
                        if v13:find("%s*at.*%(?:%d*:%d*%)?") and v13:find("%s*at.*%(?native%)?") then
                            if not v13:find("%s+at(.jasmine%-)") and not v13:find("%s+at(%s+jasmine%.buildExpectationResult)") then
                                v12 = v12 + 1;
                                if v12 == 1 then
                                    return true;
                                elseif not v11.noStackTrace then
                                    return true;
                                else
                                    return false;
                                end;
                            else
                                return false;
                            end;
                        else
                            return true;
                        end;
                    else
                        return false;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    end);
end;
local _ = function(_, _, v17)
    return v17;
end;
v5 = function(v19, v20)
    if v20 == nil then
        v20 = {
            noCodeFrame = false, 
            noStackTrace = false
        };
    end;
    return v14(string.split(v19, "\n"), v20);
end;
return {
    formatStackTrace = function(v21, v22, v23, v24)
        local v25 = v5(v21, v23);
        local v26 = nil;
        if v24 then
            v26 = "unsupported";
        end;
        return string.format("\n%s", (table.concat(l_Array_0.map(l_Array_0.filter(v25, l_toJSBoolean_0), function(v27)
            local v28 = "      ";
            local _ = v22;
            local _ = v26;
            return v28 .. if v27:find("%s*at.*%(?:%d*:%d*%)?") or v27:find("%s*at.*%(?native%)?") then l_String_0.trim(v27 or "") else v27;
        end), "\n")));
    end, 
    getStackTraceLines = v5
};
