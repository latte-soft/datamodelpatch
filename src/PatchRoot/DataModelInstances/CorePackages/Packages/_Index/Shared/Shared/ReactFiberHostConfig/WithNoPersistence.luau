local v0 = require(script.Parent.Parent.invariant);
local function v1(...)
    v0(false, "The current renderer does not support persistence. " .. "This error is likely caused by a bug in React. " .. "Please file an issue.");
end;
return {
    supportsPersistence = false, 
    cloneInstance = v1, 
    cloneFundamentalInstance = v1, 
    createContainerChildSet = v1, 
    appendChildToContainerChildSet = v1, 
    finalizeContainerChildren = v1, 
    replaceContainerChildren = v1, 
    cloneHiddenInstance = v1, 
    cloneHiddenTextInstance = v1
};
