local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Parent.enumerate);
local v2 = require(l_Parent_0.Utility.strict);
local _ = nil;
return v2({
    ItemIconType = v1("ItemIconType", {
        "AnimationBundle", 
        "Bundle", 
        "DynamicHead"
    }), 
    StatusStyle = v1("StatusStyle", {
        "Alert", 
        "Info"
    }), 
    Restriction = v1("Restriction", {
        "Limited", 
        "LimitedUnique", 
        "Collectible"
    })
}, script.Name);
