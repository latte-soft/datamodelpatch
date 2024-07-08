local l_Parent_0 = script.Parent.Parent;
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v2 = require(l_Parent_0.Promise);
local v3 = {};
local _ = require(l_Parent_0.JestTypes);
v3.default = function(v5)
    return v2.resolve():andThen(function()
        local l_status_0, l_result_0 = pcall(require, v5);
        if not l_status_0 then
            error(l_Error_0.new(("Failed to load the Luau config file %s\n  %s"):format(tostring(v5), (tostring(l_result_0)))));
        end;
        local l_l_result_0_0 = l_result_0;
        if typeof(l_l_result_0_0) == "function" then
            l_l_result_0_0 = v2.resolve(l_l_result_0_0()):expect();
        end;
        if not l_l_result_0_0.rootDir or typeof(l_l_result_0_0.rootDir) ~= "Instance" then
            l_l_result_0_0.rootDir = v5.Parent;
        end;
        return l_l_result_0_0;
    end);
end;
return v3;
