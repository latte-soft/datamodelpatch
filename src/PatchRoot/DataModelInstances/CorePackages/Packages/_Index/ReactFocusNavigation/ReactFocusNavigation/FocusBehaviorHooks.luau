local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.FocusNavigation);
local v2 = require(l_Parent_0.FocusBehaviors);
local v3 = require(l_Parent_0.React);
local l_default_0 = v2.default;
local l_mostRecent_0 = v2.mostRecent;
local l_mostRecentOrDefault_0 = v2.mostRecentOrDefault;
local v7 = require(script.Parent.useContainerFocusBehavior);
return {
    useDefaultFocusBehavior = function(v8)
        local v9, v10 = v3.useState(nil);
        return v10, (v7(v3.useMemo(function()
            return l_default_0(v9);
        end, {
            v9
        }), v8));
    end, 
    useMostRecentFocusBehavior = function(v11)
        return v7(v3.useMemo(l_mostRecent_0, {}), v11);
    end, 
    useMostRecentOrDefaultFocusBehavior = function(v12)
        local v13, v14 = v3.useState(nil);
        return v14, (v7(v3.useMemo(function()
            return l_mostRecentOrDefault_0(v13);
        end, {
            v13
        }), v12));
    end
};
