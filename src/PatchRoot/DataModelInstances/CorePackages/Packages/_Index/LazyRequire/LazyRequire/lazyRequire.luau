return function(v0)
    local v1 = {};
    local v2 = nil;
    local function _()
        if not v2 then
            v2 = require(v0);
            return v2;
        else
            return v2;
        end;
    end;
    setmetatable(v1, {
        __index = function(_, v5)
            local v6;
            if not v2 then
                v2 = require(v0);
                v6 = v2;
            else
                v6 = v2;
            end;
            return v6[v5];
        end, 
        __newindex = function(_, v8, v9)
            local v10;
            if not v2 then
                v2 = require(v0);
                v10 = v2;
            else
                v10 = v2;
            end;
            v10[v8] = v9;
        end, 
        __call = function(_, ...)
            local v12;
            if not v2 then
                v2 = require(v0);
                v12 = v2;
            else
                v12 = v2;
            end;
            return v12(...);
        end, 
        __len = function(_)
            local v14;
            if not v2 then
                v2 = require(v0);
                v14 = v2;
            else
                v14 = v2;
            end;
            return #v14;
        end, 
        __iter = function(_)
            local l_next_0 = next;
            if not v2 then
                v2 = require(v0);
                return l_next_0, v2;
            else
                return l_next_0, v2;
            end;
        end, 
        __mode = "kv"
    });
    return v1;
end;
