local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local v4 = require(script.Parent.useStartupMessageProps);
local v5 = require(script.Parent.StartupMessage);
return v2.memo(function()
    local v6 = v4();
    return v3.createPortal({
        v2.createElement("ScreenGui", {
            Enabled = true, 
            IgnoreGuiInset = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            AutoLocalize = false, 
            DisplayOrder = 100
        }, {
            StartupMessage = v6.displayStartupMessage and v2.createElement(v5, v6)
        })
    }, l_CoreGui_0);
end);
