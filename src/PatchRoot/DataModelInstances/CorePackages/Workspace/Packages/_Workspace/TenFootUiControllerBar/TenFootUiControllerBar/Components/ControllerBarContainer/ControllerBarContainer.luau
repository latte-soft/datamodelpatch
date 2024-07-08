local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiControllerBar");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.ControllerBar);
local v3 = require(script.Parent.useControllerBarProps);
ControllerBarContainer = function()
    return v1.createElement(v2, (v3()));
end;
return ControllerBarContainer;
