local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Shell.Utility);
local v4 = require(l_Modules_0.Shell.GlobalSettings);
local v5 = require(l_Modules_0.Shell.SoundManager);
local v6 = require(l_Modules_0.Shell.Components.Common.RoundedButton);
local v7 = require(l_Modules_0.Shell.Components.Common.RedirectComponent);
local v8 = v2.PureComponent:extend("AlertOverlay");
v8.init = function(v9)
    v9.key = v9.props.StringKey;
    v9.guiObjs = {};
    v9.defaultItemKey = "CancelButtonKey";
    if v9.props.DefaultButton == 0 then
        v9.defaultItemKey = "ComfirmButtonKey";
    end;
    v9.state = {
        currentItemKey = v9.defaultItemKey
    };
    v9.onSelectionGained = function(v10)
        v9:setState({
            currentItemKey = v10
        });
    end;
end;
v8.willUpdate = function(v11, v12, v13)
    v11.defaultItemKey = nil;
    if v11.props.InFocus == v12.InFocus then
        return ;
    else
        if v12.InFocus then
            v11.defaultItemKey = v13.currentItemKey;
        end;
        return ;
    end;
end;
v8.render = function(v14)
    local v15 = nil;
    if not v14.props.CallbackYes and v14.defaultItemKey == "ComfirmButtonKey" then
        v14.defaultItemKey = "CancelButtonKey";
    elseif not v14.props.CallbackNo and v14.defaultItemKey == "CancelButtonKey" then
        v14.defaultItemKey = "ComfirmButtonKey";
    end;
    if v14.props.CallbackYes then
        v15 = v2.createElement(v6, {
            Button = {
                Position = UDim2.new(0, 776, 1, -166), 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(0, 320, 0, 66)
            }, 
            Text = {
                Text = v14.props.ButtonTextYes, 
                TextXAlignment = Enum.TextXAlignment.Center
            }, 
            Focused = v14.props.InFocus and v14.state.currentItemKey == "ComfirmButtonKey", 
            Selected = v14.defaultItemKey == "ComfirmButtonKey", 
            OnSelectionGained = function()
                v14.onSelectionGained("ComfirmButtonKey");
            end, 
            OnActivated = function()
                v5:Play("ButtonPress");
                v14.props.CallbackYes();
            end
        });
    end;
    local v16 = nil;
    if not v14.props.CallbackNo then
        if v14.defaultItemKey == "CancelButtonKey" then
            v14.defaultItemKey = "ComfirmButtonKey";
        end;
    else
        v16 = v2.createElement(v6, {
            Button = {
                Position = UDim2.new(0, 1106, 1, -166), 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(0, 320, 0, 66)
            }, 
            Text = {
                Text = v14.props.ButtonTextNo, 
                TextXAlignment = Enum.TextXAlignment.Center
            }, 
            Focused = v14.props.InFocus and v14.state.currentItemKey == "CancelButtonKey", 
            Selected = v14.defaultItemKey == "CancelButtonKey", 
            OnSelectionGained = function()
                v14.onSelectionGained("CancelButtonKey");
            end, 
            OnActivated = function()
                v5:Play("ButtonPress");
                v14.props.CallbackNo();
            end
        });
    end;
    local v17 = v2.createElement("TextLabel", {
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 776, 0, 136), 
        BackgroundTransparency = 1, 
        Font = v4.RegularFont, 
        FontSize = v4.HeaderSize, 
        TextColor3 = v4.WhiteTextColor, 
        Text = v14.props.Title, 
        TextXAlignment = Enum.TextXAlignment.Left
    });
    local v18 = v2.createElement("TextLabel", {
        Size = UDim2.new(0, 762, 0, 304), 
        Position = UDim2.new(0, 776, 0, 200), 
        BackgroundTransparency = 1, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = v4.LightFont, 
        FontSize = v4.TitleSize, 
        TextColor3 = v4.WhiteTextColor, 
        TextWrapped = true, 
        Text = v14.props.Description
    });
    local l_ImageLabel_0 = v14.props.ImageLabel;
    if l_ImageLabel_0 == nil then
        l_ImageLabel_0 = v2.createElement("ImageLabel", {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v4.Images.LargeErrorIcon, 
            Size = UDim2.new(0, 321, 0, 264)
        });
    end;
    local v21 = v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 0.5), 
        Position = UDim2.new(0, 0, 0.5, 0), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 0.3, 
        [v2.Ref] = function(v20)
            v14.ref = v20;
        end
    }, {
        Container = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 640), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            BackgroundColor3 = v4.OverlayColor
        }, {
            ImageContainer = v2.createElement("Frame", {
                Size = UDim2.new(0, 576, 0, 642), 
                Position = UDim2.new(0, 100, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                reportImage = l_ImageLabel_0
            }), 
            TitleText = v17, 
            DescriptionText = v18, 
            CancelButton = v16, 
            ConfirmButton = v15
        })
    });
    local v22 = nil;
    if v14.props.CallbackBack then
        v22 = v2.createElement(v7, {
            StringKey = v14.key, 
            InFocus = true, 
            RedirectBack = function()
                v14.props.CallbackBack();
            end
        });
    end;
    return v2.createElement(v2.Portal, {
        target = l_CoreGui_0
    }, {
        [v14.key] = v2.createElement("ScreenGui", {
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            DisplayOrder = 1
        }, {
            ModalOverlay = v21, 
            RedirectObj = v22
        })
    });
end;
v8.didMount = function(v23)
    delay(0, function()
        v3.AddSelectionParent(v23.key, v23.ref);
    end);
    v5:Play("OverlayOpen");
end;
v8.willUnmount = function(v24)
    v3.RemoveSelectionGroup(v24.key);
end;
return v8;
