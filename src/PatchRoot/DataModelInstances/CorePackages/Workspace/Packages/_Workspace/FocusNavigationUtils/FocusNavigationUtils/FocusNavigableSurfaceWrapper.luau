local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v3 = require(l_script_FirstAncestor_0.useFocusNavigableSurfaceRegistryConnection);
local v4 = require(l_script_FirstAncestor_0.useDefaultFocusNavigationBindings);
return function(v5)
    local v6, v7 = v1.useState(nil);
    v3(v6, v5.surfaceIdentifier);
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v4(v7)
    }, v5.children);
end;
