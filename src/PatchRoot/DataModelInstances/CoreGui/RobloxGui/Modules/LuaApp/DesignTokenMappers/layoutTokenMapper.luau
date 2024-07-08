local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local v4 = require(l_Modules_0.LuaApp.Constants);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local l_WideGameTileViewConfig_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).WideGameTileViewConfig;
local v8 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft);
local l_GetFFlagTenFootUiSeeAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSeeAll;
local l_GetUIBloxEnableFontNameMapping_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetUIBloxEnableFontNameMapping;
local l_Kind_0 = l_LayoutConfig_0.Kind;
local l_Keys_0 = l_LayoutConfig_0.Keys;
local v13 = {
    sd = {
        min = 0, 
        max = 1024
    }, 
    hd = {
        min = 1024, 
        max = 1280
    }, 
    hd_ts = {
        min = 1280, 
        max = 1440
    }, 
    fhd = {
        min = 1440, 
        max = 1920
    }, 
    fhd_ts = {
        min = 1920, 
        max = 2260
    }, 
    ["2k"] = {
        min = 2260, 
        max = 2560
    }, 
    ["2k_ts"] = {
        min = 2560, 
        max = 3240
    }, 
    ["4k"] = {
        min = 3240, 
        max = 3840
    }, 
    ["6k"] = {
        min = 3840, 
        max = math.huge
    }
};
return function(v14, v15)
    local v16 = {
        breakpoints = v13, 
        kinds = l_Kind_0, 
        grid = {
            default = {
                margin = v15.Global.Space_600, 
                gutter = v15.Global.Space_600, 
                featuredContentRows = 4, 
                scrollableMaxTilesPerRow = if not l_GetFFlagTenFootUiSeeAll_0() then nil else 20, 
                columns = {
                    default = 4
                }
            }, 
            sd = {
                margin = v15.Global.Space_150, 
                gutter = v15.Global.Space_150, 
                verticalGutter = 34, 
                featuredContentRows = 2, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 4, 
                    [l_Kind_0.Experiences.WithFooter] = 4, 
                    [l_Kind_0.Experiences.AppGameTile] = 4, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 8
                }
            }, 
            hd = {
                margin = 18, 
                gutter = 18, 
                verticalGutter = 34, 
                featuredContentRows = 2, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 6, 
                    [l_Kind_0.Experiences.WithFooter] = 6, 
                    [l_Kind_0.Experiences.AppGameTile] = 6, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 10
                }
            }, 
            hd_ts = {
                margin = v15.Global.Space_300, 
                gutter = v15.Global.Space_300, 
                verticalGutter = 34, 
                featuredContentRows = 3, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 7, 
                    [l_Kind_0.Experiences.WithFooter] = 7, 
                    [l_Kind_0.Experiences.AppGameTile] = 7, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 12
                }
            }, 
            fhd = {
                margin = 34, 
                gutter = 34, 
                featuredContentRows = 4, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 8, 
                    [l_Kind_0.Experiences.WithFooter] = 8, 
                    [l_Kind_0.Experiences.AppGameTile] = 8, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 12
                }
            }, 
            fhd_ts = {
                margin = 38, 
                gutter = 38, 
                featuredContentRows = 4, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 9, 
                    [l_Kind_0.Experiences.WithFooter] = 9, 
                    [l_Kind_0.Experiences.AppGameTile] = 9, 
                    [l_Kind_0.Experiences.GridTile] = 4, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 12
                }
            }, 
            ["2k"] = {
                featuredContentRows = 4, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 10, 
                    [l_Kind_0.Experiences.WithFooter] = 10, 
                    [l_Kind_0.Experiences.AppGameTile] = 10, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 14
                }
            }, 
            ["2k_ts"] = {
                featuredContentRows = 4, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 11, 
                    [l_Kind_0.Experiences.WithFooter] = 11, 
                    [l_Kind_0.Experiences.AppGameTile] = 11, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 16
                }
            }, 
            ["4k"] = {
                featuredContentRows = 5, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 12, 
                    [l_Kind_0.Experiences.WithFooter] = 12, 
                    [l_Kind_0.Experiences.AppGameTile] = 12, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 20
                }
            }, 
            ["6k"] = {
                width = 3840, 
                featuredContentRows = 5, 
                columns = {
                    [l_Kind_0.Experiences.Default] = 12, 
                    [l_Kind_0.Experiences.WithFooter] = 12, 
                    [l_Kind_0.Experiences.AppGameTile] = 12, 
                    [l_Kind_0.Experiences.GridTile] = 6, 
                    [l_Kind_0.Experiences.EventTile] = 4, 
                    [l_Kind_0.Friends] = 20
                }
            }
        }, 
        tiles = {
            hover = {
                topOffset = 10, 
                bottomOffset = 22, 
                horizontalOffset = -4
            }
        }, 
        topBar = {
            gutter = v15.Global.Space_200, 
            columns = 1, 
            [l_Keys_0.PaddingRightItems] = v15.Global.Space_200, 
            [l_Keys_0.PaddingVertical] = v15.Global.Space_200
        }, 
        layoutTypes = {
            [l_Kind_0.Friends] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = 44
                }
            }, 
            [l_Kind_0.Experiences.Default] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = 60
                }
            }, 
            [l_Kind_0.Experiences.WithFooter] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = if not not v8() and v14.uiMode == l_UiMode_0.TenFoot then l_GetUIBloxEnableFontNameMapping_0() and 98 or 96 else 82
                }
            }, 
            [l_Kind_0.Experiences.AppGameTile] = {
                relativeHeight = {
                    Scale = 1, 
                    Offset = v4.GAME_GRID_TILE_FOOTER_HEIGHT
                }
            }, 
            [l_Kind_0.Experiences.GridTile] = {
                gutter = v15.Global.Space_300, 
                relativeHeight = {
                    Scale = 0.5625, 
                    Offset = l_WideGameTileViewConfig_0.getFooterHeight(v15)
                }
            }, 
            [l_Kind_0.Experiences.EventTile] = {
                gutter = v15.Global.Space_300, 
                relativeHeight = {
                    Scale = 0.5625, 
                    Offset = l_WideGameTileViewConfig_0.getFooterHeight(v15)
                }
            }
        }
    };
    if v14.uiMode == l_UiMode_0.TenFoot then
        v16.grid.fhd.margin = 0;
        v16.grid.fhd.gutter = v15.Global.Space_300;
        v16.grid.fhd.verticalGutter = 0;
        v16.grid.fhd.columns[l_Kind_0.Friends] = 12;
    end;
    return v16;
end;
