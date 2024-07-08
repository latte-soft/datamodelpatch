local l_Parent_0 = script.Parent;
return {
    setup = function(v1)
        _G.__DEV__ = true;
        _G.__DEBUG__ = v1 or false;
        _G.__PROFILE__ = true;
        _G.__EXPERIMENTAL__ = true;
        _G.__REACT_DEVTOOLS_COMPONENT_FILTERS__ = {};
        local v2 = require(l_Parent_0.ReactDevtoolsShared);
        local l_setup_0 = require(l_Parent_0.ReactDevtoolsExtensions.backend).setup;
        local l_installHook_0 = v2.hook.installHook;
        local l_store_0 = v2.devtools.store;
        l_installHook_0(_G);
        require(l_Parent_0.React);
        require(l_Parent_0.ReactRoblox);
        local l___REACT_DEVTOOLS_GLOBAL_HOOK___0 = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__;
        if not require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler then
            warn("[DeveloperTools] React was initialized before DeveloperTools. Call inspector.setupReactDevtools before requiring React to enable profiling.");
        end;
        local v7 = l_setup_0(l___REACT_DEVTOOLS_GLOBAL_HOOK___0);
        return {
            agent = v7.agent, 
            bridge = v7.bridge, 
            hook = v7.hook, 
            store = l_store_0.new(v7.bridge)
        };
    end
};
