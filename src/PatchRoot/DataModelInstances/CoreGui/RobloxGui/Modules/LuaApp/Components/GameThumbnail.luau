local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_LoadableImage_0 = require(l_CorePackages_0.UIBlox).App.Loading.LoadableImage;
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local v7 = v3.PureComponent:extend("GameThumbnail");
v7.render = function(v8)
    local l_image_0 = v8.props.image;
    return v3.createElement(l_LoadableImage_0, {
        Image = l_image_0 and l_image_0.url, 
        Size = v8.props.Size, 
        Position = v8.props.Position, 
        BackgroundColor3 = v8.props.BackgroundColor3, 
        loadingImage = v8.props.loadingImage
    });
end;
return v4.connect(function(v10, v11)
    return {
        image = v10[l_GameIconReducer_0.key][v11.universeId]
    };
end)(v7);
