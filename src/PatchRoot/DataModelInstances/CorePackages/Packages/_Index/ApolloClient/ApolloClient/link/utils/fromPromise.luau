local v0 = {};
local _ = require(script.Parent.Parent.Parent.Parent.LuauPolyfill);
local l_Observable_0 = require(script.Parent.Parent.Parent.utilities).Observable;
v0.fromPromise = function(v3)
    return l_Observable_0.new(function(v4)
        v3:andThen(function(v5)
            v4:next(v5);
            v4:complete();
        end):catch(function(v6)
            v4.error(v4, v6);
        end);
    end);
end;
return v0;
