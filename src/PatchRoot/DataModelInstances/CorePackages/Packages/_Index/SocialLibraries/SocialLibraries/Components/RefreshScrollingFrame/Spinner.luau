local l_RunService_0 = game:GetService("RunService");
local v1 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Cryo_0 = v1.Cryo;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v9 = require(script.Parent.ExternalEventConnection);
local v10 = l_Roact_0.PureComponent:extend("Spinner");
v10.defaultProps = {
    Size = UDim2.new(0, 20, 0, 20), 
    spinSpeed = 540
};
v10.validateProps = l_t_0.interface({
    isSpinning = l_t_0.optional(l_t_0.boolean), 
    spinSpeed = l_t_0.optional(l_t_0.number), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    ImageColor3 = l_t_0.optional(l_t_0.Color3), 
    ImageTransparency = l_t_0.optional(l_t_0.number), 
    forwardRef = l_t_0.optional(l_t_0.table)
});
v10.init = function(v11)
    v11.renderSteppedCallback = function(v12)
        local l_isSpinning_0 = v11.props.isSpinning;
        local l_spinSpeed_0 = v11.props.spinSpeed;
        if not (not l_isSpinning_0 or not v11.ref.current) then
            v11.ref.current.Rotation = v11.ref.current.Rotation + l_spinSpeed_0 * v12;
        end;
    end;
end;
v10.render = function(v15)
    local l_Size_0 = v15.props.Size;
    local l_Position_0 = v15.props.Position;
    local l_AnchorPoint_0 = v15.props.AnchorPoint;
    local l_ImageColor3_0 = v15.props.ImageColor3;
    local l_ImageTransparency_0 = v15.props.ImageTransparency;
    local l_isSpinning_1 = v15.props.isSpinning;
    v15.ref = (v15.props.forwardRef or v15.ref) or l_Roact_0.createRef();
    return l_withStyle_0(function(v22)
        return l_Roact_0.createElement(l_ImageSetLabel_0, {
            Size = l_Size_0, 
            Position = l_Position_0, 
            AnchorPoint = l_AnchorPoint_0, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/common/refresh"], 
            ImageColor3 = l_ImageColor3_0 or v22.Theme.SystemPrimaryDefault.Color, 
            ImageTransparency = l_ImageTransparency_0 or v22.Theme.SystemPrimaryDefault.Transparency, 
            [l_Roact_0.Ref] = v15.ref
        }, {
            renderStepped = l_isSpinning_1 and l_Roact_0.createElement(v9, {
                event = l_RunService_0.renderStepped, 
                callback = v15.renderSteppedCallback
            })
        });
    end);
end;
return l_Roact_0.forwardRef(function(v23, v24)
    return l_Roact_0.createElement(v10, l_Cryo_0.Dictionary.join(v23, {
        forwardRef = v24
    }));
end);
