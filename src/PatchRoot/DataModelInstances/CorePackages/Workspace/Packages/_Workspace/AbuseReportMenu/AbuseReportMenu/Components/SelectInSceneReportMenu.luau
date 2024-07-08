local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_CorePackages_0.UIBlox);
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_Button_0 = v4.App.Button.Button;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v4.App.Button.Enum.StandardButtonSize;
local l_useStyle_0 = v4.Core.Style.useStyle;
local v10 = nil;
local l_RobloxTranslator_0 = l_RobloxGui_0.Modules:FindFirstChild("RobloxTranslator");
if l_RobloxTranslator_0 then
    v10 = require(l_RobloxTranslator_0);
end;
return function()
    local v12 = l_useStyle_0();
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 30)
        }), 
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15)
        }), 
        Title = v3.createElement(l_StyledTextLabel_0, {
            text = "Report using Select in Scene", 
            fontStyle = v12.Font.Header1, 
            colorStyle = v12.Theme.TextEmphasis, 
            layoutOrder = 0, 
            automaticSize = Enum.AutomaticSize.XY
        }), 
        SubheadingFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            LayoutOrder = 1
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 30)
            }), 
            Subheading1 = v3.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v10:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"), 
                fontStyle = v12.Font.Body, 
                colorStyle = v12.Theme.TextEmphasis, 
                layoutOrder = 0, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            Subheading2 = v3.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v10:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"), 
                fontStyle = v12.Font.Body, 
                colorStyle = v12.Theme.TextEmphasis, 
                layoutOrder = 1, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            Subheading3 = v3.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v10:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3"), 
                fontStyle = v12.Font.Body, 
                colorStyle = v12.Theme.TextEmphasis, 
                layoutOrder = 2, 
                automaticSize = Enum.AutomaticSize.XY
            })
        }), 
        EnterSelectInSceneButton = v3.createElement(l_Button_0, {
            text = v10:FormatByKey("Feature.ReportAbuse.Action.EnterSceneReporting"), 
            buttonType = l_ButtonType_0.PrimarySystem, 
            standardSize = l_StandardButtonSize_0.Small, 
            layoutOrder = 2, 
            position = UDim2.new(0.5, 0, 0, 0), 
            anchorPoint = Vector2.new(0.5, 0), 
            fitContent = true, 
            onActivated = function()
                local l_SafetyService_0 = game:GetService("SafetyService");
                local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
                l_SafetyService_0.IsCaptureModeForReport = true;
                l_ExperienceStateCaptureService_0:ToggleCaptureMode();
            end
        })
    });
end;
