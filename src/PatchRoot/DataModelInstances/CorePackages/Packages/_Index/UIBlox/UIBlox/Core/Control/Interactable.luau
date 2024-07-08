local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.UIBloxConfig);
local l_Parent_2 = l_Parent_1.Parent;
if (v2.refactorInteractable or false) == false then
    return require(script.Parent.Interactable_DEPRECATED);
else
    local v4 = require(l_Parent_2.Cryo);
    local v5 = require(l_Parent_2.React);
    local _ = require(l_Parent_0.Control.Enum.ControlState);
    local v7 = require(l_Parent_1.Core.Control.Enum.ControlStateEvent);
    local v8 = require(l_Parent_0.Control.Hooks.useGuiControlState);
    local v9 = require(l_Parent_0.Control.Hooks.useInteractionFeedback);
    local v10 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
    return v5.forwardRef(function(v11, v12)
        local v13 = v5.useRef(nil);
        local v14 = v5.useRef(nil);
        local v15 = if not v2.enableInteractionFeedback then nil else v9();
        local v16 = v5.useRef(not (v11.userInteractionEnabled ~= nil) or v11.userInteractionEnabled);
        local v19, v20 = v8(v13, v5.useCallback(function(v17, v18)
            if v2.enableInteractionFeedback then
                v15(v11.feedbackType, v17, v18);
            end;
            if v11.onStateChanged then
                v11.onStateChanged(v17, v18);
            end;
        end, {
            v11.onStateChanged, 
            v15, 
            v11.feedbackType
        }), v16.current);
        v5.useImperativeHandle(v12, function()
            return v13.current;
        end, {});
        local v21 = v5.useCallback(function(...)
            if v16.current ~= false and not v11.isDisabled then
                if not v11[v5.Event.Activated] then
                    return nil;
                else
                    return v11[v5.Event.Activated](...);
                end;
            else
                return nil;
            end;
        end, {
            v11[v5.Event.Activated], 
            v11.isDisabled
        });
        v5.useEffect(function()
            if v11.isDisabled ~= nil then
                v14.current = v11.isDisabled;
                if not v11.isDisabled then
                    v20.events[v7.Enabled]();
                    return ;
                else
                    v20.events[v7.Disabled]();
                    return ;
                end;
            elseif v14.current == nil then
                v14.current = false;
                v20.events[v7.Enabled]();
                return ;
            else
                if v14.current == true then
                    v14.current = false;
                    v20.events[v7.Enabled]();
                end;
                return ;
            end;
        end, {
            v11.isDisabled
        });
        v5.useEffect(function()
            if v11.userInteractionEnabled ~= nil then
                v16.current = v11.userInteractionEnabled;
                return ;
            else
                v16.current = true;
                return ;
            end;
        end, {
            v11.userInteractionEnabled
        });
        return v5.createElement(v11.component or v10.Button, (v4.Dictionary.join(v11, {
            ref = v19, 
            onStateChanged = v4.None, 
            isDisabled = v4.None, 
            userInteractionEnabled = v4.None, 
            feedbackType = v4.None, 
            Active = if v11.isDisabled ~= nil then not v11.isDisabled else nil, 
            [v5.Event.Activated] = v21
        })));
    end);
end;
