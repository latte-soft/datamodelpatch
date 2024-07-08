local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Flags.getFFlagDeprecatedSocialLibrariesCells);
local l_Cryo_0 = v1.Cryo;
local l_Roact_0 = v1.Roact;
local v5 = l_Roact_0.PureComponent:extend("BaseCell");
v5.defaultProps = {
    Size = UDim2.new(1, 0, 0, 48), 
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
    onPressedBackgroundColor3 = Color3.fromRGB(242, 242, 242), 
    onPressedBackgroundTransparency = 1, 
    LayoutOrder = 0, 
    onActivated = function()
        print("BaseCell onActivated");
    end, 
    showDivider = true, 
    dividerTransparency = 0, 
    dividerColor3 = Color3.fromRGB(227, 227, 227)
};
v5.init = function(v6)
    assert(not v2(), "social-libraries Cells are deprecated, please use Cell components from app-chat rotriever package");
    v6:setState({
        isPressed = false
    });
    v6.touchFunction = function()
        return function(_, v8)
            if not (v8.UserInputType ~= Enum.UserInputType.MouseButton1) or v8.UserInputType == Enum.UserInputType.Touch then
                v6:setState({
                    isPressed = v8.UserInputState == Enum.UserInputState.Begin
                });
            end;
        end;
    end;
end;
v5.render = function(v9)
    local v10 = {};
    if v9.state.isPressed then
        v10.overlay = l_Roact_0.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = v9.props.onPressedBackgroundTransparency, 
            BackgroundColor3 = v9.props.onPressedBackground3, 
            BorderSizePixel = 0
        });
    end;
    if v9.props.showDivider then
        v10.divider = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right
            }), 
            divider = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = v9.props.dividerTransparency, 
                BackgroundColor3 = v9.props.dividerColor3, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -60, 0, 1)
            })
        });
    end;
    return l_Roact_0.createElement("ImageButton", {
        AutoButtonColor = false, 
        Size = v9.props.Size, 
        BackgroundColor3 = v9.props.BackgroundColor3, 
        LayoutOrder = v9.props.LayoutOrder, 
        BorderSizePixel = 0, 
        [l_Roact_0.Event.Activated] = v9.props.onActivated, 
        [l_Roact_0.Event.InputBegan] = v9.touchFunction(), 
        [l_Roact_0.Event.InputEnded] = v9.touchFunction()
    }, l_Cryo_0.Dictionary.join(v9.props[l_Roact_0.Children] or {}, v10));
end;
return v5;
