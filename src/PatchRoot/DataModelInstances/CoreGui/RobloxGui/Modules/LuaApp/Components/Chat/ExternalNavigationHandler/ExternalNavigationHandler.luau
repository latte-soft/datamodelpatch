local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.React);
local v2 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_memo_0 = v1.memo;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_usePrevious_0 = v2.Hooks.usePrevious;
ExternalNavigationHandler = function(v8)
    local function _()
        local v9 = false;
        if v8.requestId ~= v8.completedRequestId then
            v9 = v8.screen;
        end;
        return v9;
    end;
    local v11 = l_useRef_0({});
    local function v15()
        local l_screen_0 = v8.screen;
        local v13 = v8.navigationByScreen[l_screen_0];
        if not v13 then
            assert(v11.current, "Queue for ExternalNavigationHandler can't be nil");
            local v14 = v11.current[l_screen_0] or {};
            table.insert(v14, v8.params);
            v11.current[l_screen_0] = v14;
        else
            v13(v8.params);
        end;
        v8.completeExternalNavigation(v8.requestId);
    end;
    l_useEffect_0(function()
        local v16 = false;
        if v8.requestId ~= v8.completedRequestId then
            v16 = v8.screen;
        end;
        if v16 then
            v15();
        end;
    end, l_dependencyArray_0(v8.requestId, v8.completedRequestId, v8.screen));
    local v17 = l_usePrevious_0(v8.navigationByScreen);
    l_useEffect_0(function()
        assert(v11.current, "Queue for ExternalNavigationHandler can't be nil");
        if v17 == nil then
            return ;
        else
            for v18, v19 in pairs(v11.current) do
                assert(v17, "");
                local v20 = v17[v18];
                local v21 = v8.navigationByScreen[v18];
                if not (not (v20 ~= v21) or not v21) then
                    for _, v23 in ipairs(v19) do
                        v21(v23);
                    end;
                    v11.current[v18] = nil;
                end;
            end;
            return ;
        end;
    end, l_dependencyArray_0(v8.navigationByScreen));
    return nil;
end;
return l_memo_0(ExternalNavigationHandler);
