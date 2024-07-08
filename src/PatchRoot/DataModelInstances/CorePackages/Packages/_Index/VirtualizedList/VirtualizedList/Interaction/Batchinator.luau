local v0 = require(script.Parent.Parent.Parent.LuauPolyfill);
local l_setTimeout_0 = v0.setTimeout;
local l_clearTimeout_0 = v0.clearTimeout;
local v5 = {
    runAfterInteractions = function(_, v4)
        v4();
        return nil;
    end
};
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8)
    local v9 = setmetatable({}, v6);
    v9._delay = v8;
    v9._callback = v7;
    return v9;
end;
v6.dispose = function(v10, v11)
    local v12 = v11 or {
        abort = false
    };
    if v10._taskHandle then
        v10._taskHandle.cancel();
        if not v12.abort then
            v10._callback();
        end;
        v10._taskHandle = nil;
    end;
end;
v6.schedule = function(v13)
    if not v13._taskHandle then
        local v14 = l_setTimeout_0(function()
            v13._taskHandle = v5:runAfterInteractions(function()
                v13._taskHandle = nil;
                v13._callback();
            end);
        end, v13._delay);
        v13._taskHandle = {
            cancel = function()
                return l_clearTimeout_0(v14);
            end
        };
        return ;
    else
        return ;
    end;
end;
return v6;
