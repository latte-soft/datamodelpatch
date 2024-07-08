local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
local v2 = require(l_script_FirstAncestor_0.Dev.Rhodium);
local v3 = require(l_script_FirstAncestor_0.Roact);
local l_Element_0 = v2.Element;
local l_XPath_0 = v2.XPath;
local v6 = require(script.Parent.Parent.UnitTestHelpers.mockStyle);
return function(v7)
    local v8 = false;
    local v9 = v3.mount(v6((v3.createElement("ScreenGui", {}, {
        buttonElement = v3.createElement(v7, {
            onActivated = function()
                v8 = true;
            end
        })
    }))), l_CoreGui_0, "TestRoot");
    local v10 = l_Element_0.new((l_XPath_0.new("game.CoreGui.TestRoot.buttonElement")));
    assert(v10:getRbxInstance() ~= nil, "button was nil");
    v10:click();
    wait(0);
    assert(v8 == true, "button was not activated");
    v3.unmount(v9);
end;
