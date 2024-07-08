local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_ContextBarContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ContextBarContext"));
local l_ContextBar_0 = v5.App.Navigation.PrimaryNavBar.ContextBar;
local l_Images_0 = v5.App.ImageSet.Images;
local v9 = {
    [Enum.KeyCode.ButtonX] = "icons/controls/keys/xboxX", 
    [Enum.KeyCode.ButtonY] = "icons/controls/keys/xboxY", 
    [Enum.KeyCode.ButtonB] = "icons/controls/keys/xboxB", 
    [Enum.KeyCode.ButtonA] = "icons/controls/keys/xboxA"
};
local function v16(v10)
    local v11 = {};
    local l_pairs_0 = pairs;
    local v13 = v10 or {};
    for _, v15 in l_pairs_0(v13) do
        v11[#v11 + 1] = {
            icon = l_Images_0[v9[v15.keyCode]], 
            text = v15.text
        };
    end;
    return v11;
end;
return function()
    local v17 = v4.useContext(l_ContextBarContext_0.RoactContext);
    local v18, v19 = v4.useState({});
    v4.useEffect(function()
        v19((v16(v17.actions or {})));
        local v21 = v17.actionsUpdateSignal:connect(function(v20)
            v19((v16(v20)));
        end);
        return function()
            l_Utility_0.DisconnectEvent(v21);
        end;
    end, {});
    if #v18 > 0 then
        return v4.createElement(l_ContextBar_0, {
            position = UDim2.new(0.5, 0, 1, 0), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            items = v18
        });
    else
        return ;
    end;
end;
