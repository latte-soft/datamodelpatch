local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_withStyle_0 = v1.UIBlox.Style.withStyle;
local v4 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v5 = l_Roact_0.PureComponent:extend("PlayerSearchWrapper");
v5.defaultProps = {
    layoutOrder = 1, 
    onActivated = nil, 
    searchText = ""
};
v5.render = function(v6)
    return v4.with(function(v7)
        return l_withStyle_0(function(v8)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v8.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }, {
                l_Roact_0.createElement(v7.playerSearchPage, {
                    searchParameters = {
                        searchKeyword = v6.props.navigation.getParam("searchText", nil) or "", 
                        isKeywordSuggestionEnabled = true
                    }, 
                    shouldShowUserSearchLandingPage = v6.props.navigation.getParam("shouldShowUserSearchLandingPage", nil)
                })
            });
        end);
    end);
end;
return v5;
