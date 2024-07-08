local v0 = require(script.Parent.Parent.Parent.Promise);
createFetch = function(v1)
    return function(v2, v3)
        if v3 == nil then
            v3 = {};
        end;
        local v4 = v3.method or "GET";
        v3.method = nil;
        v3.data = v3.body;
        v3.body = nil;
        return v1(v4, v2, v3):andThen(function(v5)
            local l_text_0 = v5.text;
            v5.text = function()
                return v0.resolve(l_text_0);
            end;
            v5.status = v5.code;
            return v5;
        end);
    end;
end;
return createFetch;
