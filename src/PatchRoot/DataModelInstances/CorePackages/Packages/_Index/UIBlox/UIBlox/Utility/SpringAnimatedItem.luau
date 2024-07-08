local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Otter);
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.t);
local v6 = v4.intersection(v4.strictInterface({
    animatedValues = v4.table, 
    mapValuesToProps = v4.callback, 
    springOptions = v4.optional(v4.table), 
    onComplete = v4.optional(v4.callback), 
    regularProps = v4.table, 
    [v2.Children] = v4.optional(v4.table)
}), function(v5)
    if v5[v2.Children] ~= nil and v5.regularProps[v2.Children] ~= nil then
        return false, "Children must be specified in one place, but the [Roact.Children] key was found" .. " in both props and props.regularProps on SpringAnimatedItem.";
    else
        return true;
    end;
end);
local v27 = {
    wrap = function(v7)
        local v8 = v2.PureComponent:extend(string.format("SpringAnimatedItem(%s)", (tostring(v7))));
        v8.defaultProps = {
            regularProps = {}
        };
        v8.init = function(v9)
            v9.ref = v9.props.regularProps[v2.Ref] or v2.createRef();
            v9.applyAnimatedValues = function(v10)
                local l_current_0 = v9.ref.current;
                if l_current_0 == nil then
                    return ;
                else
                    for v12, v13 in pairs((v9.props.mapValuesToProps(v10))) do
                        l_current_0[v12] = v13;
                    end;
                    return ;
                end;
            end;
            v9.onComplete = function()
                if v9.props.onComplete then
                    v9.props.onComplete();
                end;
            end;
            v9.motor = nil;
        end;
        v8.didMount = function(v14)
            local l_animatedValues_0 = v14.props.animatedValues;
            v14.applyAnimatedValues(l_animatedValues_0);
            v14.motor = v1.createGroupMotor(l_animatedValues_0);
            v14.motor:onStep(function(v16)
                v14.applyAnimatedValues(v16);
            end);
            v14.motor:onComplete(v14.onComplete);
            v14.motor:start();
        end;
        v8.willUpdate = function(v17, v18)
            if v17.props.regularProps[v2.Ref] ~= v18.regularProps[v2.Ref] and v18.regularProps[v2.Ref] ~= nil then
                v17.ref = v18.regularProps[v2.Ref];
            end;
        end;
        v8.render = function(v19)
            assert(v6(v19.props));
            return v2.createElement(v7, (v3.Dictionary.join(v19.props.regularProps, {
                [v2.Ref] = v19.ref, 
                [v2.Children] = v19.props[v2.Children]
            })));
        end;
        v8.didUpdate = function(v20, v21)
            if v20.props.animatedValues ~= v21.animatedValues then
                local v22 = {};
                local v23 = false;
                for v24, v25 in pairs(v20.props.animatedValues) do
                    v22[v24] = v1.spring(v25, v20.props.springOptions);
                    if v25 ~= v21.animatedValues[v24] then
                        v23 = true;
                    end;
                end;
                if v23 then
                    v20.motor:setGoal(v22);
                end;
            end;
        end;
        v8.willUnmount = function(v26)
            if v26.motor then
                v26.motor:destroy();
                v26.motor = nil;
            end;
        end;
        return v8;
    end
};
v27.AnimatedFrame = v27.wrap("Frame");
v27.AnimatedScrollingFrame = v27.wrap("ScrollingFrame");
v27.AnimatedImageLabel = v27.wrap("ImageLabel");
v27.AnimatedTextButton = v27.wrap("TextButton");
v27.AnimatedUIScale = v27.wrap("UIScale");
return v27;
