local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local _ = require(l_Parent_0.ReactReconciler);
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.ReactReconciler);
local v5 = require(script.Parent.ReactRobloxComponentTree);
local l_markContainerAsRoot_0 = v5.markContainerAsRoot;
local l_unmarkContainerAsRoot_0 = v5.unmarkContainerAsRoot;
local v8 = require(script.Parent.Parent["ReactReconciler.roblox"]);
local l_createContainer_0 = v8.createContainer;
local l_updateContainer_0 = v8.updateContainer;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableEagerRootListeners_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableEagerRootListeners;
local l_BlockingRoot_0 = v8.ReactRootTags.BlockingRoot;
local l_ConcurrentRoot_0 = v8.ReactRootTags.ConcurrentRoot;
local l_LegacyRoot_0 = v8.ReactRootTags.LegacyRoot;
local v16 = nil;
local v17 = {};
v17.__index = v17;
v17.new = function(v18, v19)
    local v20 = setmetatable({}, v17);
    v20._internalRoot = v16(v18, l_ConcurrentRoot_0, v19);
    return v20;
end;
local function _(v21, v22, v23)
    local v24 = setmetatable({}, v17);
    v24._internalRoot = v16(v21, v22, v23);
    return v24;
end;
v17.render = function(v26, v27)
    l_updateContainer_0(v27, v26._internalRoot, nil);
end;
v17.unmount = function(v28)
    local l__internalRoot_0 = v28._internalRoot;
    local l_containerInfo_0 = l__internalRoot_0.containerInfo;
    l_updateContainer_0(nil, l__internalRoot_0, nil, function()
        l_unmarkContainerAsRoot_0(l_containerInfo_0);
    end);
end;
v16 = function(v31, v32, v33)
    local v34 = false;
    if v33 ~= nil then
        v34 = v33.hydrate == true;
    end;
    local v35 = if v33 ~= nil then v33.hydrationOptions else nil;
    local v36 = (v33 ~= nil and v33.hydrationOptions ~= nil) and v33.hydrationOptions.mutableSources or nil;
    local v37 = l_createContainer_0(v31, v32, v34, v35);
    l_markContainerAsRoot_0(v37.current, v31);
    if l_enableEagerRootListeners_0 then
    end;
    if v36 then
    end;
    return v37;
end;
local v49 = {
    isValidContainer = function(v38)
        return typeof(v38) == "Instance";
    end, 
    createRoot = function(v39, v40)
        l_invariant_0(typeof(v39) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v39);
        return v17.new(v39, v40);
    end, 
    createBlockingRoot = function(v41, v42)
        l_invariant_0(typeof(v41) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v41);
        local l_l_BlockingRoot_0_0 = l_BlockingRoot_0;
        local v44 = setmetatable({}, v17);
        v44._internalRoot = v16(v41, l_l_BlockingRoot_0_0, v42);
        return v44;
    end, 
    createLegacyRoot = function(v45, v46)
        local l_l_LegacyRoot_0_0 = l_LegacyRoot_0;
        local v48 = setmetatable({}, v17);
        v48._internalRoot = v16(v45, l_l_LegacyRoot_0_0, v46);
        return v48;
    end
};
warnIfReactDOMContainerInDEV = function(_)
    if _G.__DEV__ then
    end;
end;
return v49;
