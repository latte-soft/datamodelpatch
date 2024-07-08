local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.t);
local v2 = require(l_Parent_0.Roact);
local v3 = v2.Component:extend("OnRootedListener");
v3.validateProps = v1.strictInterface({
    onRooted = v1.callback
});
v3.init = function(v4)
    v4.onAncestryChanged = function(v5)
        if v5:IsDescendantOf(game) then
            v4.props.onRooted(v5);
        end;
    end;
end;
v3.render = function(v6)
    return v2.createElement("Folder", {
        [v2.Event.AncestryChanged] = v6.onAncestryChanged
    });
end;
return v3;
