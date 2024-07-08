local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Style);
local _ = require(l_Parent_0.TenFootUiCommon);
local v6 = require(l_ReactNavigationExtend_0.Views.Constants);
local l_useDesignTokens_0 = v4.useDesignTokens;
local function v12(v8, v9)
    local l_Y_0 = v6.TOP_BAR_CANVAS_SIZE.Y;
    local l_PAGE_CONTENT_HEIGHT_RATIO_0 = v6.PAGE_CONTENT_HEIGHT_RATIO;
    return {
        showOverflowFade = v8.screenKind == "Default", 
        paddingTop = if v8.screenKind == "Default" then l_Y_0 - v9.Global.Space_300 else 0, 
        pageHeightRatio = l_PAGE_CONTENT_HEIGHT_RATIO_0, 
        overflowStop = v9.Global.Space_200 / v6.CANVAS_SIZE.Y + l_PAGE_CONTENT_HEIGHT_RATIO_0
    };
end;
return function(v13)
    local v14 = v12(v13, (l_useDesignTokens_0()));
    return v3.createElement("CanvasGroup", {
        Name = "TenFootUiOverflowScreen", 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        GroupTransparency = v13.groupTransparency
    }, v3.createElement("UIPadding", {
        PaddingTop = UDim.new(0, v14.paddingTop)
    }), v13.children, if not v14.showOverflowFade then nil else v3.createElement("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), 
            NumberSequenceKeypoint.new(v14.pageHeightRatio, 0), 
            NumberSequenceKeypoint.new(v14.overflowStop, 1), 
            NumberSequenceKeypoint.new(1, 1)
        }), 
        Rotation = 270
    }));
end;
