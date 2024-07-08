local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.SocialCommon);
local v7 = require(l_Parent_1.UIBlox);
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_InputUtilities_0 = v6.Utils.InputUtilities;
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useExternalEvent_0 = v7.Core.Hooks.useExternalEvent;
local l_useStyle_0 = v7.Core.Style.useStyle;
local v14 = require(l_Parent_0.Thunks.CarouselNavigated);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_Parent_0.Analytics.EventNames);
local v17 = require(l_Parent_0.Analytics.useAnalytics);
local v18 = l_Images_0["icons/actions/cycleLeft"];
local v19 = l_Images_0["icons/actions/cycleRight"];
return function(v20)
    local v21 = v17();
    local v22 = l_useDispatch_0();
    local v23 = l_useStyle_0();
    local v24 = v4.useRef(nil);
    local v25 = v20.direction == v15.CarouselDirection.Left;
    local v26 = if not v25 then Vector2.new(1, 0.5) else Vector2.new(0, 0.5);
    local v27 = if not v25 then v19 else v18;
    local v28 = if not v25 then UDim2.fromScale(1, 0.5) else UDim2.fromScale(0, 0.5);
    v4.useEffect(function()
        return function()
            if v24.current then
                v24.current:Disconnect();
                v24.current = nil;
            end;
        end;
    end, {});
    v4.useEffect(function()
        if not (not v20.isDisabled or not v24.current) then
            v24.current:Disconnect();
            v24.current = nil;
        end;
    end, {
        v20.isDisabled
    });
    local v34 = v4.useCallback(function(_, v30)
        if not v20.isDisabled then
            if v30.UserInputState ~= Enum.UserInputState.Begin then
                return ;
            elseif l_InputUtilities_0.isActivationInput(v30) then
                if v24.current then
                    v24.current:Disconnect();
                    v24.current = nil;
                end;
                v21.fireEvent(v16.CapturesCarouselNavigated, {
                    direction = v20.direction
                });
                v22(v14(v20.direction));
                local v31 = tick();
                local l_v31_0 = v31;
                v24.current = l_RunService_0.RenderStepped:Connect(function(_)
                    if math.max(0.5 / (tick() - l_v31_0), 0.15) < tick() - v31 then
                        v21.fireEvent(v16.CapturesCarouselNavigated, {
                            direction = v20.direction
                        });
                        v22(v14(v20.direction));
                        v31 = tick();
                    end;
                end);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end, {
        v20.isDisabled
    });
    local v37 = v4.useCallback(function(_, v36)
        if not (not l_InputUtilities_0.isActivationInput(v36) or not v24.current) then
            v24.current:Disconnect();
            v24.current = nil;
        end;
    end, {});
    l_useExternalEvent_0(l_UserInputService_0.InputEnded, function(v38)
        if not (not l_InputUtilities_0.isActivationInput(v38) or not v24.current) then
            v24.current:Disconnect();
            v24.current = nil;
        end;
    end);
    return v4.createElement("TextButton", {
        AnchorPoint = v26, 
        BackgroundTransparency = 1, 
        Position = v28, 
        Size = v20.Size, 
        Text = "", 
        ZIndex = v20.ZIndex, 
        Visible = not v20.isDisabled, 
        [v4.Event.InputBegan] = v34, 
        [v4.Event.InputEnded] = v37
    }, {
        Arrow = v4.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Image = v27, 
            ImageColor3 = v23.Theme.IconEmphasis.Color, 
            ImageTransparency = v23.Theme.IconEmphasis.Transparency, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(36, 36)
        })
    });
end;
