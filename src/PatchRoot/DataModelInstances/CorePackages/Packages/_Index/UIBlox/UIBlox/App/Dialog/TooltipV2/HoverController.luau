local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.React);
local v4 = require(l_Parent_2.LuauPolyfill);
local _ = require(l_Parent_0.Types);
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_0.TooltipController);
local v8 = require(l_Parent_1.Core.Control.Enum.ControlState);
local v9 = require(l_Parent_1.UIBloxConfig);
return function(v10)
    local v11, v12 = v3.useState(false);
    local v13 = v3.useRef(tick());
    v3.useEffect(function()
        return function()
            v13.current = tick();
        end;
    end, if not v9.enableTooltipV2HoverControllerReRenderFix then nil else {});
    local v14 = v10.delayTime or v6.DEFAULT_DELAY_TIME;
    local v18 = v3.useCallback(function(v15, v16)
        if not v10.disabled then
            if not (v16 ~= v8.Hover) or v9.supportControlStateSelectedForTooltipHover and v16 == v8.Selected then
                local l_current_0 = v13.current;
                delay(v14, function()
                    if v13.current == l_current_0 then
                        v12(true);
                    end;
                end);
                return ;
            else
                if not (v15 ~= v8.Hover) or v9.supportControlStateSelectedForTooltipHover and v15 == v8.Selected then
                    v13.current = tick();
                    v12(false);
                end;
                return ;
            end;
        else
            v12(false);
            return ;
        end;
    end, {
        v14
    });
    return v3.createElement(v7, (v4.Object.assign({}, v10, {
        delayTime = v4.Object.None, 
        active = v11, 
        renderTriggerPoint = function(v19)
            return v10.renderTriggerPoint(v19, v18);
        end
    })));
end;
