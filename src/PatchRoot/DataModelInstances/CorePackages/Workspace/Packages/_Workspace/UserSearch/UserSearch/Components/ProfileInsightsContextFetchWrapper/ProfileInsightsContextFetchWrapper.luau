local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local _ = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(script.Parent.usePaginatedProfileInsightsFetch);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
return function(v4)
    return v4.renderComponent(v2({
        users = v4.users or {}, 
        searchKeyword = v4.searchParameters.searchKeyword
    }) or {});
end;
