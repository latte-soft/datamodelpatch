local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v6 = require(l_script_FirstAncestor_0.Components.ListSearchWidget);
local v7 = require(l_script_FirstAncestor_0.Thunks.ApiFetchCountryCodes);
local v8 = require(l_script_FirstAncestor_0.Components.CountryCodeSelectorButton);
local v9 = v2.PureComponent:extend("CountryCodeSelector");
v9.init = function(v10)
    v10.props.fetchCountryCodes(v10.props.networking):catch(function()
    end);
end;
v9.render = function(v11)
    return v2.createElement(v6, {
        Heading = "Authentication.SignUp.Heading.CountryCodeSelector", 
        CloseCallback = v11.props.CloseCallback, 
        VisibilityTarget = not v11.props.WidgetVisible and 0 or 1, 
        List = v11.props.countryCodeList, 
        ListButton = v8, 
        SelectionCallback = v11.props.SelectionCallback
    });
end;
return l_RoactServices_0.connect({
    networking = l_RoactNetworking_0
})((v3.connect(function(v12)
    return {
        countryCodeList = v12.CountryCodeList
    };
end, function(v13)
    return {
        fetchCountryCodes = function(v14)
            return v13(v7.Fetch(v14));
        end
    };
end)(v9)));
