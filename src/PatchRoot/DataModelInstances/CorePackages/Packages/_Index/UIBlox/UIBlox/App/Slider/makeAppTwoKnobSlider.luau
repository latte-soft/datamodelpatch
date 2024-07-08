local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_3.t);
local v7 = require(l_Parent_0.makeAppSlider);
local v8 = require(l_Parent_2.Core.Style.withStyle);
local v9 = require(l_Parent_1.Style.Validator.validateStyle);
local function v14(v10)
    return v4.forwardRef(function(v11, v12)
        return v8(function(v13)
            return v4.createElement(v10, (v5.Dictionary.join(v11, {
                style = v13, 
                forwardedRef = v12
            })));
        end);
    end);
end;
return function(v15)
    local v16 = v4.PureComponent:extend("TwoKnobAppSliderFor" .. v15);
    local v17 = v7(v15, true);
    v16.validateProps = v6.intersection(v6.strictInterface({
        lowerValue = v6.number, 
        upperValue = v6.number, 
        min = v6.number, 
        max = v6.number, 
        stepInterval = v6.optional(v6.numberPositive), 
        onValueChanged = v6.callback, 
        onDragStartLower = v6.optional(v6.callback), 
        onDragStartUpper = v6.optional(v6.callback), 
        onDragEnd = v6.optional(v6.callback), 
        isDisabled = v6.optional(v6.boolean), 
        width = v6.optional(v6.UDim), 
        position = v6.optional(v6.UDim2), 
        anchorPoint = v6.optional(v6.Vector2), 
        layoutOrder = v6.optional(v6.integer), 
        forwardedRef = v6.optional(v6.table), 
        NextSelectionUp = v6.optional(v6.table), 
        NextSelectionDown = v6.optional(v6.table), 
        focusController = v6.optional(v6.table), 
        style = v9
    }), function(v18)
        if v18.upperValue < v18.lowerValue then
            return false, "The upper value must be greater than or equal to the lower";
        else
            return true;
        end;
    end);
    v16.defaultProps = {
        stepInterval = 1, 
        width = UDim.new(1, 0)
    };
    v16.render = function(v19)
        return v4.createElement(v17, v19.props);
    end;
    return v14(v16);
end;
