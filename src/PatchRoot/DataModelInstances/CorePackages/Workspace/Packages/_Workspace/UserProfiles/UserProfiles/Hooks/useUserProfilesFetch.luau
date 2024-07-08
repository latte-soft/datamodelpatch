local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserProfiles");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_script_FirstAncestor_0.Analytics.setupFireDiag);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v6 = require(l_script_FirstAncestor_0.Analytics.UserProfilesAnalytics);
local v7 = require(l_Parent_0.SocialCommon);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useApolloAutoRetry_0 = v7.Hooks.useApolloAutoRetry;
local l_useEffectOnce_0 = v3.Hooks.useEffectOnce;
local l_useEffectOnMount_0 = v3.Hooks.useEffectOnMount;
local l_useQuery_0 = require(l_Parent_0.ApolloClient).useQuery;
local v13 = game:DefineFastFlag("UserProfilesEnableRetries", false);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfilesLogCancelledRequests);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfilesLogErrorCodes);
local v16 = game:DefineFastInt("UserProfileDefaultRetryCount", 2);
return function(v17)
    local v18 = l_useQuery_0(v17.query, {
        errorPolicy = "all", 
        variables = {
            userIds = v17.userIds
        }
    });
    local l_v18_0 = v18;
    if v13 then
        l_v18_0 = l_useApolloAutoRetry_0(v18, {
            retryCount = if not v17.overrideRetryCount then v16 else v17.overrideRetryCount
        });
    end;
    local v20 = v2.useRef(l_v18_0.loading or l_v18_0.isRetrying);
    if v14 then
        v20.current = l_v18_0.loading or l_v18_0.isRetrying;
    end;
    local v21 = v2.useMemo(function()
        return v4({
            analytics = {
                Diag = v6.Diag
            }
        });
    end, {});
    local v22 = v2.useRef(DateTime.now());
    l_useEffectOnMount_0(function()
        v22.current = DateTime.now();
        v21(v5.UserProfilesRequestBegin);
    end);
    if v13 then
        l_useEffectOnce_0(function()
            local v23 = nil;
            if v22.current then
                v23 = DateTime.now().UnixTimestampMillis - v22.current.UnixTimestampMillis;
                v21(v5.UserProfilesRequestFail);
                v6.Diag:reportStats(v5.UserProfilesRequestFailDuration, v23);
                if v15 then
                    local v24 = l_getDeepValue_0(l_v18_0, "error.graphQLErrors");
                    if v24 then
                        v21(v5.UserProfilesErrorCode, {
                            status = l_getDeepValue_0(v24[1] or {}, "extensions.status")
                        });
                    end;
                end;
            end;
        end, l_v18_0.error);
        local l_l_useEffectOnce_0_0 = l_useEffectOnce_0;
        local function v28()
            local v26 = nil;
            if v22.current then
                v26 = DateTime.now().UnixTimestampMillis - v22.current.UnixTimestampMillis;
                if l_v18_0.data and l_v18_0.retryCount == 0 then
                    v21(v5.UserProfilesRequestSuccess);
                    v6.Diag:reportStats(v5.UserProfilesRequestSuccessDuration, v26);
                    return ;
                elseif not l_v18_0.data then
                    v21(v5.UserProfilesRequestFailAfterRetry);
                    v6.Diag:reportStats(v5.UserProfilesRequestFailAfterRetryDuration, v26);
                    if v15 then
                        local v27 = l_getDeepValue_0(l_v18_0, "error.graphQLErrors");
                        if v27 then
                            v21(v5.UserProfilesErrorCode, {
                                status = l_getDeepValue_0(v27[1] or {}, "extensions.status")
                            });
                        end;
                    end;
                else
                    v21(v5.UserProfilesRequestSuccessAfterRetry);
                    v6.Diag:reportStats(v5.UserProfilesRequestSuccessAfterRetry, v26);
                    return ;
                end;
            end;
        end;
        local v29;
        if not v14 then
            v29 = false;
            if l_v18_0.loading == false then
                v29 = l_v18_0.isRetrying == false;
            end;
        else
            v29 = not v20.current;
        end;
        l_l_useEffectOnce_0_0(v28, v29);
    end;
    if v14 then
        v2.useEffect(function()
            return function()
                if v20.current then
                    v21(v5.UserProfilesUnmountEarly);
                end;
            end;
        end, {});
    end;
    return l_v18_0;
end;
