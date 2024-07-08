local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Common_0 = l_Modules_0.Common;
local _ = l_Modules_0.LuaApp;
local v3 = require(l_Modules_0.Common.Immutable);
local v4 = require(l_Common_0.Roact);
local v5 = require(script.Parent.UserCarousel);
local v6 = v4.PureComponent:extend("FreezableUserCarousel");
v6.init = function(v7)
    v7.isMounted = false;
    v7.state = {
        peopleListFrozen = false
    };
    v7.setPeopleListFrozen = function(v8)
        if v7.isMounted then
            v7:setState({
                peopleListFrozen = v8
            });
        end;
    end;
end;
v6.render = function(v9)
    return v4.createElement(v5, (v3.JoinDictionaries(v9.props, {
        peopleListFrozen = v9.state.peopleListFrozen, 
        setPeopleListFrozen = v9.setPeopleListFrozen
    })));
end;
v6.didMount = function(v10)
    v10.isMounted = true;
end;
v6.willUnmount = function(v11)
    v11.isMounted = false;
end;
return v6;
