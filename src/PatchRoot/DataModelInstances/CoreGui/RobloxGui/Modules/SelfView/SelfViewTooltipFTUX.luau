local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.UIBlox);
local l_withTooltip_0 = v5.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v5.App.Dialog.Enum.TooltipOrientation;
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v9 = require(l_CorePackages_0.Packages.Promise);
return function(v10)
    local v11, v12 = v4.useState(true);
    local l_fallbackText_0 = v10.fallbackText;
    pcall(function()
        l_fallbackText_0 = v8:FormatByKey(v10.translationKey);
    end);
    local v14 = {
        textAlignment = Enum.TextXAlignment.Left, 
        bodyText = l_fallbackText_0
    };
    local v15 = {
        active = v11, 
        guiTarget = l_CoreGui_0, 
        DisplayOrder = 10, 
        preferredOrientation = l_TooltipOrientation_0.Left
    };
    local v16 = nil;
    local function _()
        v12(false);
        if v16 then
            v16:Disconnect();
            v16 = nil;
        end;
    end;
    v16 = l_UserInputService_0.InputBegan:Connect(function(v18)
        local l_UserInputType_0 = v18.UserInputType;
        if not (l_UserInputType_0 ~= Enum.UserInputType.MouseButton1) or l_UserInputType_0 == Enum.UserInputType.Touch then
            v12(false);
            if v16 then
                v16:Disconnect();
                v16 = nil;
            end;
        end;
    end);
    v9.delay(v10.tooltipLifetime):andThen(function()
        v12(false);
        if v16 then
            v16:Disconnect();
            v16 = nil;
        end;
    end);
    return l_withTooltip_0(v14, v15, function(v20)
        local function v22(v21)
            v20(v21);
        end;
        return v4.createElement("Frame", {
            Visible = false, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v4.Change.AbsoluteSize] = v22, 
            [v4.Change.AbsolutePosition] = v22
        });
    end);
end;
