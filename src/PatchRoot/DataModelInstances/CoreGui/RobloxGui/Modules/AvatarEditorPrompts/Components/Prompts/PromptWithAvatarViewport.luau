local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local l_InteractiveAlert_0 = require(l_CorePackages_0.UIBlox).App.Dialog.Alert.InteractiveAlert;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v7 = require(l_Parent_0.HumanoidViewport);
local v8 = require(l_Parent_1.GetConformedHumanoidDescription);
local v9 = v1.PureComponent:extend("PromptWithAvatarViewport");
v9.validateProps = v3.strictInterface({
    humanoidDescription = v3.instanceOf("HumanoidDescription"), 
    rigType = v3.enum(Enum.HumanoidRigType), 
    title = v3.string, 
    bodyText = v3.optional(v3.string), 
    buttonStackInfo = v3.table, 
    screenSize = v3.Vector2
});
v9.init = function(v10)
    v10.mounted = false;
    v10.middleContentRef = v1.createRef();
    local v11, v12 = v1.createBinding(UDim2.new(1, 0, 0, 200));
    v10.contentSize = v11;
    v10.updateContentSize = v12;
    v10:setState({
        conformedHumanoidDescription = nil, 
        getConformedDescriptionFailed = false
    });
    v10.onAlertSizeChanged = function(v13)
        local l_AbsoluteSize_0 = v13.AbsoluteSize;
        if v10.middleContentRef:getValue() then
            local l_Y_0 = v10.middleContentRef:getValue().AbsoluteSize.Y;
            local v16 = (v10.props.screenSize.Y - 60) - (l_AbsoluteSize_0.Y - l_Y_0);
            local v17 = v10.middleContentRef:getValue().AbsoluteSize.X - 20;
            if v17 < v16 then
                v16 = v17;
            end;
            if l_Y_0 ~= v16 then
                v10.updateContentSize(UDim2.new(1, 0, 0, v16));
            end;
            return ;
        else
            return ;
        end;
    end;
    v10.retryLoadDescription = function()
        v10:setState({
            getConformedDescriptionFailed = false
        });
        v10:getConformedHumanoidDescription();
    end;
end;
v9.renderAlertMiddleContent = function(v18)
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = v18.contentSize, 
        [v1.Ref] = v18.middleContentRef
    }, {
        HumanoidViewport = v1.createElement(v7, {
            humanoidDescription = v18.state.conformedHumanoidDescription, 
            loadingFailed = v18.state.getConformedDescriptionFailed, 
            retryLoadDescription = v18.retryLoadDescription, 
            rigType = v18.props.rigType
        })
    });
end;
v9.render = function(v19)
    return v1.createElement(l_InteractiveAlert_0, {
        title = v19.props.title, 
        bodyText = v19.props.bodyText, 
        buttonStackInfo = v19.props.buttonStackInfo, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v19.props.screenSize, 
        middleContent = function()
            return v19:renderAlertMiddleContent();
        end, 
        onAbsoluteSizeChanged = v19.onAlertSizeChanged, 
        isMiddleContentFocusable = false
    });
end;
v9.getConformedHumanoidDescription = function(v20, v21)
    v8(v21, true):andThen(function(v22)
        if v20.mounted then
            v20:setState({
                conformedHumanoidDescription = v22
            });
            return ;
        else
            return ;
        end;
    end, function(_)
        if v20.mounted then
            v20:setState({
                getConformedDescriptionFailed = true
            });
            return ;
        else
            return ;
        end;
    end);
end;
v9.didMount = function(v24)
    v24.mounted = true;
    v24:getConformedHumanoidDescription(v24.props.humanoidDescription);
end;
v9.didUpdate = function(v25, v26, _)
    if v26.humanoidDescription ~= v25.props.humanoidDescription then
        v25:setState({
            conformedHumanoidDescription = v1.None, 
            getConformedDescriptionFailed = false
        });
        v25:getConformedHumanoidDescription(v25.props.humanoidDescription);
    end;
end;
v9.willUnmount = function(v28)
    v28.mounted = false;
end;
return (v2.connect(function(v29)
    return {
        screenSize = v29.screenSize
    };
end, nil)(v9));
