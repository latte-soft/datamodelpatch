local v0 = require(script.Parent.Parent.Parent.Promise);
local l_getSetTimeoutFn_0 = require(script.helpers).getSetTimeoutFn;
local v2 = {
    timeout = 5000, 
    interval = 50
};
return function(v3, v4, v5)
    local v6 = v4 or v2.timeout;
    local v7 = v5 or v2.interval;
    local v8 = l_getSetTimeoutFn_0();
    if v7 < 50 then
        v7 = 50;
    end;
    local v9 = math.ceil(v6 / v7);
    local v10 = 0;
    return v0.new(function(v11, v12)
        local v13 = nil;
        local v14 = nil;
        v13 = function(v15)
            if v9 < v10 then
                v12(v15);
                return ;
            else
                v8(v14, v7);
                return ;
            end;
        end;
        v14 = function()
            v10 = v10 + 1;
            xpcall(function()
                v0.delay(0):andThen(function()
                    return v3();
                end):andThen(function()
                    return v0.delay(0);
                end):andThen(function()
                    return v11();
                end):catch(v13);
            end, function(v16)
                v13(v16);
            end);
        end;
        v8(v14, 50);
    end);
end;
