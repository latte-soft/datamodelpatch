local v0 = require(script.Responsive);
local v1 = require(script.Parent.React);
local v2 = require(script.CommonConfigs.StandardBreakpoints);
local v3 = require(script.Context.ContainerRef);
local v4 = require(script.FindFirstAncestorWithTag);
local v5 = require(script.Hooks.useResponsiveImpl);
local v6 = require(script.InputMode);
local v7 = require(script.HardwareSafeAreaInsets);
local v8 = require(script.Hooks.useDeviceInsets);
local v9 = require(script.Hooks.useIsSpatial);
local v10 = require(script.Hooks.useLastInput);
local v11 = require(script.Hooks.usePreferredInput);
local v12 = require(script.FFlagLuaAppResponsiveHooks);
breakpointCompare = function(v13, v14)
    local l_keyIndex_0 = v2.keyIndex;
    if not ((v13 ~= v0.DefaultKey and v14 ~= v0.DefaultKey) and l_keyIndex_0[v13] ~= nil) or l_keyIndex_0[v14] == nil then
        return false;
    else
        return l_keyIndex_0[v14] <= l_keyIndex_0[v13];
    end;
end;
ResponsiveProvider = function(v16)
    return v1.createElement(v3.Provider, {
        value = v1.useRef(nil)
    }, v16.children);
end;
return {
    HardwareSafeAreaInsets = v7, 
    useDeviceInsets = v8, 
    Keys = v2.Enum, 
    Input = v6.Enum, 
    BreakpointConfig = v2, 
    DefaultKey = v0.DefaultKey, 
    ContainerRef = v3, 
    ResponsiveProvider = ResponsiveProvider, 
    FindFirstAncestorWithTag = v4, 
    useBreakpointX = v5, 
    useBreakpointXOrLarger = function(v17)
        return v5(function(v18)
            return breakpointCompare(v18, v17);
        end, nil);
    end, 
    useBreakpointXOrSmaller = function(v19)
        return v5(function(v20)
            return breakpointCompare(v19, v20);
        end, nil);
    end, 
    useBreakpointY = function()
        return v5(nil, nil, "Y");
    end, 
    useBreakpointYOrLarger = function(v21)
        return v5(function(v22)
            return breakpointCompare(v22, v21);
        end, nil, "Y");
    end, 
    useBreakpointYOrSmaller = function(v23)
        return v5(function(v24)
            return breakpointCompare(v23, v24);
        end, nil, "Y");
    end, 
    useOrientation = function()
        return v5(nil, nil, "Orientation");
    end, 
    useResponsive = function(v25)
        return v5(nil, v25);
    end, 
    usePreferredInput = not v12 and function()
        return v5(nil, v6.preferredInputRules);
    end or v11, 
    useLastInput = not v12 and function()
        return v5(nil, v6.lastInputRules);
    end or v10, 
    useIsSpatial = if not v12 then nil else v9, 
    bindContainer = v0.bindContainer, 
    ["jest.config"] = script["jest.config"]
};
