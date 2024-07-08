local l_Players_0 = game:GetService("Players");
local v1 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Components.PageNavigationWatcher);
local v6 = require(l_Parent_0.Components.Page);
local v7 = require(script.ReportList);
local function v11()
    local v8 = {};
    for _, v10 in ipairs(l_Players_0:GetPlayers()) do
        if v10 ~= l_Players_0.LocalPlayer then
            table.insert(v8, v10);
        end;
    end;
    return v8;
end;
local v12 = l_Roact_0.PureComponent:extend("ReportPage");
v12.validateProps = l_t_0.strictInterface({
    pageTitle = l_t_0.string
});
v12.init = function(v13)
    v13:setState({
        players = v11()
    });
end;
v12.render = function(v14)
    return l_Roact_0.createElement(v6, {
        pageTitle = v14.props.pageTitle
    }, {
        PlayerList = l_Roact_0.createElement(v7, {
            players = v14.state.players
        }), 
        Watcher = l_Roact_0.createElement(v5, {
            desiredPage = "Report", 
            onNavigateTo = function()
                v14:setState({
                    players = v11()
                });
            end
        })
    });
end;
return v12;
