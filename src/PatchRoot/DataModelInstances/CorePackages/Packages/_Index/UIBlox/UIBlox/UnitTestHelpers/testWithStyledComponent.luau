local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.Parent.Roact);
local v5 = require(l_Parent_0.dumpInstanceTree);
local v6 = require(l_Parent_1.Utility.mockStyleComponent);
return function(v7, v8, v9)
    local v10 = v4.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        StyleProvider = v6({
            TestComponent = v4.createElement(v7, v8)
        })
    });
    local v11 = ("TestApp-%s"):format(l_HttpService_0:GenerateGUID());
    local v12 = v4.mount(v10, l_CoreGui_0, v11);
    local v13 = ("game.CoreGui.%s.StyleProvider.TestComponent"):format(v11);
    local l_status_0, l_result_0 = pcall(function()
        v9(v13);
    end);
    if not l_status_0 then
        print("Test instance tree:");
        v5(l_CoreGui_0:FindFirstChild(v11));
        print("Test instance tree end\n");
    end;
    v4.unmount(v12);
    if not l_status_0 then
        error(l_result_0);
    end;
end;
