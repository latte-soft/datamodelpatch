local v0 = {
    APP_SHELL = 0, 
    GAME = 1
};
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v4 = nil;
pcall(function()
    v4 = game:GetService("PlatformService");
end);
local l_BaseOverlay_0 = require(l_Shell_0:FindFirstChild("BaseOverlay"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v9 = require(l_Shell_0.LocalizedStrings);
return function(v10)
    local v11 = l_BaseOverlay_0();
    local l_Title_0 = v10.Title;
    local l_Msg_0 = v10.Msg;
    local l_Code_0 = v10.Code;
    local l_Id_0 = v10.Id;
    v11:SetImage((l_Utility_0.Create("ImageLabel")({
        Name = "IconImage", 
        Size = UDim2.new(0, 416, 0, 416), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/AlertIcon.png", 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })));
    local v16 = l_Utility_0.Create("TextLabel")({
        Name = "DescriptionText", 
        Size = UDim2.new(0, 762, 0, 304), 
        Position = UDim2.new(0, v11.RightAlign, 0, l_Utility_0.Create("TextLabel")({
            Name = "TitleText", 
            Size = UDim2.new(0, 0, 0, 0), 
            Position = UDim2.new(0, v11.RightAlign, 0, 136), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.HeaderSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Parent = v11.Container
        }).Position.Y.Offset + 62), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextWrapped = true, 
        Text = l_Msg_0, 
        Parent = v11.Container
    });
    if l_Code_0 then
        v16.Text = string.format(v9:LocalizedString("ErrorMessageAndCodePrase"), l_Msg_0, l_Code_0);
    end;
    v11.GetPriority = function(_)
        return l_GlobalSettings_0.ImmediatePriority;
    end;
    v11.GetAnalyticsInfo = function(_)
        local v19 = {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("NoActionOverlayId"), 
            Title = v10.Title
        };
        if l_Code_0 then
            v19.ErrorCode = l_Code_0;
        end;
        if l_Id_0 then
            v19.AlertId = l_Id_0;
        end;
        return v19;
    end;
    v11.RemoveFocus = function(_)
    end;
    local l_Show_0 = v11.Show;
    v11.Show = function(v22)
        l_ContextActionService_0:BindCoreAction("StopControllerInput", function()
        end, false, Enum.UserInputType.Gamepad1);
        l_Show_0(v22);
    end;
    local l_Hide_0 = v11.Hide;
    v11.Hide = function(v24)
        l_Hide_0(v24);
        l_ContextActionService_0:UnbindCoreAction("StopControllerInput");
    end;
    local l_Focus_0 = v11.Focus;
    v11.Focus = function(_)
        l_Focus_0();
        if v4 and v4.DatamodelType == v0.APP_SHELL then
            l_GuiService_0.SelectedCoreObject = nil;
        end;
    end;
    if l_Code_0 then
        l_Analytics_0.ReportCounter("Error-" .. tostring(l_Code_0), 1);
        l_Analytics_0.SetRBXEventStream("Error", {
            ErrorCode = l_Code_0
        });
    end;
    if l_Id_0 then
        l_Analytics_0.ReportCounter("Alert-" .. tostring(l_Id_0), 1);
        l_Analytics_0.SetRBXEventStream("Alert", {
            AlertId = l_Id_0
        });
    end;
    return v11;
end;
