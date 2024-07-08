local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local _ = require(l_CorePackages_0.UIBlox);
local _ = require(l_CorePackages_0.Workspace.Packages.GameTile);
local v6 = require(l_Modules_0.LuaApp.Components.GridHome.GridSettings);
local _ = require(l_Modules_0.LuaApp.Constants);
local l_GetFFlagDeprecateGridSettings_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDeprecateGridSettings;
return function(v9)
    if l_GetFFlagDeprecateGridSettings_0() or v9 then
        local l_Layout_0 = v9.LuaApps.Layout;
        local l_breakpoints_0 = l_Layout_0.breakpoints;
        local l_kinds_0 = l_Layout_0.kinds;
        local l_grid_0 = l_Layout_0.grid;
        local l_tiles_0 = l_Layout_0.tiles;
        local l_layoutTypes_0 = l_Layout_0.layoutTypes;
        return {
            margin = l_grid_0.default.margin, 
            gutter = l_grid_0.default.gutter, 
            columns = l_grid_0.default.columns.default, 
            featuredContentRows = l_grid_0.default.featuredContentRows, 
            hoverTileTopOffset = l_tiles_0.hover.topOffset, 
            hoverTileBottomOffset = l_tiles_0.hover.bottomOffset, 
            hoverTileHorizontalOffset = l_tiles_0.hover.horizontalOffset, 
            scrollableMaxTilesPerRow = l_grid_0.default.scrollableMaxTilesPerRow; 
            {
                kind = l_kinds_0.TopBar, 
                columns = l_Layout_0.topBar.columns, 
                gutter = l_Layout_0.topBar.gutter, 
                [l_LayoutConfig_0.Keys.PaddingRightItems] = l_Layout_0.topBar[l_LayoutConfig_0.Keys.PaddingRightItems], 
                [l_LayoutConfig_0.Keys.PaddingVertical] = l_Layout_0.topBar[l_LayoutConfig_0.Keys.PaddingVertical]
            }, 
            {
                kind = l_kinds_0.Friends, 
                relativeHeight = l_layoutTypes_0[l_kinds_0.Friends].relativeHeight
            }, 
            {
                kind = l_kinds_0.Experiences.Default, 
                relativeHeight = l_layoutTypes_0[l_kinds_0.Experiences.Default].relativeHeight
            }, 
            {
                kind = l_kinds_0.Experiences.WithFooter, 
                relativeHeight = l_layoutTypes_0[l_kinds_0.Experiences.WithFooter].relativeHeight
            }, 
            {
                kind = l_kinds_0.Experiences.AppGameTile, 
                relativeHeight = l_layoutTypes_0[l_kinds_0.Experiences.AppGameTile].relativeHeight
            }, 
            {
                kind = l_kinds_0.Experiences.GridTile, 
                relativeHeight = l_layoutTypes_0[l_kinds_0.Experiences.GridTile].relativeHeight, 
                gutter = l_layoutTypes_0[l_kinds_0.Experiences.GridTile].gutter
            }, 
            {
                kind = l_kinds_0.Experiences.EventTile, 
                relativeHeight = l_layoutTypes_0[l_kinds_0.Experiences.EventTile].relativeHeight, 
                gutter = l_layoutTypes_0[l_kinds_0.Experiences.EventTile].gutter
            }, 
            {
                breakpoint = "sd", 
                min = l_breakpoints_0.sd.min, 
                max = l_breakpoints_0.sd.max, 
                margin = l_grid_0.sd.margin, 
                gutter = l_grid_0.sd.gutter, 
                verticalGutter = l_grid_0.sd.verticalGutter, 
                featuredContentRows = l_grid_0.sd.featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0.sd.columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0.sd.columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0.sd.columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0.sd.columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0.sd.columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0.sd.columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0.sd.columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "hd", 
                min = l_breakpoints_0.hd.min, 
                max = l_breakpoints_0.hd.max, 
                margin = l_grid_0.hd.margin, 
                gutter = l_grid_0.hd.gutter, 
                verticalGutter = l_grid_0.hd.verticalGutter, 
                featuredContentRows = l_grid_0.hd.featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0.hd.columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0.hd.columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0.hd.columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0.hd.columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0.hd.columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0.hd.columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0.hd.columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "hd_ts", 
                min = l_breakpoints_0.hd_ts.min, 
                max = l_breakpoints_0.hd_ts.max, 
                margin = l_grid_0.hd_ts.margin, 
                gutter = l_grid_0.hd_ts.gutter, 
                verticalGutter = l_grid_0.hd_ts.verticalGutter, 
                featuredContentRows = l_grid_0.hd_ts.featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0.hd_ts.columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0.hd_ts.columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0.hd_ts.columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0.hd_ts.columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0.hd_ts.columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0.hd_ts.columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0.hd_ts.columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "fhd", 
                min = l_breakpoints_0.fhd.min, 
                max = l_breakpoints_0.fhd.max, 
                margin = l_grid_0.fhd.margin, 
                gutter = l_grid_0.fhd.gutter, 
                featuredContentRows = l_grid_0.fhd.featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0.fhd.columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0.fhd.columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0.fhd.columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0.fhd.columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0.fhd.columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0.fhd.columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0.fhd.columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "fhd_ts", 
                min = l_breakpoints_0.fhd_ts.min, 
                max = l_breakpoints_0.fhd_ts.max, 
                margin = l_grid_0.fhd_ts.margin, 
                gutter = l_grid_0.fhd_ts.gutter, 
                featuredContentRows = l_grid_0.fhd_ts.featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0.fhd_ts.columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0.fhd_ts.columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0.fhd_ts.columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0.fhd_ts.columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0.fhd_ts.columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0.fhd_ts.columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0.fhd_ts.columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "2k", 
                min = l_breakpoints_0["2k"].min, 
                max = l_breakpoints_0["2k"].max, 
                featuredContentRows = l_grid_0["2k"].featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0["2k"].columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0["2k"].columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0["2k"].columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0["2k"].columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0["2k"].columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0["2k"].columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0["2k"].columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "2k_ts", 
                min = l_breakpoints_0["2k_ts"].min, 
                max = l_breakpoints_0["2k_ts"].max, 
                featuredContentRows = l_grid_0["2k_ts"].featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0["2k_ts"].columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0["2k_ts"].columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0["2k_ts"].columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0["2k_ts"].columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0["2k_ts"].columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0["2k_ts"].columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0["2k_ts"].columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "4k", 
                min = l_breakpoints_0["4k"].min, 
                max = l_breakpoints_0["4k"].max, 
                featuredContentRows = l_grid_0["4k"].featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0["4k"].columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0["4k"].columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0["4k"].columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0["4k"].columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0["4k"].columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0["4k"].columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0["4k"].columns[l_kinds_0.Friends]
                }
            }, 
            {
                breakpoint = "6k", 
                min = l_breakpoints_0["6k"].min, 
                max = l_breakpoints_0["6k"].max, 
                width = l_grid_0["6k"].width, 
                featuredContentRows = l_grid_0["6k"].featuredContentRows; 
                {
                    kind = l_kinds_0.Experiences, 
                    columns = l_grid_0["6k"].columns[l_kinds_0.Experiences]
                }, 
                {
                    kind = l_kinds_0.Experiences.Default, 
                    columns = l_grid_0["6k"].columns[l_kinds_0.Experiences.Default]
                }, 
                {
                    kind = l_kinds_0.Experiences.WithFooter, 
                    columns = l_grid_0["6k"].columns[l_kinds_0.Experiences.WithFooter]
                }, 
                {
                    kind = l_kinds_0.Experiences.AppGameTile, 
                    columns = l_grid_0["6k"].columns[l_kinds_0.Experiences.AppGameTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.GridTile, 
                    columns = l_grid_0["6k"].columns[l_kinds_0.Experiences.GridTile]
                }, 
                {
                    kind = l_kinds_0.Experiences.EventTile, 
                    columns = l_grid_0["6k"].columns[l_kinds_0.Experiences.EventTile]
                }, 
                {
                    kind = l_kinds_0.Friends, 
                    columns = l_grid_0["6k"].columns[l_kinds_0.Friends]
                }
            }
        };
    else
        return v6.Config;
    end;
end;
