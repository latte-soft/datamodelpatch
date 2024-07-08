local l_Writeable_0 = require(script.Parent.Writeable).Writeable;
local v1 = {
    stdout = l_Writeable_0.new(), 
    stderr = l_Writeable_0.new()
};
local function v3(v2)
    error(("Exited with code: %d"):format(v2));
end;
local l_HttpService_0 = game:GetService("HttpService");
return {
    process = v1, 
    exit = v3, 
    JSON = {
        stringify = function(v5, ...)
            if select("#", ...) > 0 then
                warn("JSON.stringify doesn't currently support more than 1 argument. All additional arguments will be ignored.");
            end;
            return l_HttpService_0:JSONEncode(v5);
        end, 
        parse = function(v6, ...)
            if select("#", ...) > 0 then
                warn("JSON.parse doesn't currently support more than 1 argument. All additional arguments will be ignored.");
            end;
            return l_HttpService_0:JSONDecode(v6);
        end
    }
};
