local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v4 = require(l_CorePackages_0.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_t_0 = v4.t;
local l_UIBlox_0 = v4.UIBlox;
local l_EducationalModal_0 = l_UIBlox_0.App.Dialog.Modal.EducationalModal;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v10 = require(script.Parent.Parent.Flags.FFlagFixExitDialogBlockVRView);
local v11 = l_Roact_0.PureComponent:extend("EducationalPopupDialog");
v11.validateProps = l_t_0.strictInterface({
    bodyContents = l_t_0.array(l_t_0.strictInterface({
        icon = l_t_0.optional(l_t_0.union(l_t_0.string, l_t_0.table)), 
        text = l_t_0.string, 
        layoutOrder = l_t_0.optional(l_t_0.integer), 
        isSystemMenuIcon = l_t_0.optional(l_t_0.boolean)
    })), 
    cancelText = l_t_0.string, 
    confirmText = l_t_0.string, 
    titleText = l_t_0.optional(l_t_0.string), 
    titleBackgroundImageProps = l_t_0.strictInterface({
        image = l_t_0.string, 
        imageHeight = l_t_0.number, 
        text = l_t_0.optional(l_t_0.string)
    }), 
    screenSize = l_t_0.Vector2, 
    onDismiss = l_t_0.callback, 
    onCancel = l_t_0.callback, 
    onConfirm = l_t_0.callback, 
    blurBackground = l_t_0.boolean, 
    visible = l_t_0.boolean
});
v11.defaultProps = {
    blurBackground = false
};
v11.render = function(v12)
    return l_withStyle_0(function(v13)
        return l_Roact_0.createElement(l_Roact_0.Portal, {
            target = l_CoreGui_0
        }, {
            InGameMenuEducationalPopupDialog = l_Roact_0.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = v12.props.blurBackground, 
                Enabled = v12.props.visible, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Overlay = l_Roact_0.createElement("TextButton", {
                    AutoButtonColor = false, 
                    BackgroundColor3 = v13.Theme.Overlay.Color, 
                    BackgroundTransparency = v13.Theme.Overlay.Transparency, 
                    BorderSizePixel = 0, 
                    Size = UDim2.fromScale(1, 1), 
                    Text = ""
                }), 
                Popup = l_Roact_0.createElement(l_EducationalModal_0, {
                    bodyContents = v12.props.bodyContents, 
                    cancelText = v12.props.cancelText, 
                    confirmText = v12.props.confirmText, 
                    titleText = v12.props.titleText, 
                    titleBackgroundImageProps = v12.props.titleBackgroundImageProps, 
                    screenSize = v12.props.screenSize, 
                    onDismiss = v12.props.onDismiss, 
                    onCancel = v12.props.onCancel, 
                    onConfirm = v12.props.onConfirm
                })
            })
        });
    end);
end;
v11.bindActions = function(v14)
    l_ContextActionService_0:BindCoreAction("EducationalPopupConfirm", function(_, v16, _)
        if v16 == Enum.UserInputState.Begin then
            v14.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v11.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("EducationalPopupConfirm");
end;
v11.updateBlur = function(v19)
    local v20 = v19.props.blurBackground and v19.props.visible;
    if v10 then
        v20 = v20 and not game:GetService("VRService").VREnabled;
    end;
    l_RunService_0:SetRobloxGuiFocused(v20);
end;
v11.didMount = function(v21)
    v21:updateBlur();
    if v21.props.visible then
        v21:bindActions();
    end;
end;
v11.didUpdate = function(v22)
    v22:updateBlur();
    if not v22.props.visible then
        v22:unbindActions();
        return ;
    else
        v22:bindActions();
        return ;
    end;
end;
v11.willUnmount = function(v23)
    if v23.props.blurBackground then
        l_RunService_0:SetRobloxGuiFocused(false);
    end;
    v23:unbindActions();
end;
return v11;
