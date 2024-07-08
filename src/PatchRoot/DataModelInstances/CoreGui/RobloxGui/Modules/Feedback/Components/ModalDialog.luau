local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Assets);
local v7 = require(l_Parent_0.Components.PortedComponents.Divider);
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local v15 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments);
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local v17 = not v15() and 48 or 60;
local v18 = v2.Component:extend("ModalDialog");
v18.validateProps = v4.strictInterface({
    visible = v4.boolean, 
    screenSize = v4.Vector2, 
    titleText = v4.optional(v4.string), 
    showCloseButton = v4.optional(v4.boolean), 
    headerBar = v4.optional(v4.table), 
    contents = v4.optional(v4.table), 
    actionButtons = v4.optional(v4.table), 
    onDismiss = v4.optional(v4.callback), 
    onBackButtonActivated = v4.optional(v4.callback), 
    maxHeight = v4.optional(v4.number), 
    maxWidth = v4.optional(v4.number)
});
v18.init = function(v19)
    v19.onOverlayActivated = function()
        v19.props.onDismiss();
    end;
end;
v18.renderHeaderBarLeft = function(v20)
    local l_props_0 = v20.props;
    if not l_props_0.showCloseButton then
        if l_props_0.onBackButtonActivated ~= nil then
            if not l_GetFFlagUIBloxUseNewHeaderBar_0() then
                return (l_HeaderBar_0.renderLeft.backButton(l_props_0.onBackButtonActivated));
            else
                return (l_makeBackButton_0(l_props_0.onBackButtonActivated));
            end;
        else
            return function()
                return nil;
            end;
        end;
    else
        return function()
            return v2.createElement(l_IconButton_0, {
                iconSize = l_IconSize_0.Medium, 
                icon = l_Images_0["icons/navigation/close"], 
                onActivated = l_props_0.onDismiss
            });
        end;
    end;
end;
v18.renderHeaderBarRight = function(_)
    return function()
        return nil;
    end;
end;
v18.render = function(v23)
    local l_props_1 = v23.props;
    local v25 = math.min(l_props_1.screenSize.Y, 645);
    if l_props_1.maxHeight then
        v25 = math.min(v25, l_props_1.maxHeight);
    end;
    local v26 = math.min(l_props_1.screenSize.X, 540);
    if l_props_1.maxWidth then
        v26 = math.min(v26, l_props_1.maxWidth);
    end;
    local v27 = Vector2.new(v26, v25);
    local v28 = nil;
    local v29 = nil;
    if l_props_1.screenSize.X < 540 then
        v28 = Vector2.new(0.5, 1);
        v29 = UDim2.fromScale(0.5, 1);
    else
        v28 = Vector2.new(0.5, 0.5);
        v29 = UDim2.fromScale(0.5, 0.5);
    end;
    local v30 = math.min(600, (v27.Y - 49) - v17);
    if not l_props_1.actionButtons then
        v30 = v30 + v17;
    end;
    return l_withStyle_0(function(v31)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_1.visible
        }, {
            Overlay = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v31.Theme.Overlay.Color, 
                BackgroundTransparency = v31.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Text = "", 
                [v2.Event.Activated] = v23.onOverlayActivated
            }), 
            Dialog = v2.createElement(l_ImageSetButton_0, {
                Active = true, 
                AnchorPoint = v28, 
                BackgroundTransparency = 1, 
                Image = v6.Images.RoundedRect.Image, 
                ImageColor3 = v31.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v31.Theme.BackgroundUIDefault.Transparency, 
                Position = v29, 
                ScaleType = v6.Images.RoundedRect.ScaleType, 
                Size = UDim2.fromOffset(v27.X, v27.Y), 
                SliceCenter = v6.Images.RoundedRect.SliceCenter
            }, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                HeaderBar = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 48)
                }, {
                    Bar = (l_props_1.headerBar or v2.createElement(l_HeaderBar_0, {
                        backgroundTransparency = 1, 
                        barHeight = 48, 
                        renderLeft = v23:renderHeaderBarLeft(), 
                        renderRight = v23:renderHeaderBarRight(), 
                        title = l_props_1.titleText
                    })) or nil
                }), 
                Divider = v2.createElement(v7, {
                    LayoutOrder = 2
                }), 
                Content = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, v30), 
                    ZIndex = 10
                }, {
                    Contents = l_props_1.contents
                }), 
                ActionBar = not not l_props_1.actionButtons and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, v17)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 8), 
                        PaddingBottom = UDim.new(0, 2), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    ActionButtons = l_props_1.actionButtons
                }) or nil
            })
        });
    end);
end;
v18.bindActions = function(v32)
    l_ContextActionService_0:BindCoreAction("ModalDialogDismiss", function(v33)
        if v33 == Enum.UserInputState.Begin then
            v32.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v18.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("ModalDialogDismiss");
end;
v18.didMount = function(v35)
    if v35.props.visible then
        v35:bindActions();
    end;
end;
v18.didUpdate = function(v36)
    if not v36.props.visible then
        v36:unbindActions();
        return ;
    else
        v36:bindActions();
        return ;
    end;
end;
v18.willUnmount = function(v37)
    v37:unbindActions();
end;
return v18;
