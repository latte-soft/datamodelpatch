local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_IconSize_0 = l_UIBlox_0.App.Constant.IconSize;
local l_Toast_0 = l_UIBlox_0.App.Dialog.Toast;
local l_validateColorInfo_0 = l_UIBlox_0.Style.Validator.validateColorInfo;
local v8 = l_Roact_0.PureComponent:extend("ToastScreen");
v8.defaultProps = {
    navigation = nil
};
local v9 = l_t_0.strictInterface({
    toastTitle = l_t_0.optional(l_t_0.string), 
    toastSubtitle = l_t_0.optional(l_t_0.string), 
    iconColorStyle = l_t_0.optional(l_validateColorInfo_0), 
    iconImage = l_t_0.optional(l_t_0.union(l_t_0.table, l_t_0.string)), 
    iconSize = l_t_0.optional(l_t_0.Vector2), 
    swipeUpDismiss = l_t_0.optional(l_t_0.boolean), 
    onAppeared = l_t_0.optional(l_t_0.callback), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    onDismissed = l_t_0.optional(l_t_0.callback), 
    hideIcon = l_t_0.optional(l_t_0.boolean)
});
local v10 = l_t_0.strictInterface({
    toastContent = l_t_0.optional(l_t_0.table), 
    anchorPoint = l_t_0.optional(l_t_0.Vector2), 
    duration = l_t_0.optional(l_t_0.integer), 
    layoutOrder = l_t_0.optional(l_t_0.integer), 
    position = l_t_0.optional(l_t_0.UDim2), 
    size = l_t_0.optional(l_t_0.UDim2), 
    show = l_t_0.optional(l_t_0.boolean)
});
v8.init = function(v11)
    v11.hasToastChanged = false;
    v11.getToastProps = function(v12)
        local v13 = v12.toastContent or {};
        assert(v10(v12));
        assert(v9(v13));
        return {
            toastContent = {
                toastTitle = v13.toastTitle or "", 
                toastSubtitle = v13.toastSubtitle, 
                iconColorStyle = v13.iconColorStyle, 
                iconImage = if v13.hideIcon then nil else v13.iconImage or l_Images_0["icons/status/alert"], 
                iconSize = if v13.hideIcon then nil else v13.iconSize or Vector2.new(l_IconSize_0.Regular, l_IconSize_0.Regular), 
                swipeUpDismiss = v13.swipeUpDismiss, 
                onAppeared = function()
                    if v13.onAppeared then
                        v13.onAppeared();
                    end;
                    v11.hasToastChanged = false;
                end, 
                onActivated = v13.onActivated, 
                onDismissed = function()
                    if v13.onDismissed then
                        v13.onDismissed();
                    end;
                    if not v11.hasToastChanged then
                        v11.props.navigation.goBack();
                    end;
                end
            }, 
            anchorPoint = v12.anchorPoint, 
            duration = v12.duration or 2, 
            layoutOrder = v12.layoutOrder, 
            position = v12.position, 
            size = v12.size, 
            show = v12.show
        };
    end;
end;
v8.render = function(v14)
    assert(type(v14.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation");
    return l_Roact_0.createElement(l_Toast_0, (v14.getToastProps(v14.props.navigation.getParam("toastProps", {}))));
end;
v8.didUpdate = function(v15, _, _)
    v15.hasToastChanged = true;
end;
return v8;
