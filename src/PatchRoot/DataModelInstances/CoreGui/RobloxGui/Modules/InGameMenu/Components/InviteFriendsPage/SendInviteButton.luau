local l_RunService_0 = game:GetService("RunService");
local v1 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_InviteStatus_0 = require(script.Parent.Parent.Parent.Resources.Constants).InviteStatus;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v11 = l_Roact_0.PureComponent:extend("SendInviteButton");
v11.validateProps = l_t_0.strictInterface({
    onActivated = l_t_0.callback, 
    animationBegun = l_t_0.callback, 
    animationEnded = l_t_0.callback, 
    userInviteStatus = l_t_0.optional(l_t_0.string)
});
local function _(v12, v13, v14)
    return (v12 - v13 / 30) / ((v14 - v13) / 30);
end;
local function _(v16, v17, v18)
    local v19 = false;
    if v17 / 30 <= v16 then
        v19 = v16 <= v18 / 30;
    end;
    return v19;
end;
local v31 = {
    [l_InviteStatus_0.Pending] = function(v21, v22)
        v22.sendTransparency(0.375 + 0.375 * math.sin(6.283185307179586 * v21));
    end, 
    [l_InviteStatus_0.Success] = function(v23, v24, v25)
        local v26 = false;
        if v23 >= 0 then
            v26 = v23 <= 0.13333333333333333;
        end;
        if not v26 then
            v26 = false;
            if v23 >= 0.13333333333333333 then
                v26 = v23 <= 0.3;
            end;
            if not v26 then
                v24.successSize(1);
                v25();
                return ;
            else
                v24.sendTransparency(1);
                v24.successTransparency(0);
                v24.successSize(0.75 + 0.25 * ((v23 - 0.13333333333333333) / 0.16666666666666666));
                return ;
            end;
        else
            v26 = (v23 - 0) / 0.13333333333333333;
            v24.sendTransparency(v26);
            v24.successTransparency(1 - v26);
            v24.successSize(0.75 + 0.75 * (1 - v26));
            return ;
        end;
    end, 
    [l_InviteStatus_0.Failed] = function(v27, v28, v29)
        local v30 = false;
        if v27 >= 0 then
            v30 = v27 <= 0.06666666666666667;
        end;
        if not v30 then
            v30 = false;
            if v27 >= 0.06666666666666667 then
                v30 = v27 <= 1.7333333333333334;
            end;
            if not v30 then
                v30 = false;
                if v27 >= 1.7333333333333334 then
                    v30 = v27 <= 1.9;
                end;
                if not v30 then
                    v28.sendTransparency(0);
                    v29();
                else
                    v28.sendTransparency(1 - (v27 - 1.7333333333333334) / 0.16666666666666666);
                end;
            else
                v28.sendTransparency(1);
            end;
        else
            v28.sendTransparency((v27 - 0) / 0.13333333333333333);
        end;
        v30 = false;
        if v27 >= 0 then
            v30 = v27 <= 0.13333333333333333;
        end;
        if not v30 then
            v30 = false;
            if v27 >= 0.13333333333333333 then
                v30 = v27 <= 1.4;
            end;
            if not v30 then
                v30 = false;
                if v27 >= 1.4 then
                    v30 = v27 <= 1.5666666666666667;
                end;
                if not v30 then
                    v28.failTransparency(1);
                    return ;
                else
                    v28.failPos(0);
                    v28.failTransparency((v27 - 1.4) / 0.16666666666666666);
                    return ;
                end;
            else
                v28.failTransparency(0);
                v30 = v27 - 0.13333333333333333;
                v28.failPos((-0.4 * 2.71828182846 ^ (-v30 * 8)) * math.sin(v30 * 40));
                return ;
            end;
        else
            v28.failTransparency(1 - (v27 - 0) / 0.13333333333333333);
            return ;
        end;
    end
};
v11.init = function(v32, v33)
    local v34, v35 = l_Roact_0.createBinding(0);
    local v36, v37 = l_Roact_0.createBinding(1);
    local v38, v39 = l_Roact_0.createBinding(1);
    local v40, v41 = l_Roact_0.createBinding(1);
    local v42, v43 = l_Roact_0.createBinding(0);
    v32.bindings = {
        sendTransparency = v34, 
        successTransparency = v36, 
        failTransparency = v38, 
        successSize = v40:map(function(v44)
            return UDim2.new(v44, 0, v44, 0);
        end), 
        failPos = v42:map(function(v45)
            return UDim2.new(v45, 0, 0, 0);
        end)
    };
    v32.updateBindings = {
        sendTransparency = v35, 
        successTransparency = v37, 
        failTransparency = v39, 
        successSize = v41, 
        failPos = v43
    };
    if v33.userInviteStatus == l_InviteStatus_0.Success then
        v37(0);
        v35(1);
    end;
end;
v11.renderWithSelectionCursor = function(v46, v47)
    local l_props_0 = v46.props;
    return l_withStyle_0(function(v49)
        return l_Roact_0.createElement("TextButton", {
            Selectable = false, 
            Size = UDim2.new(0, 36, 0, 36), 
            BackgroundTransparency = 1, 
            Text = "", 
            SelectionImageObject = v47(l_CursorKind_0.InputFields), 
            [l_Roact_0.Event.Activated] = function()
                local v50 = l_props_0.userInviteStatus == l_InviteStatus_0.Pending;
                local v51 = l_props_0.userInviteStatus == l_InviteStatus_0.Success;
                if not ((v46.renderSteppedConnection or v50) or v51) then
                    l_props_0.onActivated();
                end;
            end
        }, {
            SendLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/actions/friends/friendInvite"], 
                Size = UDim2.new(1, 0, 1, 0), 
                ImageColor3 = v49.Theme.IconEmphasis.Color, 
                ImageTransparency = v46.bindings.sendTransparency
            }), 
            SuccessLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/status/success"], 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                ImageColor3 = v49.Theme.IconEmphasis.Color, 
                ImageTransparency = v46.bindings.successTransparency, 
                Size = v46.bindings.successSize
            }), 
            FailLabel = l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/status/alert"], 
                Size = UDim2.new(1, 0, 1, 0), 
                ImageColor3 = v49.Theme.IconEmphasis.Color, 
                ImageTransparency = v46.bindings.failTransparency, 
                Position = v46.bindings.failPos
            })
        });
    end);
end;
v11.render = function(v52)
    return l_withSelectionCursorProvider_0(function(v53)
        return v52:renderWithSelectionCursor(v53);
    end);
end;
v11.didUpdate = function(v54, v55)
    if v54.props.userInviteStatus and v54.props.userInviteStatus ~= v55.userInviteStatus then
        v54:playAnimation(v31[v54.props.userInviteStatus]);
    end;
end;
v11.didMount = function(v56)
    if v56.props.userInviteStatus then
        v56:playAnimation(v31[v56.props.userInviteStatus]);
    end;
end;
v11.playAnimation = function(v57, v58)
    v57.animationStartTime = tick();
    v57.animationFunction = v58;
    if not v57.renderSteppedConnection then
        v57.renderSteppedConnection = l_RunService_0.RenderStepped:Connect(function()
            v57.animationFunction(tick() - v57.animationStartTime, v57.updateBindings, function()
                v57:stopAnimation();
            end);
        end);
        v57.props.animationBegun();
    end;
end;
v11.stopAnimation = function(v59)
    if v59.renderSteppedConnection then
        v59.renderSteppedConnection:Disconnect();
        v59.renderSteppedConnection = nil;
        v59.props.animationEnded();
    end;
end;
v11.willUnmount = function(v60)
    v60:stopAnimation();
end;
return v11;
