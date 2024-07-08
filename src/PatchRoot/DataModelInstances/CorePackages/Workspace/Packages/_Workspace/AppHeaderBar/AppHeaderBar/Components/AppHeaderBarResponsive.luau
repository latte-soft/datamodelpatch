local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.UIBlox);
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_1.Responsive);
local v6 = require(script.Parent.AppHeaderBarComponent);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useBreakpointXOrLarger_0 = v5.useBreakpointXOrLarger;
local l_usePreferredInput_0 = v5.usePreferredInput;
local _ = require(l_Parent_0.Types);
return function(v11)
    local v12 = l_useBreakpointXOrLarger_0(v5.Keys.Medium);
    local v13 = l_useBreakpointXOrLarger_0(v5.Keys.Large);
    local v14 = l_usePreferredInput_0() == v5.Input.Directional;
    local l_Tokens_0 = l_useStyle_0().Tokens;
    return v2.createElement(v6, (v4.Dictionary.join(v11, (v2.useMemo(function()
        return {
            barHeight = 0, 
            automaticHeight = true, 
            title = if not not v13 and v14 then v4.None else nil, 
            titleFontStyle = if not v12 then l_Tokens_0.Semantic.Typography.Header else l_Tokens_0.Semantic.Typography.Title, 
            renderCenter = if not v13 or v14 then v4.None else nil, 
            renderUserInfo = if not v13 then v4.None else nil, 
            avatarActionIcon = if not v13 then nil else v4.None, 
            searchActionIcon = if not v13 or v14 then nil else v4.None, 
            utilitiesGap = if not v12 then l_Tokens_0.Global.Space_200 else l_Tokens_0.Global.Space_300, 
            paddingTop = if not v13 then nil else UDim.new(0, l_Tokens_0.Global.Space_200), 
            paddingBottom = if not v13 then nil else UDim.new(0, l_Tokens_0.Global.Space_200), 
            onMedia = (not not v13 and v14) and true or nil
        };
    end, {
        v12, 
        v13, 
        v14, 
        l_Tokens_0
    })))));
end;
