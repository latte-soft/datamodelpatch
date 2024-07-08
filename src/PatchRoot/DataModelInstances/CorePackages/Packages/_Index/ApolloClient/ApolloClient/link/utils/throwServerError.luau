local l_Parent_0 = script.Parent.Parent.Parent;
local l_Error_0 = require(l_Parent_0.Parent.LuauPolyfill).Error;
local _ = require(l_Parent_0.luaUtils.Response);
return {
    throwServerError = function(v3, v4, v5)
        local v6 = l_Error_0.new(v5);
        v6.name = "ServerError";
        v6.response = v3;
        v6.statusCode = v3.status;
        v6.result = v4;
        error(v6);
    end
};
