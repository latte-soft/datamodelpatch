local l_GuiService_0 = game:GetService("GuiService");
local l_Roact_0 = require(game:GetService("CorePackages").InGameMenuDependencies).Roact;
local v2 = require(script.Parent.FocusHandlerContext);
local v3 = l_Roact_0.PureComponent:extend("FocusHandlerContextProvider");
v3.init = function(v4)
    v4.state = {
        candidateHandlerId = nil, 
        currentHandlerId = nil
    };
    v4.previousSelections = {};
end;
v3.requestFocusForHandlerId = function(v5, v6)
    v5:setState(function(v7)
        if v7.currentHandlerId == nil then
            return {
                currentHandlerId = v6
            };
        elseif v6 ~= v7.currentHandlerId then
            return {
                candidateHandlerId = v6
            };
        else
            return nil;
        end;
    end);
end;
v3.blurCurrentFocusHandler = function(v8, v9, v10)
    v8:setState(function(v11)
        if v11.currentHandlerId == v9 then
            local v12 = nil;
            if not v10 then
                v12 = l_GuiService_0.SelectedCoreObject;
            end;
            v8.previousSelections[v9] = v12;
            local _ = nil;
            if v11.candidateHandlerId ~= nil then
                return {
                    currentHandlerId = v11.candidateHandlerId, 
                    candidateHandlerId = l_Roact_0.None
                };
            else
                return {
                    currentHandlerId = l_Roact_0.None
                };
            end;
        else
            return nil;
        end;
    end);
end;
v3.forgetLastSelectionForHandlerId = function(v14, v15)
    v14.previousSelections[v15] = nil;
end;
v3.render = function(v16)
    return l_Roact_0.createElement(v2.Provider, {
        value = {
            currentHandlerId = v16.state.currentHandlerId, 
            candidateHandlerId = v16.state.candidateHandlerId, 
            previousSelections = v16.previousSelections, 
            requestFocusForHandlerId = function(v17)
                v16:requestFocusForHandlerId(v17);
            end, 
            forgetLastSelectionForHandlerId = function(v18)
                v16:forgetLastSelectionForHandlerId(v18);
            end, 
            blurCurrentFocusHandler = function(v19, v20)
                v16:blurCurrentFocusHandler(v19, v20);
            end
        }
    }, v16.props[l_Roact_0.Children]);
end;
return v3;
