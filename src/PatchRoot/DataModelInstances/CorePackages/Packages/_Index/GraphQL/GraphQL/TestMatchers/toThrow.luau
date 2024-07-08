return function(v0, v1, v2)
    local l_status_0, l_result_0 = pcall(v0);
    if l_status_0 then
        return {
            pass = false, 
            message = "Expected function to throw"
        };
    elseif typeof(v1) == "string" then
        local v5 = nil;
        if typeof(l_result_0) == "string" then
            v5 = l_result_0;
        elseif typeof(l_result_0) == "table" and typeof(l_result_0.message) == "string" then
            v5 = l_result_0.message;
        end;
        if v5 == nil then
            return {
                pass = false, 
                message = string.format("Matcher Error:\n" .. "Expected function to throw a string or an Error " .. "object, but it threw an error of type '%s'.\nYou " .. "may wish to use `pcall` instead and run custom " .. "expectations on the returned error", (typeof(l_result_0)))
            };
        elseif v5:find(v1, 1, not v2) ~= nil then
            return {
                pass = true, 
                message = string.format("Expected function not to throw with '%s'", v1)
            };
        else
            return {
                pass = false, 
                message = string.format("Expected function to throw with\n'%s'\nbut threw\n'%s'\ninstead", v1, v5)
            };
        end;
    else
        return {
            pass = true, 
            message = "Expected function not to throw"
        };
    end;
end;
