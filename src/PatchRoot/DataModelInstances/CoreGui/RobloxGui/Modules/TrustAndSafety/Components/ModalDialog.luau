local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Components.VirtualKeyboardMonitor);
local v7 = require(l_Parent_0.Resources.Assets);
local v8 = require(require(l_Parent_0.Dependencies).Divider);
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_HeaderBar_0 = v3.App.Bar.HeaderBar;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_GetFFlagUIBloxUseNewHeaderBar_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseNewHeaderBar;
local l_makeBackButton_0 = require(l_CorePackages_0.Workspace.Packages.AppHeaderBar).makeBackButton;
local v17 = v2.Component:extend("ModalDialog");
v17.validateProps = v4.strictInterface({
    visible = v4.boolean, 
    screenSize = v4.Vector2, 
    titleText = v4.optional(v4.string), 
    showCloseButton = v4.optional(v4.boolean), 
    headerBar = v4.optional(v4.table), 
    contents = v4.optional(v4.table), 
    actionButtons = v4.optional(v4.table), 
    onDismiss = v4.optional(v4.callback), 
    onBackButtonActivated = v4.optional(v4.callback)
});
v17.init = function(v18)
    v18.virtualKeyboardMonitor = v6.getInstance();
    v18.onOverlayActivated = function()
        if not v18.virtualKeyboardMonitor:isKeyboardJustOff() then
            v18.props.onDismiss();
            return ;
        else
            return ;
        end;
    end;
end;
v17.renderHeaderBarLeft = function(v19)
    local l_props_0 = v19.props;
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
v17.renderHeaderBarRight = function(_)
    return function()
        return nil;
    end;
end;
v17.render = function(v22)
    local l_props_1 = v22.props;
    local v24 = Vector2.new(math.min(l_props_1.screenSize.X, 540), (math.min(l_props_1.screenSize.Y, 375)));
    local v25 = nil;
    local v26 = nil;
    if l_props_1.screenSize.X < 540 then
        v25 = Vector2.new(0.5, 1);
        v26 = UDim2.fromScale(0.5, 1);
    else
        v25 = Vector2.new(0.5, 0.5);
        v26 = UDim2.fromScale(0.5, 0.5);
    end;
    local v27 = math.min(230, (v24.Y - 49) - 96);
    if not l_props_1.actionButtons then
        v27 = v27 + 96;
    end;
    return l_withStyle_0(function(v28)
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            Visible = l_props_1.visible
        }, {
            Overlay = v2.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundColor3 = v28.Theme.Overlay.Color, 
                BackgroundTransparency = v28.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 1), 
                Text = "", 
                ZIndex = -10, 
                [v2.Event.Activated] = v22.onOverlayActivated
            }), 
            Dialog = v2.createElement(l_ImageSetButton_0, {
                Active = true, 
                AnchorPoint = v25, 
                BackgroundTransparency = 1, 
                Image = v7.Images.RoundedRect.Image, 
                ImageColor3 = v28.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v28.Theme.BackgroundUIDefault.Transparency, 
                Position = v26, 
                ScaleType = v7.Images.RoundedRect.ScaleType, 
                Size = UDim2.fromOffset(v24.X, v24.Y), 
                SliceCenter = v7.Images.RoundedRect.SliceCenter
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
                        renderLeft = v22:renderHeaderBarLeft(), 
                        renderRight = v22:renderHeaderBarRight(), 
                        title = l_props_1.titleText
                    })) or nil
                }), 
                Divider = v2.createElement(v8, {
                    LayoutOrder = 2
                }), 
                Content = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3, 
                    Size = UDim2.new(1, 0, 0, v27), 
                    ZIndex = 10
                }, {
                    Contents = l_props_1.contents
                }), 
                ActionBar = not not l_props_1.actionButtons and v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4, 
                    Size = UDim2.new(1, 0, 0, 96)
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 24), 
                        PaddingLeft = UDim.new(0, 24), 
                        PaddingRight = UDim.new(0, 24)
                    }), 
                    ActionButtons = l_props_1.actionButtons
                }) or nil
            })
        });
    end);
end;
v17.bindActions = function(v29)
    l_ContextActionService_0:BindCoreAction("ModalDialogDismiss", function(_, v31, _)
        if v31 == Enum.UserInputState.Begin then
            v29.props.onDismiss();
        end;
    end, false, Enum.KeyCode.Escape);
end;
v17.unbindActions = function(_)
    l_ContextActionService_0:UnbindCoreAction("ModalDialogDismiss");
end;
v17.didMount = function(v34)
    if v34.props.visible then
        v34:bindActions();
    end;
end;
v17.didUpdate = function(v35)
    if not v35.props.visible then
        v35:unbindActions();
        return ;
    else
        v35:bindActions();
        return ;
    end;
end;
v17.willUnmount = function(v36)
    v36:unbindActions();
end;
return v17;
