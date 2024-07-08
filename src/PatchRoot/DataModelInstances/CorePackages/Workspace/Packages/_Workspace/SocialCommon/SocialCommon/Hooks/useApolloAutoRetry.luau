local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({});
local v4 = require(script.Parent.StatusCodesToRetry);
local function _(v5)
    if v5.error then
        local v6 = v3.Dictionary.getDeepValue(v5, "error.graphQLErrors");
        if not (not v6 or not v6[1]) then
            return v4[v3.Dictionary.getDeepValue(v6[1], "extensions.status")] or false;
        end;
    end;
    return false;
end;
return function(v8, v9)
    local v10, v11 = v1.useState(0);
    local v12, v13 = v1.useState(false);
    v1.useEffect(function()
        local l_v8_0 = v8;
        local v15;
        if l_v8_0.error then
            local v16 = v3.Dictionary.getDeepValue(l_v8_0, "error.graphQLErrors");
            if not (not v16 or not v16[1]) then
                v15 = v4[v3.Dictionary.getDeepValue(v16[1], "extensions.status")] or false;
                goto label0 --[[  true, true  ]];
            end;
        end;
        v15 = false;
        ::label0::;
        if not (not (v15 and v10 < v9.retryCount) or v12) then
            v13(true);
            task.delay(2 ^ v10 + math.random(), function()
                v8:refetch();
                v13(false);
                v11(v10 + 1);
            end);
        end;
    end, {
        v8, 
        v12, 
        v10
    });
    return (v1.useMemo(function()
        local l_join_0 = v2.Dictionary.join;
        local l_v8_1 = v8;
        local v19 = {};
        local l_v8_2 = v8;
        local v21;
        if l_v8_2.error then
            local v22 = v3.Dictionary.getDeepValue(l_v8_2, "error.graphQLErrors");
            if not (not v22 or not v22[1]) then
                v21 = v4[v3.Dictionary.getDeepValue(v22[1], "extensions.status")] or false;
                goto label1 --[[  true, true  ]];
            end;
        end;
        v21 = false;
        ::label1::;
        if v21 then
            v21 = v10 < v9.retryCount;
        end;
        v19.isRetrying = v21;
        v19.retryCount = v10;
        return l_join_0(l_v8_1, v19);
    end, {
        v8, 
        v10
    }));
end;
