local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_2.Core.Animation.Enum.SlidingDirection);
local v7 = require(l_Parent_2.Core.Animation.SlidingContainer);
local v8 = require(l_Parent_2.Core.Style.Validator.validateColorInfo);
local v9 = require(l_Parent_2.StateTable.StateTable);
local v10 = require(l_Parent_1.Button.Enum.ButtonType);
local v11 = require(l_Parent_0.Enum.AnimationState);
local v12 = require(l_Parent_0.InformativeToast);
local v13 = require(l_Parent_0.InteractiveToast);
local v14 = require(l_Parent_0.ToastContainer);
local v15 = v4.PureComponent:extend("Toast");
v15.validateProps = v5.strictInterface({
    anchorPoint = v5.optional(v5.Vector2), 
    duration = v5.optional(v5.number), 
    layoutOrder = v5.optional(v5.integer), 
    position = v5.optional(v5.UDim2), 
    show = v5.optional(v5.boolean), 
    size = v5.optional(v5.UDim2), 
    springOptions = v5.optional(v5.table), 
    toastContent = v5.strictInterface({
        buttonText = v5.optional(v5.string), 
        iconColorStyle = v5.optional(v8), 
        iconImage = v5.optional(v5.union(v5.table, v5.string, v5.callback)), 
        iconSize = v5.optional(v5.Vector2), 
        iconChildren = v5.optional(v5.table), 
        onActivated = v5.optional(v5.callback), 
        onAppeared = v5.optional(v5.callback), 
        onDismissed = v5.optional(v5.callback), 
        swipeUpDismiss = v5.optional(v5.boolean), 
        toastSubtitle = v5.optional(v5.string), 
        sequenceNumber = v5.optional(v5.integer), 
        toastTitle = v5.string, 
        buttonType = v5.optional(v10.isEnumValue), 
        onTouchSwipeUp = v5.optional(v5.callback)
    })
});
v15.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0), 
    position = UDim2.new(0.5, 0, 0, 20), 
    show = true
};
local function v18(v16, v17)
    if not ((((((((v16.iconColorStyle == v17.iconColorStyle and v16.iconImage == v17.iconImage) and v16.iconSize == v17.iconSize) and v16.iconChildren == v17.iconChildren) and v16.onActivated == v17.onActivated) and v16.onDismissed == v17.onDismissed) and v16.sequenceNumber == v17.sequenceNumber) and v16.swipeUpDismiss == v17.swipeUpDismiss) and v16.toastSubtitle == v17.toastSubtitle) or v16.toastTitle ~= v17.toastTitle then
        return false;
    else
        return true;
    end;
