local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.RoduxNetworking);
local v4 = require(l_Parent_0.HttpRequest);
local v5 = require(l_script_FirstAncestor_0.Networking.createRequestThunks);
local v9 = v3.config({
    keyPath = "CrossPlaySettings.NetworkStatus", 
    networkImpl = v4.config({
        requestFunction = function(v6, v7, v8)
            v8.headers = {
                ["robloxctx-authenticated-userid"] = if not not l_Players_0 and l_Players_0.LocalPlayer then tostring(l_Players_0.LocalPlayer.UserId) else ""
            };
            return v4.requestFunctions.RequestInternal(v6, v7, v8);
        end, 
        maxRetryCount = 0
    })
});
return {
    roduxNetworking = v9, 
    thunks = v5({
        roduxNetworking = v9
    })
};
