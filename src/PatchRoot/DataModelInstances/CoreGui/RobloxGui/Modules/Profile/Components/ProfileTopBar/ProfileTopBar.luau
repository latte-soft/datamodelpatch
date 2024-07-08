local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_t_0 = v1.t;
local v9 = require(l_Parent_0.Common.Constants);
local v10 = l_Images_0["icons/navigation/close"];
local v11 = l_Images_0["icons/navigation/pushBack"];
local v12 = l_Roact_0.PureComponent:extend("ProfileTopBar");
v12.validateProps = l_t_0.strictInterface({
    navigateBack = l_t_0.callback, 
    statusBarHeight = l_t_0.number, 
    showCloseIcon = l_t_0.boolean
});
v12.init = function(v13)
    local l_props_0 = v13.props;
    v13.onNavigationButtonActivated = function()
        if v13.isMounted then
            l_props_0.navigateBack();
        end;
    end;
end;
v12.didMount = function(v15)
    v15.isMounted = true;
end;
v12.willUnmount = function(v16)
    v16.isMounted = false;
end;
v12.render = function(v17)
    return l_withStyle_0(function(v18)
        return v17:renderWithProviders(v18);
    end);
end;
v12.renderWithProviders = function(v19, v20)
    local l_props_1 = v19.props;
    local l_statusBarHeight_0 = l_props_1.statusBarHeight;
    return l_Roact_0.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 0, l_statusBarHeight_0 + v9.NavBarHeight), 
        BackgroundTransparency = 0, 
        Active = true, 
        BackgroundColor3 = v20.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0
    }, {
        LeftNavigationButton = l_Roact_0.createElement("TextButton", {
            Position = UDim2.new(0, 15, 0, l_statusBarHeight_0), 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            [l_Roact_0.Event.Activated] = v19.onNavigationButtonActivated
        }, {
            CloseButtonImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 36, 0, 36), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = not not l_props_1.showCloseIcon and v10 or v11, 
                ImageColor3 = v20.Theme.SystemPrimaryDefault.Color, 
                ImageTransparency = v20.Theme.SystemPrimaryDefault.Transparency, 
                BackgroundTransparency = 1
            })
        })
    });
end;
return (l_RoactRodux_0.connect(function(v23, _)
    return {
        statusBarHeight = v23.TopBar.statusBarHeight
    };
end, nil)(v12));
