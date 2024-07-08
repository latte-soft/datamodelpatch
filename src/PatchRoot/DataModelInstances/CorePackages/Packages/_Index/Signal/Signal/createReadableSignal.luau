local v0 = require(script.Parent.createSignal);
return function(v1)
    local v2, v3 = v0();
    local l_v1_0 = v1;
    return {
        subscribe = function(_, v6)
            return v2:subscribe(v6);
        end, 
        getValue = function(_)
            return l_v1_0;
        end
    }, function(v8)
        l_v1_0 = v8;
        v3(v8);
    end;
end;
