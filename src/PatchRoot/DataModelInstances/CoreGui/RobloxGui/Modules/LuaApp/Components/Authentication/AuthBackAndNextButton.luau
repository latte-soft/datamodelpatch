local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.withLocalization);
local v5 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v6 = require(l_Modules_0.LuaApp.Components.SystemPrimaryButtonRetheme);
local v7 = require(l_Modules_0.LuaApp.Components.SecondaryButtonRetheme);
local v8 = v2.PureComponent:extend("AuthBackAndContinueButton");
v8.defaultProps = {
    size = UDim2.new(1, 0, 0, 36)
};
v8.init = function(v9)
    v9.backButtonOnActivated = function()
        local l_navigateBack_0 = v9.props.navigateBack;
        local l_backButtonIsDisabled_0 = v9.props.backButtonIsDisabled;
        local l_backButtonIsLoading_0 = v9.props.backButtonIsLoading;
        if not (l_backButtonIsDisabled_0 or l_backButtonIsLoading_0) then
            l_navigateBack_0();
        end;
    end;
end;
v8.render = function(v13)
    local l_size_0 = v13.props.size;
    local l_position_0 = v13.props.position;
    local l_anchorPoint_0 = v13.props.anchorPoint;
    local l_layoutOrder_0 = v13.props.layoutOrder;
    local l_backButtonIsDisabled_1 = v13.props.backButtonIsDisabled;
    local l_backButtonIsLoading_1 = v13.props.backButtonIsLoading;
    local l_nextButtonText_0 = v13.props.nextButtonText;
    local l_nextButtonIsDisabled_0 = v13.props.nextButtonIsDisabled;
    local l_nextButtonIsLoading_0 = v13.props.nextButtonIsLoading;
    local l_nextButtonOnActivated_0 = v13.props.nextButtonOnActivated;
    return v4({
        backButtonText = "CommonUI.Controls.Action.Back"
    })(function(v24)
        return v2.createElement("Frame", {
            Size = l_size_0, 
            Position = l_position_0, 
            AnchorPoint = l_anchorPoint_0, 
            LayoutOrder = l_layoutOrder_0, 
            BackgroundTransparency = 1
        }, {
            BackButton = v2.createElement(v7, {
                Size = UDim2.new(0.5, -6, 1, 0), 
                Text = v24.backButtonText, 
                isDisabled = l_backButtonIsDisabled_1, 
                isLoading = l_backButtonIsLoading_1, 
                onActivated = v13.backButtonOnActivated
            }), 
            NextButton = v2.createElement(v6, {
                Size = UDim2.new(0.5, -6, 1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                Text = l_nextButtonText_0, 
                isDisabled = l_nextButtonIsDisabled_0, 
                isLoading = l_nextButtonIsLoading_0, 
                onActivated = l_nextButtonOnActivated_0
            })
        });
    end);
end;
return (v3.connect(nil, function(v25)
    return {
        navigateBack = function()
            return v25(v5());
        end
    };
end)(v8));
