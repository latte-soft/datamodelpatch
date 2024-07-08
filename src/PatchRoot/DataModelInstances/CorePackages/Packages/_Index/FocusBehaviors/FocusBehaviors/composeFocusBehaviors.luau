local _ = require(script.Parent.Parent.FocusNavigation);
return function(...)
    local v1 = {
        ...
    };
    return {
        onDescendantFocusChanged = function(v2)
            for _, v4 in v1, nil, nil do
                if v4.onDescendantFocusChanged then
                    v4.onDescendantFocusChanged(v2);
                end;
            end;
        end, 
        getTargets = function()
            local v5 = {};
            for _, v7 in v1, nil, nil do
                for _, v9 in (v7.getTargets()), nil, nil do
                    table.insert(v5, v9);
                end;
            end;
            return v5;
        end
    };
end;
