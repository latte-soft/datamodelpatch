local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(l_Parent_0.React);
local v3 = {};
local v4 = v2.createContext(nil);
if _G.__DEV__ then
    v4.displayName = "ScrollViewContext";
end;
v3.default = v4;
v3.HORIZONTAL = l_Object_0.freeze({
    horizontal = true
});
v3.VERTICAL = l_Object_0.freeze({
    horizontal = false
});
return v3;
