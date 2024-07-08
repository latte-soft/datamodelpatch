local v0 = require(script.Parent.symbols);
return function(...)
    local v1 = {
        ...
    };
    assert(#v1 > 1, "Mock Error: tuple only accepts more than 1 value.");
    return (setmetatable({
        [v0.isTuple] = true, 
        values = v1
    }, {
        __tostring = function(_)
            local v3 = {};
            for _, v5 in ipairs(v1) do
                table.insert(v3, (tostring(v5)));
            end;
            return "<Tuple values=[" .. table.concat(v3, ", ") .. "]>";
        end
    }));
end;
