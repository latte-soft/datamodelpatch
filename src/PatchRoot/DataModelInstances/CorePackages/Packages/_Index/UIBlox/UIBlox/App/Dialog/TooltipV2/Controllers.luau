local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.TooltipController);
local v6 = require(l_Parent_0.HoverController);
local function _(v7)
    return function(v8, v9, v10)
        return v2.createElement(v7, (v3.Object.assign({}, v9, {
            tooltipProps = v8, 
            renderTriggerPoint = v10
        })));
    end;
end;
return {
    withTooltip = function(v12, v13, v14)
        return v2.createElement(v5, (v3.Object.assign({}, v13, {
            tooltipProps = v12, 
            renderTriggerPoint = v14
        })));
    end, 
    withHoverTooltip = function(v15, v16, v17)
        return v2.createElement(v6, (v3.Object.assign({}, v16, {
            tooltipProps = v15, 
            renderTriggerPoint = v17
        })));
    end
};
