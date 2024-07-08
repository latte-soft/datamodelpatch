local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.Parent.Parent.Roact);
local v4 = require(l_Parent_0.dumpInstanceTree);
local function v6(v5)
    return v3.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, v5[v3.Children]);
end;
return function(v7, v8)
    local v9 = v3.createElement(v6, nil, {
        TestComponent = v7
    });
    local v10 = ("TestApp-%s"):format(l_HttpService_0:GenerateGUID(false));
    local v11 = v3.mount(v9, l_CoreGui_0, v10);
    local v12 = ("game.CoreGui.%s.TestComponent"):format(v10);
    local l_status_0, l_result_0 = pcall(function()
        v8(v12);
    end);
    if not l_status_0 then
        print("Test instance tree:");
        v4(l_CoreGui_0:FindFirstChild(v10));
        print("Test instance tree end\n");
    end;
    v3.unmount(v11);
    if not l_status_0 then
        error(l_result_0);
    end;
end;
