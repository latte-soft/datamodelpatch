local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_Modules_0.Shell.Utility);
local v4 = require(l_Modules_0.Shell.GlobalSettings);
local v5 = require(l_Modules_0.Shell.Components.Common.SoundComponent);
local v6 = v1.PureComponent:extend("RoundedButton");
v6.init = function(v7)
    v7.selectionImageObject = v3.Create("ImageLabel")({
        Name = "SelectorImage", 
        Image = v4.Images.ButtonSelector, 
        Position = UDim2.new(0, -7, 0, -7), 
        Size = UDim2.new(1, 14, 1, 14), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(31, 31, 63, 63)
    });
    v7.defaultProps = {
        ImageColor3 = v4.Colors.WhiteButton, 
        ImageTransparency = 0.8, 
        TextColor3 = v4.Colors.WhiteText
    };
    v7.focusedProps = {
        ImageColor3 = v4.Colors.BlueButton, 
        ImageTransparency = 0, 
        TextColor3 = v4.Colors.TextSelected
    };
    v7.disabledProps = {
        ImageColor3 = v4.Colors.WhiteButton, 
        ImageTransparency = 1, 
        TextColor3 = v4.Colors.WhiteText
    };
    v7.buttonImage = v4.Images.ButtonDefault;
    v7.onCreate = function(v8)
        v7.ref = v8;
    end;
end;
v6.render = function(v9)
    local v10 = v9.props.Button or {};
    local v11 = v9.props.Text or {};
    local v12 = v9.props.DefaultProps or {};
    local v13 = {};
    for v14 in pairs(v9.defaultProps) do
        v13[v14] = v12[v14] or v9.defaultProps[v14];
    end;
    local v15 = v9.props.FocusedProps or {};
    local v16 = {};
    for v17 in pairs(v9.focusedProps) do
        v16[v17] = v15[v17] or v9.focusedProps[v17];
    end;
    local v18 = v9.props.DisabledProps or {};
    local v19 = {};
    for v20 in pairs(v9.disabledProps) do
        v19[v20] = v18[v20] or v9.disabledProps[v20];
    end;
    if not v9.props.HideSelectionImage then
        v9.selectionImageObject.Visible = true;
    else
        v9.selectionImageObject.Visible = false;
    end;
    local v21 = true;
    if v10.Selectable == false then
        v21 = false;
    end;
    local l_v13_0 = v13;
    if not v9.props.Disabled then
        if v9.props.Focused then
            l_v13_0 = v16;
        end;
    else
        l_v13_0 = v19;
        v21 = v10.Selectable or false;
    end;
    return v1.createElement("ImageButton", v2.JoinDictionaries({
        Image = v9.buttonImage, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Selectable = v21, 
        [v1.Ref] = v9.onCreate, 
        [v1.Event.SelectionGained] = v9.props.OnSelectionGained, 
        [v1.Event.SelectionLost] = v9.props.OnSelectionLost, 
        [v1.Event.Activated] = v9.props.OnActivated, 
        ImageColor3 = l_v13_0.ImageColor3, 
        ImageTransparency = l_v13_0.ImageTransparency, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        SelectionImageObject = v9.selectionImageObject, 
        BackgroundTransparency = 1
    }, v10), v2.JoinDictionaries({
        Label = v1.createElement("TextLabel", (v2.JoinDictionaries({
            Text = "", 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Font = v4.Fonts.Regular, 
            TextSize = v4.TextSizes.Button, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_v13_0.TextColor3, 
            TextTransparency = l_v13_0.TextTransparency, 
            BackgroundTransparency = 1
        }, v11))), 
        MoveSelection = v1.createElement(v5, {
            SoundName = "MoveSelection"
        })
    }, v9.props[v1.Children] or {}));
end;
v6.didMount = function(v23)
    delay(0, function()
        if v23.props.Selected then
            v3.SetSelectedCoreObject(v23.ref);
        end;
    end);
end;
v6.didUpdate = function(v24, v25, _)
    if not (v25.Selected or not v24.props.Selected) then
        v3.SetSelectedCoreObject(v24.ref);
    end;
end;
return v6;
