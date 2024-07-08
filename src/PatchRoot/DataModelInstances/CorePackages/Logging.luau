local _ = game:DefineFastFlag("LoggingRethrowUsingError", false);
local function _()
    return game:GetFastFlag("LoggingRethrowUsingError");
end;
local v2 = true;
local v3 = {};
local function v6()
    local v4 = {
        warnings = {}
    };
    setmetatable(v4, {
        __tostring = function(v5)
            return ("LogInfo\n\tWarnings (%d):\n\t\t%s"):format(#v5.warnings, table.concat(v5.warnings, "\n\t\t"));
        end
    });
    return v4;
end;
return {
    capture = function(v7)
        local v8 = v6();
        local l_v2_0 = v2;
        v2 = false;
        v3[v8] = true;
        local l_status_0, l_result_0 = pcall(v7);
        v3[v8] = nil;
        v2 = l_v2_0;
        if not game:GetFastFlag("LoggingRethrowUsingError") then
            assert(l_status_0, l_result_0);
        elseif not l_status_0 then
            error(l_result_0);
            return v8;
        end;
        return v8;
    end, 
    warn = function(v12)
        for v13 in pairs(v3) do
            table.insert(v13.warnings, v12);
        end;
        if v2 then
            warn(v12);
        end;
    end
};
