local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.HttpServiceMock);
local v2 = require(l_Parent_0.Expect);
local v3 = require(l_Parent_0.JestDiff);
local function v4()
    return true;
end;
local function v6(v5)
    return v5;
end;
local v7 = {};
local v8 = {
    __index = v7
};
v7.fromFilter = function(v9)
    return (setmetatable({
        name = "Anonymous matcher", 
        _filter = v9
    }, v8));
end;
v7.all = function()
    return v7.fromFilter(v4);
end;
v7.matching = function(v10)
    local v11 = v2.objectContaining(v10);
    v11.getExpectedType = function(_)
        return "table";
    end;
    return v7.fromFilter(function(v13)
        if not v11:asymmetricMatch(v13) then
            return false, v3.diff(v11, v13, {
                aAnnotation = "Expected a request that matches", 
                aColor = v6, 
                aIndicator = "-", 
                bAnnotation = "Received request", 
                bColor = v6, 
                bIndicator = "+", 
                changeColor = v6, 
                changeLineTrailingSpaceColor = v6, 
                commonColor = v6, 
                commonLineTrailingSpaceColor = v6, 
                patchColor = v6
            });
        else
            return true;
        end;
    end);
end;
v7.matches = function(v14, v15)
    local v16, v17 = v14._filter(v15);
    if not v16 then
        return {
            success = v16, 
            reason = v17
        };
    else
        return {
            success = v16
        };
    end;
end;
return v7;
