local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.VR.VRHub);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v4 = require(l_CorePackages_0.Packages.React);
local l_RunService_0 = game:GetService("RunService");
local v6 = require(script.Parent.ToolTip);
local v7 = require(l_CorePackages_0.Packages.LuauPolyfill);
local v8 = {};
local function v14(_)
    if l_IsVRAppBuild_0() then
        for _, v11 in pairs(v8) do
            local l_v2_ControllerModel_0 = v2:GetControllerModel(v11.Button.Controller);
            local v13 = nil;
            if l_v2_ControllerModel_0 then
                v13 = l_v2_ControllerModel_0:getButtonPosition(v11.Button.ButtonKeycode);
            end;
            if v11.Part then
                if not (l_v2_ControllerModel_0 ~= nil) or v13 == nil then
                    v11.Part.Position = Vector3.new(-99999, -99999, -99999);
                else
                    v11.Part.Position = v13;
                end;
            end;
        end;
    end;
end;
spawnTooltipPart = function()
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Name = "TooltipPart";
    l_Part_0.Position = Vector3.new(0, -100, 0);
    l_Part_0.Anchored = true;
    l_Part_0.CanCollide = false;
    l_Part_0.Transparency = 1;
    l_Part_0.Size = Vector3.new(0.1, 0.1, 0.1);
    l_Part_0.Parent = game.Workspace;
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Parent = l_Part_0;
    l_BillboardGui_0.Adornee = l_Part_0;
    l_BillboardGui_0.AlwaysOnTop = true;
    l_BillboardGui_0.Active = false;
    l_BillboardGui_0.Size = UDim2.new(1, 0, 1, 0);
    return l_Part_0;
end;
showTooltipText = function(v17)
    for _, v19 in ipairs(v17.Part:GetDescendants()) do
        if v19:IsA("TextLabel") and v19.Name == "Body" then
            v19.ZIndex = 10;
        end;
    end;
end;
Tooltips = function(v20)
    for v21, v22 in pairs(v20.tooltipButtons) do
        v8[v21] = {
            Button = v22, 
            Part = spawnTooltipPart()
        };
    end;
    v4.useEffect(function()
        for _, v24 in pairs(v8) do
            showTooltipText(v24);
        end;
    end, {});
    l_RunService_0.RenderStepped:Connect(v14);
    return v4.createElement("Frame", {}, (v7.Array.map(v8, function(v25, v26)
        return (v4.createElement(v6, {
            controllerPart = v25.Part, 
            tooltipText = v20.tooltipButtons[v26].Text
        }));
    end)));
end;
return Tooltips;
