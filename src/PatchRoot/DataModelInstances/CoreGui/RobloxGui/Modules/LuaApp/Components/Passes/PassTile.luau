local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v5 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v6 = require(l_Modules_0.LuaApp.AppPage);
local v7 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v8 = require(l_CorePackages_0.Packages.t);
local l_ItemTile_0 = require(l_CorePackages_0.UIBlox).Tile.ItemTile;
local v10 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPurchasePass);
local v11 = require(l_Modules_0.LuaApp.Components.Passes.PassFooter);
local v12 = v2.PureComponent:extend("PassTile");
v12.validateProps = v8.strictInterface({
    universeId = v8.string, 
    pass = v8.table, 
    passThumbnail = v8.string, 
    requestPurchasePass = v8.optional(v8.callback), 
    navigateDown = v8.optional(v8.callback)
});
v12.init = function(v13)
    v13.promptPurchase = function(v14, v15)
        return function()
            if not v14.isOwned then
                v13.props.requestPurchasePass(v14, v15);
            end;
        end;
    end;
    v13.viewPassDetails = function(v16)
        return function()
            if v13.isMounted then
                v13.props.navigateDown({
                    name = v6.GenericWebPage, 
                    detail = v7.game.info.pass({
                        passId = v16.id
                    }), 
                    extraProps = {
                        title = v16.displayName, 
                        transitionAnimation = v5.SlideInFromRight, 
                        passOwned = v16.isOwned
                    }
                });
            end;
        end;
    end;
end;
v12.render = function(v17)
    local l_pass_0 = v17.props.pass;
    return v2.createElement(l_ItemTile_0, {
        name = l_pass_0.displayName, 
        titleTextLineCount = 1, 
        thumbnail = v17.props.passThumbnail, 
        onActivated = v17.viewPassDetails(l_pass_0), 
        footer = v2.createElement(v11, {
            price = l_pass_0.price, 
            userOwnsPass = l_pass_0.isOwned, 
            onActivated = v17.promptPurchase(l_pass_0, v17.props.universeId)
        })
    });
end;
v12.didMount = function(v19)
    v19.isMounted = true;
end;
v12.willUnmount = function(v20)
    v20.isMounted = false;
end;
return (v3.connect(nil, function(v21)
    return {
        requestPurchasePass = function(v22, v23)
            return v21(v10(v22, v23));
        end, 
        navigateDown = function(v24)
            return v21(v4(v24));
        end
    };
end)(v12));
