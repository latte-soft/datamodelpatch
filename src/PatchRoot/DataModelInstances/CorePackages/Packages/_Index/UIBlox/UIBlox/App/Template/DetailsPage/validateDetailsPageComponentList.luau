local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Enum.ContentPosition);
local v3 = require(l_Parent_1.t);
return v3.map(v3.string, v3.strictInterface({
    portraitLayoutOrder = v3.integer, 
    landscapeLayoutOrder = v3.integer, 
    landscapePosition = v2.isEnumValue, 
    renderComponent = v3.callback, 
    showCornerGradient = v3.optional(v3.boolean), 
    useSelectionBumper = v3.optional(v3.boolean)
}));
