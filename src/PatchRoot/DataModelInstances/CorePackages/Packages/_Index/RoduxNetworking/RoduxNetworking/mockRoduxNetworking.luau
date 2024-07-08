local v0 = require(script.Parent.makeActionCreator);
local function v4(v1)
    local v2 = v0(v1);
    local function v3()
    end;
    v2.API = function()
        return v2.Succeeded();
    end;
    v2.Mock = {
        reply = v3, 
        clear = v3, 
        replyWithError = v3
    };
    return v2;
end;
return function()
    return {
        GET = v4, 
        POST = v4, 
        PATCH = v4
    };
end;