end;
v15.init = function(v19)
    v19.isMounted = false;
    v19.currentToastContent = v19.props.toastContent;
    v19.onActivated = function()
        v19.stateTable.events.Activated({
            activated = true
        });
    end;
    v19.onAppeared = function()
        if v19.currentToastContent.onAppeared then
            v19.currentToastContent.onAppeared();
        end;
        local l_duration_0 = v19.props.duration;
        if l_duration_0 and l_duration_0 > 0 then
            local l_currentToastContent_0 = v19.currentToastContent;
            delay(l_duration_0, function()
                if l_currentToastContent_0 == v19.currentToastContent then
                    v19.stateTable.events.AutoDismiss();
                end;
            end);
        end;
    end;
    v19.onComplete = function()
        local l_duration_1 = v19.props.duration;
        if not (not (v19.state.currentState == v11.Appearing) or not l_duration_1) and l_duration_1 <= 0 then
            v19.stateTable.events.AutoDismiss();
            return ;
        else
            v19.stateTable.events.AnimationComplete();
            return ;
        end;
    end;
    v19.onDisappeared = function()
        if not v19.state.context.activated then
            if v19.currentToastContent.onDismissed then
                v19.currentToastContent.onDismissed();
            end;
        elseif v19.currentToastContent.onActivated then
            v19.currentToastContent.onActivated();
            return ;
        end;
    end;
    v19.onTouchSwipe = function(_, v24)
        if v24 == Enum.SwipeDirection.Up then
            v19.stateTable.events.ForceDismiss();
            if v19.currentToastContent.onTouchSwipeUp then
                v19.currentToastContent.onTouchSwipeUp();
            end;
        end;
    end;
    v19.renderInteractiveToast = function(v25)
        return v4.createElement(v13, v25);
    end;
    v19.renderInformativeToast = function(v26)
        return v4.createElement(v12, v26);
    end;
    v19.setContext = function(_, _, v29)
        return v29;
    end;
    v19.updateToastContent = function()
        if v19.currentToastContent ~= v19.props.toastContent then
            v19.currentToastContent = v19.props.toastContent;
            if v19.props.show then
                v19.stateTable.events.ForceAppear({
                    activated = false
                });
            end;
        end;
    end;
    local l_Disappeared_0 = v11.Disappeared;
    v19.state = {
        currentState = l_Disappeared_0, 
        context = {
            activated = false
        }
    };
    v19.stateTable = v9.new(string.format("Animated(%s)", (tostring(v19))), l_Disappeared_0, {}, {
        [v11.Appearing] = {
            AnimationComplete = {
                nextState = v11.Appeared, 
                action = v19.onAppeared
            }, 
            AutoDismiss = {
                nextState = v11.Disappearing, 
                action = v19.onAppeared
            }, 
            ContentChanged = {
                nextState = v11.Disappearing
            }, 
            ForceDismiss = {
                nextState = v11.Disappearing
            }
        }, 
        [v11.Appeared] = {
            Activated = {
                nextState = v11.Disappearing, 
                action = v19.setContext
            }, 
            AutoDismiss = {
                nextState = v11.Disappearing
            }, 
            ContentChanged = {
                nextState = v11.Disappearing
            }, 
            ForceDismiss = {
                nextState = v11.Disappearing
            }
        }, 
        [v11.Disappearing] = {
            AnimationComplete = {
                nextState = v11.Disappeared, 
                action = v19.onDisappeared
            }
        }, 
        [v11.Disappeared] = {
            ContentChanged = {
                nextState = v11.Appearing, 
                action = v19.updateToastContent
            }, 
            ForceAppear = {
                nextState = v11.Appearing, 
                action = v19.setContext
            }
        }
    });
    v19.stateTable:onStateChange(function(v31, v32, v33)
        if v19.isMounted and v31 ~= v32 then
            v19:setState({
                currentState = v32, 
                context = v33
            });
        end;
    end);
end;
v15.isShowing = function(v34)
    local v35 = true;
    if v34.state.currentState ~= v11.Appearing then
        v35 = v34.state.currentState == v11.Appeared;
    end;
    return v35;
end;
v15.render = function(v36)
    local l_onActivated_0 = v36.currentToastContent.onActivated;
    local l_swipeUpDismiss_0 = v36.currentToastContent.swipeUpDismiss;
    if l_swipeUpDismiss_0 == nil then
        l_swipeUpDismiss_0 = true;
    end;
    return v4.createElement(v7, {
        show = v36:isShowing(), 
        layoutOrder = v36.props.layoutOrder, 
        onComplete = v36.onComplete, 
        slidingDirection = v6.Down, 
        springOptions = v36.props.springOptions
    }, {
        ToastContainer = v4.createElement(v14, {
            anchorPoint = v36.props.anchorPoint, 
            buttonText = v36.currentToastContent.buttonText, 
            position = v36.props.position, 
            size = v36.props.size, 
            iconColorStyle = v36.currentToastContent.iconColorStyle, 
            iconImage = v36.currentToastContent.iconImage, 
            iconSize = v36.currentToastContent.iconSize, 
            iconChildren = v36.currentToastContent.iconChildren, 
            onActivated = l_onActivated_0 and v36.onActivated, 
            onTouchSwipe = l_swipeUpDismiss_0 and v36.onTouchSwipe, 
            renderToast = not not l_onActivated_0 and v36.renderInteractiveToast or v36.renderInformativeToast, 
            toastSubtitle = v36.currentToastContent.toastSubtitle, 
            toastTitle = v36.currentToastContent.toastTitle, 
            buttonType = v36.currentToastContent.buttonType
        })
    });
end;
v15.didMount = function(v39)
    v39.isMounted = true;
    if v39.props.show then
        v39.stateTable.events.ForceAppear({
            activated = false
        });
    end;
end;
v15.willUnmount = function(v40)
    v40.isMounted = false;
end;
v15.didUpdate = function(v41, v42, v43)
    if v42.show ~= v41.props.show then
        if not v41.props.show then
            v41.stateTable.events.ForceDismiss();
        else
            v41.stateTable.events.ForceAppear({
                activated = false
            });
        end;
    end;
    if not v18(v42.toastContent, v41.props.toastContent) then
        v41.stateTable.events.ContentChanged({
            activated = false
        });
    end;
    if v43.currentState ~= v41.state.currentState and v41.state.currentState == v11.Disappeared then
        v41.updateToastContent();
    end;
end;
return v15;
