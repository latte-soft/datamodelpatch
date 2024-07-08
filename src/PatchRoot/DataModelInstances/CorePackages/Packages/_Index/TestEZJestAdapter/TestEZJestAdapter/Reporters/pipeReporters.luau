local _ = require(script.Parent.Parent.Parent.LuauPolyfill);
return function(v1)
    return {
        report = function(...)
            for _, v3 in ipairs(v1) do
                v3.report(...);
            end;
        end
    };
end;
