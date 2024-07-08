local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v3 = require(l_Modules_0.LuaApp.Constants);
local v4 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
if not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDeprecateGridSettings() then
    local v5 = {
        TopBar = v2.GridConfig.Kind, 
        Experiences = {
            Default = "experiences", 
            WithFooter = "experiencesWithFooter", 
            AppGameTile = "AppGameTile", 
            GridTile = "GridTile"
        }, 
        Friends = "friends"
    };
    return {
        Kind = v5, 
        Config = {
            margin = 48, 
            gutter = 48, 
            columns = 4, 
            featuredContentRows = 4, 
            hoverTileTopOffset = 10, 
            hoverTileBottomOffset = 22, 
            hoverTileHorizontalOffset = -4; 
            {
                kind = v5.TopBar, 
                columns = 1, 
                gutter = 16, 
                [v2.GridConfig.Keys.PaddingRightItems] = 16, 
                [v2.GridConfig.Keys.PaddingVertical] = 16
            }, 
            {
                kind = v5.Friends, 
                relativeHeight = {
                    Scale = 1, 
                    Offset = 44
                }
            }, 
            {
                kind = v5.Experiences.Default, 
                relativeHeight = {
                    Scale = 1, 
                    Offset = 60
                }
            }, 
            {
                kind = v5.Experiences.WithFooter, 
                relativeHeight = {
                    Scale = 1, 
                    Offset = 82
                }
            }, 
            {
                kind = v5.Experiences.AppGameTile, 
                relativeHeight = {
                    Scale = 1, 
                    Offset = v3.GAME_GRID_TILE_FOOTER_HEIGHT
                }
            }, 
            {
                breakpoint = "sd", 
                min = 0, 
                max = 1024, 
                margin = 12, 
                gutter = 12, 
                verticalGutter = 34, 
                featuredContentRows = 2; 
                {
                    kind = v5.Experiences, 
                    columns = 4
                }, 
                {
                    kind = v5.Friends, 
                    columns = 8
                }
            }, 
            {
                breakpoint = "hd", 
                min = 1024, 
                max = 1280, 
                margin = 18, 
                gutter = 18, 
                verticalGutter = 34, 
                featuredContentRows = 2; 
                {
                    kind = v5.Experiences, 
                    columns = 6
                }, 
                {
                    kind = v5.Friends, 
                    columns = 10
                }
            }, 
            {
                breakpoint = "hd_ts", 
                min = 1280, 
                max = 1440, 
                margin = 24, 
                gutter = 24, 
                verticalGutter = 34, 
                featuredContentRows = 3; 
                {
                    kind = v5.Experiences, 
                    columns = 7
                }, 
                {
                    kind = v5.Friends, 
                    columns = 12
                }
            }, 
            {
                breakpoint = "fhd", 
                min = 1440, 
                max = 1920, 
                margin = 34, 
                gutter = 34, 
                featuredContentRows = 4; 
                {
                    kind = v5.Experiences, 
                    columns = 8
                }, 
                {
                    kind = v5.Friends, 
                    columns = 12
                }
            }, 
            {
                breakpoint = "fhd_ts", 
                min = 1920, 
                max = 2260, 
                margin = 38, 
                gutter = 38, 
                featuredContentRows = 4; 
                {
                    kind = v5.Experiences, 
                    columns = 9
                }, 
                {
                    kind = v5.Friends, 
                    columns = 12
                }
            }, 
            {
                breakpoint = "2k", 
                min = 2260, 
                max = 2560, 
                featuredContentRows = 4; 
                {
                    kind = v5.Experiences, 
                    columns = 10
                }, 
                {
                    kind = v5.Friends, 
                    columns = 14
                }
            }, 
            {
                breakpoint = "2k_ts", 
                min = 2560, 
                max = 3240, 
                featuredContentRows = 4; 
                {
                    kind = v5.Experiences, 
                    columns = 11
                }, 
                {
                    kind = v5.Friends, 
                    columns = 16
                }
            }, 
            {
                breakpoint = "4k", 
                min = 3240, 
                max = 3840, 
                featuredContentRows = 5; 
                {
                    kind = v5.Experiences, 
                    columns = 12
                }, 
                {
                    kind = v5.Friends, 
                    columns = 20
                }
            }, 
            {
                breakpoint = "6k", 
                min = 3840, 
                max = math.huge, 
                width = 3840, 
                featuredContentRows = 5; 
                {
                    kind = v5.Experiences, 
                    columns = 12
                }, 
                {
                    kind = v5.Friends, 
                    columns = 20
                }
            }
        }
    };
else
    return v4.LayoutConfig;
end;
