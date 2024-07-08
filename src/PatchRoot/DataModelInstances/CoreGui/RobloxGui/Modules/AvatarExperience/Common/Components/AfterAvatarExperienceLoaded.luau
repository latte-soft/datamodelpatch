local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.UIBlox);
local l_RetrievalStatus_0 = v5.App.Loading.Enum.RetrievalStatus;
local l_LoadingStateContainer_0 = v5.App.Container.LoadingStateContainer;
local v8 = v2.PureComponent:extend("AvatarExperienceLoaded");
local _ = require(l_CoreGui_0.RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState);
v8.validateProps = v4.strictInterface({
    showLoadingBar = v4.boolean, 
    [v2.Children] = v4.optional(v4.table), 
    avatarExperienceLoaded = v4.boolean
});
v8.init = function(v10)
    v10.emptyRenderFunction = function()
        return nil;
    end;
end;
v8.getLoadingStatus = function(v11)
    if v11.props.avatarExperienceLoaded then
        return l_RetrievalStatus_0.Done;
    else
        return l_RetrievalStatus_0.Fetching;
    end;
end;
v8.render = function(v12)
    local v13 = nil;
    if not v12.props.showLoadingBar then
        v13 = v12.emptyRenderFunction;
    end;
    return v2.createElement(l_LoadingStateContainer_0, {
        dataStatus = v12:getLoadingStatus(), 
        renderOnLoaded = function()
            return v2.oneChild(v12.props[v2.Children]);
        end, 
        renderOnLoading = v13
    });
end;
v8 = v3.connect(function(v14, _)
    return {
        avatarExperienceLoaded = v14.AvatarExperience.Common.AvatarExperienceLoaded
    };
end, nil)(v8);
return function(v16, v17)
    if v17 == nil then
        v17 = true;
    end;
    return function(v18)
        return v2.createElement(v8, {
            showLoadingBar = v17
        }, {
            Child = v2.createElement(v16, v18)
        });
    end;
end;
