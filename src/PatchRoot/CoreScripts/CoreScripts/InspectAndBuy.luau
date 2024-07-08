local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_InspectAndBuy_0 = l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("InspectAndBuy");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_InspectAndBuy_0.Components.InspectAndBuy);
local v6 = nil;
local v7 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local v8 = require(l_RobloxGui_0.Modules.TopBar);
local function v13(v9, v10, v11, v12)
    if v6 then
        v4.unmount(v6);
        v6 = nil;
    end;
    v6 = v4.mount(v7({
        inspectAndBuy = v4.createElement(v5, {
            humanoidDescription = v9, 
            playerName = v10, 
            playerId = v11, 
            ctx = v12
        })
    }), l_RobloxGui_0, "InspectAndBuy");
    l_GuiService_0:SetMenuIsOpen(true, "InspectMenu");
    v8:setInspectMenuOpen(true);
end;
local function _()
    if v6 then
        v4.unmount(v6);
        v6 = nil;
        l_GuiService_0:SetMenuIsOpen(false, "InspectMenu");
        v8:setInspectMenuOpen(false);
    end;
end;
local function _(v15, v16, v17)
    v13(v15, v16, nil, v17);
end;
local function _(v19, v20)
    v13(nil, nil, v19, v20);
end;
l_GuiService_0.InspectPlayerFromHumanoidDescriptionRequest:Connect(function(v22, v23)
    v13(v22, v23, nil, "developerThroughHumanoidDescription");
end);
l_GuiService_0.InspectPlayerFromUserIdWithCtxRequest:Connect(function(v24, v25)
    v13(nil, nil, v24, v25);
end);
l_GuiService_0.CloseInspectMenuRequest:Connect(function()
    if not (not v6 or not v6) then
        v4.unmount(v6);
        v6 = nil;
        l_GuiService_0:SetMenuIsOpen(false, "InspectMenu");
        v8:setInspectMenuOpen(false);
    end;
end);
l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v26)
    if not ((v26 or not v6) or not v6) then
        v4.unmount(v6);
        v6 = nil;
        l_GuiService_0:SetMenuIsOpen(false, "InspectMenu");
        v8:setInspectMenuOpen(false);
    end;
end);
