local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.Cryo);
local v6 = require(l_Parent_0.BaseKnob);
local v7 = require(l_Parent_2.Core.Control.Enum.ControlState);
local v8 = require(l_Parent_1.Style.Colors);
local v9 = {
    contextual = {
        [v7.Default] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Hover] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Pressed] = {
            Color = v8.Green, 
            Transparency = 0
        }, 
        [v7.Disabled] = {
            Color = v8.Pumice, 
            Transparency = 0
        }, 
        [v7.Selected] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.SelectedPressed] = {
            Color = v8.White, 
            Transparency = 0
        }
    }, 
    system = {
        [v7.Default] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Hover] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.Pressed] = {
            Color = v8.Pumice, 
            Transparency = 0
        }, 
        [v7.Disabled] = {
            Color = v8.Pumice, 
            Transparency = 0
        }, 
        [v7.Selected] = {
            Color = v8.White, 
            Transparency = 0
        }, 
        [v7.SelectedPressed] = {
            Color = v8.White, 
            Transparency = 0
        }
    }
};
local function _(v10)
    return v4.forwardRef(function(v11, v12)
        return v4.createElement(v6, (v5.Dictionary.join({}, v11, {
            colorMap = v9[v10], 
            forwardedRef = v12
        })));
    end);
end;
local v14 = {};
local l_forwardRef_0 = v4.forwardRef;
local v16 = "contextual";
local l_v16_0 = v16 --[[ copy: 15 -> 16 ]];
v14.ContextualKnob = l_forwardRef_0(function(v18, v19)
    return v4.createElement(v6, (v5.Dictionary.join({}, v18, {
        colorMap = v9[l_v16_0], 
        forwardedRef = v19
    })));
end);
l_forwardRef_0 = v4.forwardRef;
v16 = "system";
v14.SystemKnob = l_forwardRef_0(function(v20, v21)
    return v4.createElement(v6, (v5.Dictionary.join({}, v20, {
        colorMap = v9[v16], 
        forwardedRef = v21
    })));
end);
return v14;
