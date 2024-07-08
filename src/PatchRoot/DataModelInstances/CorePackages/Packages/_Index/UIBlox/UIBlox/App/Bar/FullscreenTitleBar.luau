local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Otter);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_0.Button.IconButton);
local v7 = require(l_Parent_0.ImageSet.Images);
local v8 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v9 = require(l_Parent_0.ImageSet.getIconSize);
local v10 = require(l_Parent_2.UIBlox.Core.Control.Enum.ControlState);
local v11 = require(l_Parent_1.Core.Style.withStyle);
local v12 = require(l_Parent_1.Core.Bar.ThreeSectionBar);
local v13 = require(l_Parent_2.UIBlox.Utility.lerp);
local v14 = require(l_Parent_2.UIBlox.Utility.divideTransparency);
local v15 = UDim2.new(0, 0, 0, -88);
local v16 = UDim2.fromOffset(0, 0);
local v17 = {
    frequency = 5
};
local v18 = v3.PureComponent:extend("FullscreenTitleBar");
v18.validateProps = v5.strictInterface({
    title = v5.string, 
    isTriggered = v5.optional(v5.boolean), 
    onDisappear = v5.optional(v5.callback), 
    onHover = v5.optional(v5.callback), 
    exitFullscreen = v5.optional(v5.callback), 
    closeRoblox = v5.optional(v5.callback)
});
v18.init = function(v19)
    local v20 = not v19.props.isTriggered and 0 or 1;
    local v21 = nil;
    local v22, v23 = v3.createBinding(v20);
    v19.progress = v22;
    v21 = v23;
    v22, v23 = v3.createBinding(v10.Default);
    v19.exitControlState = v22;
    v19.setExitControlState = v23;
    v22, v23 = v3.createBinding(v10.Default);
    v19.closeControlState = v22;
    v19.setCloseControlState = v23;
    v19.titleBarPosition = v19.progress:map(function(v24)
        return v15:lerp(v16, v24);
    end);
    v19.progressMotor = v4.createSingleMotor(v20);
    v19.progressMotor:onStep(v21);
end;
v18.render = function(v25)
    return v11(function(v26)
        local l_Theme_0 = v26.Theme;
        local l_Font_0 = v26.Font;
        local l_BackgroundUIDefault_0 = l_Theme_0.BackgroundUIDefault;
        local l_TextEmphasis_0 = l_Theme_0.TextEmphasis;
        local l_Header2_0 = l_Font_0.Header2;
        local v32 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
        local v34 = v25.progress:map(function(v33)
            return v13(1, l_BackgroundUIDefault_0.Transparency, v33);
        end);
        local v36 = v3.joinBindings({
            progress = v25.progress, 
            controlState = v25.exitControlState
        }):map(function(v35)
            return v13(1, v14(l_Theme_0.ContextualPrimaryDefault.Transparency, v35.controlState == v10.Pressed and 2 or 1), v35.progress);
        end);
        local v38 = v3.joinBindings({
            progress = v25.progress, 
            controlState = v25.closeControlState
        }):map(function(v37)
            return v13(1, v14(l_Theme_0.ContextualPrimaryDefault.Transparency, v37.controlState == v10.Pressed and 2 or 1), v37.progress);
        end);
        local v40 = v25.progress:map(function(v39)
            return v13(1, l_TextEmphasis_0.Transparency, v39);
        end);
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Position = v25.titleBarPosition, 
            Size = UDim2.new(1, 0, 0, 88)
        }, {
            BarFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Position = UDim2.fromOffset(0, 0), 
                Size = UDim2.new(1, 0, 0, 64), 
                [v3.Event.MouseLeave] = v25.props.onDisappear, 
                [v3.Event.MouseEnter] = v25.props.onHover
            }, {
                ThreeSectionBar = v3.createElement(v12, {
                    BackgroundColor3 = l_BackgroundUIDefault_0.Color, 
                    BackgroundTransparency = v34, 
                    barHeight = 64, 
                    marginLeft = 20, 
                    contentPaddingLeft = UDim.new(0, 12), 
                    renderLeft = function()
                        local v41 = v9(v8.Medium);
                        return v3.createFragment({
                            First = v3.createElement("ImageLabel", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.fromOffset(v41, v41)
                            }), 
                            Second = v3.createElement("ImageLabel", {
                                BackgroundTransparency = 1, 
                                Size = UDim2.fromOffset(v41, v41)
                            })
                        });
                    end, 
                    renderCenter = function()
                        return v3.createElement("TextLabel", {
                            BackgroundTransparency = 1, 
                            Font = l_Header2_0.Font, 
                            Size = UDim2.new(1, 0, 0, v32), 
                            Text = v25.props.title, 
                            TextColor3 = l_TextEmphasis_0.Color, 
                            TextSize = v32, 
                            TextTransparency = v40, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextWrapped = false
                        });
                    end, 
                    marginRight = 20, 
                    contentPaddingRight = UDim.new(0, 12), 
                    renderRight = function()
                        return v3.createFragment({
                            ExitButton = v3.createElement(v6, {
                                icon = v7["icons/actions/previewShrink"], 
                                iconSize = v8.Medium, 
                                iconTransparency = v36, 
                                onActivated = v25.props.exitFullscreen, 
                                layoutOrder = 1, 
                                onStateChanged = function(_, v43)
                                    v25.setExitControlState(v43);
                                end
                            }), 
                            CloseButton = v3.createElement(v6, {
                                icon = v7["icons/navigation/close"], 
                                iconSize = v8.Medium, 
                                iconTransparency = v38, 
                                onActivated = v25.props.closeRoblox, 
                                layoutOrder = 2, 
                                onStateChanged = function(_, v45)
                                    v25.setCloseControlState(v45);
                                end
                            })
                        });
                    end
                })
            }), 
            ShadowFrame = v3.createElement("Frame", {
                BackgroundTransparency = l_BackgroundUIDefault_0.Transparency, 
                BackgroundColor3 = l_BackgroundUIDefault_0.Color, 
                BorderSizePixel = 0, 
                Position = UDim2.fromOffset(0, 64), 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                UIGradient = v3.createElement("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)), 
                        ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
                    }), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.75), 
                        NumberSequenceKeypoint.new(1, 1)
                    })
                })
            })
        });
    end);
end;
v18.didMount = function(v46)
    v46.progressMotor:start();
end;
v18.didUpdate = function(v47, v48, _)
    if v48.isTriggered ~= v47.props.isTriggered then
        v47.progressMotor:setGoal(v4.spring(not v47.props.isTriggered and 0 or 1, v17));
    end;
end;
v18.willUnmount = function(v50)
    v50.progressMotor:destroy();
end;
return v18;
