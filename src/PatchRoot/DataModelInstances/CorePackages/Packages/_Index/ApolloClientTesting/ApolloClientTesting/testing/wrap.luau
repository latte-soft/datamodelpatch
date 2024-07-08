local l_Parent_0 = script.Parent.Parent.Parent;
local l_expect_0 = require(l_Parent_0.JestGlobals).expect;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local _ = require(l_Parent_0.LuauRegExp);
return {
    default = function(v4, v5)
        return function(...)
            local v6 = {
                ...
            };
            local l_status_0, l_result_0 = pcall(function()
                return v5(table.unpack(v6));
            end);
            if not l_status_0 then
                v4(l_result_0);
            end;
            return l_result_0;
        end;
    end, 
    withError = function(v9, v10)
        local v11 = nil;
        local l_error_0 = l_console_0.error;
        l_console_0.error = function(v13)
            v11 = v13;
            return v11;
        end;
        local l_status_1, l_result_1 = pcall(function()
            local v14 = v9();
            l_expect_0(v11).toMatch(v10);
            return v14;
        end);
        l_console_0.error = l_error_0;
        if not l_status_1 then
            error(l_result_1);
        end;
        return l_result_1;
    end
};
