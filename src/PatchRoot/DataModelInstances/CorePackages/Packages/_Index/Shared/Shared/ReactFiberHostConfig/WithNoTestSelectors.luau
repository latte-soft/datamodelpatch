local v0 = require(script.Parent.Parent.invariant);
local function v1(...)
    v0(false, "The current renderer does not support test selectors. " .. "This error is likely caused by a bug in React. " .. "Please file an issue.");
end;
return {
    supportsTestSelectors = false, 
    findFiberRoot = v1, 
    getBoundingRect = v1, 
    getTextContent = v1, 
    isHiddenSubtree = v1, 
    matchAccessibilityRole = v1, 
    setFocusIfFocusable = v1, 
    setupIntersectionObserver = v1
};
