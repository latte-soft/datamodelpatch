local l_Parent_0 = script.Parent;
local l_Object_0 = require(l_Parent_0.Parent.Parent.Parent.LuauPolyfill).Object;
local v2 = require(l_Parent_0.StackViewInterpolator);
local v3 = require(l_Parent_0.StackPresentationStyle);
local v4 = {
    frequency = 3, 
    dampingRatio = 1
};
local v5 = {
    transitionSpec = v4, 
    screenInterpolator = v2.forHorizontal
};
local v6 = {
    transitionSpec = v4, 
    screenInterpolator = v2.forVertical
};
local v7 = {
    transitionSpec = v4, 
    screenInterpolator = v2.forFade
};
return {
    getDefaultTransitionConfig = function(_, _, v10)
        if v10 == v3.Modal then
            return v6;
        elseif v10 == v3.Overlay then
            return v7;
        else
            return v5;
        end;
    end, 
    getTransitionConfig = function(v11, v12, v13, v14)
        local v15 = if v14 == v3.Modal then v6 else if v14 == v3.Overlay then v7 else v5;
        if not v11 then
            return v15;
        else
            return l_Object_0.assign(table.clone(v15), v11(v12, v13, v14));
        end;
    end, 
    SlideFromRight = v5, 
    ModalSlideFromBottom = v6, 
    FadeInPlace = v7
};
