local v0 = require(script.Parent.Parent.invariant);
shim = function(...)
    v0(false, "The current renderer does not support hydration. " .. "This error is likely caused by a bug in React. " .. "Please file an issue.");
end;
return {
    supportsHydration = false, 
    canHydrateInstance = shim, 
    canHydrateTextInstance = shim, 
    canHydrateSuspenseInstance = shim, 
    isSuspenseInstancePending = shim, 
    isSuspenseInstanceFallback = shim, 
    registerSuspenseInstanceRetry = shim, 
    getNextHydratableSibling = shim, 
    getFirstHydratableChild = shim, 
    hydrateInstance = shim, 
    hydrateTextInstance = shim, 
    hydrateSuspenseInstance = shim, 
    getNextHydratableInstanceAfterSuspenseInstance = shim, 
    commitHydratedContainer = shim, 
    commitHydratedSuspenseInstance = shim, 
    clearSuspenseBoundary = shim, 
    clearSuspenseBoundaryFromContainer = shim, 
    didNotMatchHydratedContainerTextInstance = shim, 
    didNotMatchHydratedTextInstance = shim, 
    didNotHydrateContainerInstance = shim, 
    didNotHydrateInstance = shim, 
    didNotFindHydratableContainerInstance = shim, 
    didNotFindHydratableContainerTextInstance = shim, 
    didNotFindHydratableContainerSuspenseInstance = shim, 
    didNotFindHydratableInstance = shim, 
    didNotFindHydratableTextInstance = shim, 
    didNotFindHydratableSuspenseInstance = shim
};
