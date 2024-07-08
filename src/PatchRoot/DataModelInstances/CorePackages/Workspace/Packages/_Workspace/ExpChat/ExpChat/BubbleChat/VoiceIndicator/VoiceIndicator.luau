local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v5 = require(l_Parent_0.UIBlox);
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local v8 = require(script:FindFirstAncestor("BubbleChat").Helpers.getVoiceIndicatorIcon);
local v9 = require(l_Parent_0.Roact);
local v10 = require(l_Parent_0.RoactRodux);
local v11 = v9.PureComponent:extend("VoiceIndicator");
v11.defaultProps = {};
v11.init = function(v12)
    local v13, v14 = v9.createBinding(0);
    v12.level = v13;
    v12.updateLevel = v14;
    v13, v14 = v9.createBinding(v12.props.voiceState);
    v12.voiceState = v13;
    v12.updateVoiceState = v14;
    v12.renderStepName = l_HttpService_0:GenerateGUID();
    l_RunService_0:BindToRenderStep(v12.renderStepName, 1, function()
        v12.updateLevel(math.random());
    end);
    v12.levelIcon = v9.joinBindings({
        v12.voiceState, 
        v12.level
    }):map(function(v15)
        return v8(v12.props.getIcon, v15[1], v15[2], v12.props.iconStyle);
    end);
    v12.onClicked = function()
        if not (not v12.props.onClicked or not v12.props.userId) then
            v12.props.onClicked(v12.props.userId);
        end;
    end;
end;
v11.renderWithSelectionCursor = function(v16, v17)
    local v18 = true;
    if v16.props.voiceState ~= "Error" then
        v18 = v16.props.voiceState == "Hidden";
    end;
    if not v16.props.hideOnError or v16.props.voiceState and not v18 then
        local v19 = v16.props.voiceState == "LOCAL_MUTED" and 0.5 or 0;
        if v16.props.iconTransparency then
            local l_v19_0 = v19;
            v19 = if type(v16.props.iconTransparency) ~= "number" then v16.props.iconTransparency:map(function(v21)
                return 1 - (1 - v21) * (1 - l_v19_0);
            end) else 1 - (1 - v16.props.iconTransparency) * (1 - l_v19_0);
        end;
        return v9.createElement("ImageButton", {
            Size = v16.props.size or UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v16.levelIcon, 
            ImageTransparency = v19, 
            SelectionImageObject = v17(l_CursorKind_0.RoundedRectNoInset), 
            [v9.Event.Activated] = v16.onClicked
        });
    else
        return nil;
    end;
end;
v11.render = function(v22)
    return l_withSelectionCursorProvider_0(function(v23)
        return v22:renderWithSelectionCursor(v23);
    end);
end;
v11.didUpdate = function(v24, v25, _)
    v2:trace("Voice state updated to {} for ...{}", v24.props.voiceState, (string.sub(tostring(v24.props.userId), -4)));
    if v25.voiceState ~= v24.props.voiceState then
        v24.updateVoiceState(v24.props.voiceState);
    end;
end;
v11.willUnmount = function(v27)
    pcall(function()
        l_RunService_0:UnbindFromRenderStep(v27.renderStepName);
    end);
end;
return v10.connect(function(v28, v29)
    return {
        voiceState = v28.Voice.participants[v29.userId]
    };
end)(v11);
