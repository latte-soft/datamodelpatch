local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_0.Core;
local v3 = require(l_Parent_1.t);
return v3.array(v3.strictInterface({
    icon = v3.optional(v3.union(v3.table, v3.string)), 
    text = v3.string, 
    onActivated = v3.callback, 
    disabled = v3.optional(v3.boolean), 
    inputBindingKey = v3.optional(v3.string), 
    keyCodeLabel = v3.optional(v3.union(v3.enum(Enum.KeyCode), v3.strictInterface({
        key = v3.enum(Enum.KeyCode), 
        axis = v3.optional(v3.string)
    }))), 
    selected = v3.optional(v3.boolean), 
    stayOnActivated = v3.optional(v3.boolean), 
    renderRightSideGadget = v3.optional(v3.callback), 
    rightSideGadgetSize = v3.optional(v3.Vector2), 
    iconColorOverride = v3.optional(v3.Color3), 
    textColorOverride = v3.optional(v3.Color3), 
    dividerOffset = v3.optional(v3.number), 
    dividerSize = v3.optional(v3.number), 
    leftPaddingOffset = v3.optional(v3.number), 
    fontStyle = v3.optional(v3.union(v3.string, require(l_Core_0.Style.Validator.validateFontInfo), (require(l_Parent_0.Core.Style.Validator.validateTypographyInfo)))), 
    iconSize = v3.optional(v3.integer), 
    selectedIconSize = v3.optional(v3.integer), 
    iconPaddingLeft = v3.optional(v3.integer), 
    textPadding = v3.optional(v3.strictInterface({
        left = v3.integer, 
        right = v3.integer
    })), 
    selectedIconPaddingRight = v3.optional(v3.integer), 
    keyLabelPaddingRight = v3.optional(v3.integer), 
    textOnlyPadding = v3.optional(v3.integer), 
    buttonTextOverride = v3.optional(v3.table), 
    borderCornerRadius = v3.optional(v3.integer), 
    background = v3.optional((require(l_Parent_0.Core.Style.Validator.validateColorInfo)))
}));
