local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Modules_0.LuaApp.Constants);
return function(v6)
    local v7 = l_useStyle_0();
    local l_Font_0 = v7.Font;
    local l_Font_1 = l_Font_0.Body.Font;
    local v10 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v12, v13 = v2.useState((l_useSelector_0(function(v11)
        return v11.ScreenSize;
    end)));
    local function v15(v14)
        if v14 then
            v13(v14.AbsoluteSize);
        end;
    end;
    local v16 = v12.X and v5.GetPageSideMargin(v12.X);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 32), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = v7.Theme.BackgroundContrast.Transparency, 
        BackgroundColor3 = v7.Theme.BackgroundContrast.Color, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = v15
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v16), 
            PaddingRight = UDim.new(0, v16), 
            PaddingTop = UDim.new(0, 16), 
            PaddingBottom = UDim.new(0, 16)
        }), 
        BannerText = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            RichText = true, 
            Size = UDim2.new(1, 0, 0, 32), 
            Text = l_useSelector_0(function(v17)
                local v18 = v17.Search.SearchesInGames[v6.searchUuid];
                if not (not v18 or not v18.entries) then
                    for _, v20 in v18.entries, nil, nil do
                        if v20.topicId == v6.topicId then
                            return v20.name;
                        end;
                    end;
                end;
                return nil;
            end), 
            TextSize = v10, 
            Font = l_Font_1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = v7.Theme.TextEmphasis.Color
        })
    });
end;
