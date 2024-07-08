local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.t);
local v4 = require(l_Parent_0.App.Loading.Enum.RetrievalStatus);
local v5 = require(l_Parent_0.App.Container.LoadingStatePage);
local v6 = require(l_Parent_0.App.Container.FailedStatePage);
local v7 = v2.PureComponent:extend("LoadingStateContainer");
v7.validateProps = v3.strictInterface({
    dataStatus = v4.isEnumValue, 
    renderOnLoaded = v3.callback, 
    renderOnFailed = v3.optional(v3.callback), 
    onRetry = v3.optional(v3.callback), 
    renderOnLoading = v3.optional(v3.callback), 
    renderOnEmpty = v3.optional(v3.callback)
});
v7.init = function(v8)
    v8.statePages = {
        [v4.NotStarted] = function()
            if not v8.props.renderOnEmpty then
                if not v8.props.renderOnLoading then
                    return v2.createElement(v5);
                else
                    return v8.props.renderOnLoading();
                end;
            else
                return v8.props.renderOnEmpty();
            end;
        end, 
        [v4.Fetching] = function()
            if not v8.props.renderOnLoading then
                return v2.createElement(v5);
            else
                return v8.props.renderOnLoading();
            end;
        end, 
        [v4.Failed] = function()
            if not v8.props.renderOnFailed then
                return v2.createElement(v6, {
                    onRetry = v8.props.onRetry
                });
            else
                return v8.props.renderOnFailed();
            end;
        end, 
        [v4.Done] = function()
            return v8.props.renderOnLoaded();
        end
    };
end;
v7.render = function(v9)
    return v9.statePages[v9.props.dataStatus]();
end;
return v7;
