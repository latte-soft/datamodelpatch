local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(script.Parent.useProfileInsightsFetch);
local v5 = require(script.Parent.useMatchSearchPagination);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local _ = require(l_Parent_0.GraphQLServer);
local function v11(v8)
    return v3.reduce(v8, function(v9, v10)
        v9[v10.targetUserId] = v10;
        return v9;
    end, {});
end;
return function(v12)
    local v13 = v5({
        users = v12.users or {}
    });
    local v15 = v4(v2.useMemo(function()
        return v3.map(v13, function(v14)
            return v14.id;
        end);
    end, {
        v13
    }), v12.searchKeyword);
    local v16 = if not not v15.data and v15.data.profilesInsights then v15.data.profilesInsights.profileInsights else {};
    return (v2.useMemo(function()
        return v11(v16);
    end, {
        v16
    }));
end;
