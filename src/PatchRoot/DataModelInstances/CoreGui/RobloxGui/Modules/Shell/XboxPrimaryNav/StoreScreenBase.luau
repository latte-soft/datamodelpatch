local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Templates_0 = l_Shell_0:FindFirstChild("Templates");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_BaseScreen_0 = require(l_Templates_0:FindFirstChild("BaseScreen"));
local l_StorePane_0 = require(l_Shell_0:FindFirstChild("StorePane"));
return function(v5)
    local v6 = l_BaseScreen_0(v5);
    local v7 = l_StorePane_0((l_Utility_0.Create("Frame")({
        Name = "StoreContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 16, 0, 180), 
        BackgroundTransparency = 1, 
        Parent = v6.Container
    })));
    v6.GetDefaultSelectionObject = function(_)
        return nil;
    end;
    v6.OnShow = function(_)
        v7:Show();
    end;
    v6.OnHide = function(_)
        v7:Hide();
    end;
    v6.OnFocus = function(_)
        v7:Focus();
    end;
    v6.OnRemoveFocus = function(_)
        v7:RemoveFocus();
    end;
    return v6;
end;
