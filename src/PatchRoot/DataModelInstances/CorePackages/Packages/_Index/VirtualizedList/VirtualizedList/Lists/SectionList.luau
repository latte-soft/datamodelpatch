local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v5 = {};
local v6 = {
    OS = "roblox"
};
local v7 = require(l_Parent_1.React);
local v8 = require(script.Parent.VirtualizedSectionList);
local _ = require(l_Parent_0.Components.ScrollView.ScrollView);
local v10 = v7.PureComponent:extend("SectionList");
v10.init = function(v11, v12)
    v11.props = v12;
    v11._captureRef = function(v13)
        v11._wrapperListRef = v13;
    end;
end;
v10.scrollToLocation = function(v14, v15)
    if v14._wrapperListRef ~= nil then
        v14._wrapperListRef:scrollToLocation(v15);
    end;
end;
v10.recordInteraction = function(v16)
    local v17 = if not v16._wrapperListRef then v16._wrapperListRef else v16._wrapperListRef:getListRef();
    if v17 then
        v17:recordInteraction();
    end;
end;
v10.flashScrollIndicators = function(v18)
    local v19 = if not v18._wrapperListRef then v18._wrapperListRef else v18._wrapperListRef:getListRef();
    if v19 then
        v19:flashScrollIndicators();
    end;
end;
v10.getScrollResponder = function(v20)
    local v21 = if not v20._wrapperListRef then v20._wrapperListRef else v20._wrapperListRef:getListRef();
    if not l_Boolean_0.toJSBoolean(v21) then
        return nil;
    else
        return v21:getScrollResponder();
    end;
end;
v10.getScrollableNode = function(v22)
    local v23 = if not v22._wrapperListRefthen then v22._wrapperListRef else v22._wrapperListRef:getListRef();
    if not l_Boolean_0.toJSBoolean(v23) then
        return nil;
    else
        return v23:getScrollableNode();
    end;
end;
v10.setNativeProps = function(v24, v25)
    local v26 = if not v24._wrapperListRef then v24._wrapperListRef else v24._wrapperListRef:getListRef();
    if l_Boolean_0.toJSBoolean(v26) then
        v26:setNativeProps(v25);
    end;
end;
v10.render = function(v27)
    local l_stickySectionHeadersEnabled_0 = v27.props.stickySectionHeadersEnabled;
    return v7.createElement(v8, l_Object_0.assign({}, l_Object_0.assign({}, v27.props, {
        stickySectionHeadersEnabled = l_Object_0.None
    }), {
        stickySectionHeadersEnabled = if l_stickySectionHeadersEnabled_0 ~= nil then l_stickySectionHeadersEnabled_0 else v6.OS == "ios", 
        ref = v27._captureRef, 
        getItemCount = function(v29)
            return #v29;
        end, 
        getItem = function(v30, v31)
            return v30[v31];
        end
    }));
end;
v5.default = v10;
return v5;
