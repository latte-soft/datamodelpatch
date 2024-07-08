local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_RunService_0 = game:GetService("RunService");
local l_ImageSetLabel_0 = require(l_CorePackages_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.RoactMotion);
local l_GetImageData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageData;
local v9 = {
    BUTTON_FILL = 1, 
    BURST = 2, 
    DONE = 3
};
local v10 = v4.PureComponent:extend("QuickLaunchAnimation");
v10.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    ZIndex = 1
};
v10.init = function(v11)
    v11.state = {
        animationPhase = v9.BUTTON_FILL, 
        animationTick = tick()
    };
    v11.quickLaunchRef = v4.createRef();
    v11.onRewindDoneCallback = v11.props.onRewindDoneCallback;
    v11.renderSteppedCallback = function(_)
        if not (not v11.quickLaunchRef.current or v11.props.rewindAnimation) then
            local v13 = tick();
            local v14 = v13 - v11.state.animationTick;
            if v11.state.animationPhase == v9.BUTTON_FILL then
                if v14 >= 0.255 then
                    v11:setState({
                        animationPhase = v9.BURST, 
                        animationTick = v13
                    });
                    return ;
                end;
            elseif v11.state.animationPhase == v9.BURST and v14 >= 0.18 then
                v11:setState({
                    animationPhase = v9.DONE, 
                    animationTick = v13
                });
                v11.props.onAnimationDoneCallback();
            end;
        end;
    end;
end;
v10.render = function(v15)
    local l_Size_0 = v15.props.Size;
    local l_ZIndex_0 = v15.props.ZIndex;
    local l_gameCardHeight_0 = v15.props.gameCardHeight;
    local l_rewindAnimation_0 = v15.props.rewindAnimation;
    return v4.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        ZIndex = l_ZIndex_0, 
        ClipsDescendants = true, 
        [v4.Ref] = v15.quickLaunchRef
    }, {
        QuickGameLaunchBg = v4.createElement(v7.SimpleMotion, {
            defaultStyle = {
                frameSize = 0
            }, 
            style = {
                frameSize = not not l_rewindAnimation_0 and v7.spring(0, 600, 50, 0.05) or v7.spring(1.25, 200, 50, 0.01)
            }, 
            onRested = l_rewindAnimation_0 and v15.onRewindDoneCallback, 
            render = function(v20)
                local l_createElement_0 = v4.createElement;
                local v22 = "Frame";
                local v23 = {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    Size = UDim2.new(1, 0, v20.frameSize, 0), 
                    BackgroundTransparency = 0, 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v6.Color.GREEN_PRIMARY, 
                    ClipsDescendants = true
                };
                local v24 = {
                    PlayCircle = v4.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 1, -l_gameCardHeight_0 / 2), 
                        Size = UDim2.new(0, 70, 0, 70), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Image = l_GetImageData_0("LuaApp/graphic/gr-play-circle") or "LuaApp/graphic/gr-play-circle"
                    })
                };
                local v25 = false;
                if v9.BURST <= v15.state.animationPhase then
                    v25 = v4.createElement(v7.SimpleMotion, {
                        defaultStyle = {
                            scale = 0
                        }, 
                        style = {
                            scale = v7.spring(1.55, 640, 40, 0.2)
                        }, 
                        render = function(v26)
                            return v4.createElement("ImageLabel", {
                                AnchorPoint = Vector2.new(0.5, 0.5), 
                                Position = UDim2.new(0.5, 0, 1, -l_gameCardHeight_0 / 2), 
                                Size = UDim2.new(0, l_gameCardHeight_0 * v26.scale, 0, l_gameCardHeight_0 * v26.scale), 
                                BackgroundTransparency = 1, 
                                BorderSizePixel = 0, 
                                Image = "rbxasset://textures/ui/LuaApp/graphic/gr-bloom-circle.png", 
                                ImageColor3 = v6.Color.WHITE, 
                                SizeConstraint = Enum.SizeConstraint.RelativeYY
                            });
                        end
                    });
                end;
                v24.BloomCircle = v25;
                return l_createElement_0(v22, v23, v24);
            end
        }), 
        renderStepped = not l_rewindAnimation_0 and v4.createElement(v5, {
            event = l_RunService_0.renderStepped, 
            callback = v15.renderSteppedCallback
        })
    });
end;
return v10;
