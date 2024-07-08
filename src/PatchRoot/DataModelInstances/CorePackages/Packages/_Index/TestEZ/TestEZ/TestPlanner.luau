local v0 = require(script.Parent.TestPlan);
return {
    createPlan = function(v1, v2)
        local _ = nil;
        local v4 = v0.new(if type(v2) == "string" then {
            testNamePattern = v2
        } else v2);
        table.sort(v1, function(v5, v6)
            return v5.pathStringForSorting < v6.pathStringForSorting;
        end);
        for _, v8 in ipairs(v1) do
            v4:addRoot(v8.path, v8.method, v8.instance);
        end;
        return v4;
    end
};
