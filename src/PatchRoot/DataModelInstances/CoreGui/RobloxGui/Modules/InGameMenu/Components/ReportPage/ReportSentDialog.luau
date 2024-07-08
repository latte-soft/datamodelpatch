local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_RoactRodux_0 = v3.RoactRodux;
local l_t_0 = v3.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Assets);
local v9 = require(l_Parent_0.Actions.CloseReportSentDialog);
local v10 = require(l_Parent_0.Resources.Constants);
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = require(l_Parent_0.Components.InfoDialog);
local v13 = require(script.Parent.Parent.Connection.FocusHandler);
local v14 = l_t_0.strictInterface({
    isReportSentOpen = l_t_0.boolean, 
    onDismiss = l_t_0.callback, 
    inputType = l_t_0.optional(l_t_0.string)
});
local v15 = l_Roact_0.PureComponent:extend("ReportSentDialog");
v15.validateProps = v14;
v15.init = function(v16)
    v16.buttonRef = l_Roact_0.createRef();
end;
v15.renderFocusHandler = function(v17)
    local l_createElement_0 = l_Roact_0.createElement;
    local l_v13_0 = v13;
    local v20 = {};
    local v21 = false;
    if v17.props.inputType == v10.InputType.Gamepad then
        v21 = v17.props.isReportSentOpen;
    end;
    v20.isFocused = v21;
    v20.didFocus = function()
        l_GuiService_0:RemoveSelectionGroup("ReportSentDialogGroup");
        l_GuiService_0:AddSelectionParent("ReportSentDialogGroup", v17.buttonRef:getValue());
        l_GuiService_0.SelectedCoreObject = v17.buttonRef:getValue();
        l_ContextActionService_0:BindCoreAction("ReporSentDialogSinkAction", function(_, _)
            return Enum.ContextActionResult.Sink;
        end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX);
    end;
    v20.didBlur = function()
        l_ContextActionService_0:UnbindCoreAction("ReporSentDialogSinkAction");
        l_GuiService_0:RemoveSelectionGroup("ReportSentDialogGroup");
    end;
    return l_createElement_0(l_v13_0, v20);
end;
v15.render = function(v24)
    return v11({
        titleText = "CoreScripts.InGameMenu.Report.ThanksForReport", 
        bodyText = "CoreScripts.InGameMenu.Report.WillReviewBody", 
        dismissText = "CoreScripts.InGameMenu.Ok"
    })(function(v25)
        return l_Roact_0.createFragment({
            Dialog = l_Roact_0.createElement(v12, {
                titleText = v25.titleText, 
                bodyText = v25.bodyText, 
                dismissText = v25.dismissText, 
                iconImage = v8.Images.SuccessTick, 
                buttonRef = v24.buttonRef, 
                onDismiss = v24.props.onDismiss, 
                visible = v24.props.isReportSentOpen
            }), 
            FocusHandler = v24:renderFocusHandler()
        });
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(function(v26, _)
    return {
        isReportSentOpen = v26.report.reportSentOpen, 
        inputType = v26.displayOptions.inputType
    };
end, function(v28)
    return {
        onDismiss = function()
            v28(v9());
        end
    };
end)(v15);
