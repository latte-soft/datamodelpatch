local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.RobloxShared);
local _ = require(l_Parent_0.LuauPolyfill);
return {
    equals = v1.expect.equals, 
    isA = v1.expect.isA, 
    fnNameFor = function(_)
        return "[Function]";
    end, 
    isUndefined = function(v4)
        return v4 == nil;
    end, 
    getPrototype = function(v5)
        if getmetatable(v5) ~= nil then
            return getmetatable(v5).__index;
        else
            return nil;
        end;
    end, 
    hasProperty = function(v6, v7)
        if v6 then
            local l_status_0, l_result_0 = pcall(function()
                return v6[v7];
            end);
            if not l_status_0 then
                error(l_result_0);
                return ;
            else
                return l_result_0 ~= nil;
            end;
        else
            return false;
        end;
    end
};
