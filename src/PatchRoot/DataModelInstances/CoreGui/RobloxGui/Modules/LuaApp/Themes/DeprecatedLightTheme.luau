local v0 = require(script.Parent.Colors);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v4 = {
    Color = {
        Background = v0.Alabaster
    }, 
    ContextPrimaryButton = {
        Color = v0.Green, 
        Transparency = 0, 
        DisabledColor = v0.Green, 
        DisabledTransparency = 0.5, 
        LoadingTransparency = 0.5, 
        OnPressColor = v0.Green, 
        OnPressTransparency = 0.5, 
        Text = {
            Color = v0.White, 
            Transparency = 0
        }, 
        Border = {
            Hidden = true
        }
    }, 
    SystemPrimaryButton = {
        Color = v0.Black, 
        Transparency = 0, 
        DisabledColor = v0.Black, 
        DisabledTransparency = 0.5, 
        LoadingTransparency = 0.5, 
        OnPressColor = v0.Black, 
        OnPressTransparency = 0.5, 
        Text = {
            Color = v0.White, 
            Transparency = 0
        }, 
        Border = {
            Hidden = true
        }, 
        ShimmerAnimation = {
            Transparency = 0.65, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_darkTheme.png", 
            AspectRatio = 0.876
        }
    }, 
    SecondaryButton = {
        Color = v0.Smoke, 
        Transparency = 1, 
        HoverColor = v0.Flint, 
        OnPressColor = v0.Smoke, 
        OnPressTransparency = 0.5, 
        DisabledColor = v0.Smoke, 
        DisabledTransparency = 0.5, 
        Text = {
            Color = v0.Black, 
            Transparency = 0.5
        }, 
        Border = {
            Hidden = false, 
            Color = v0.Black, 
            Transparency = 0.5
        }
    }, 
    IconButton = {
        Fill = {
            Off = {
                Color = v0.Black, 
                Transparency = 0.9
            }, 
            On = {
                Color = v0.Black, 
                Transparency = 1
            }, 
            OnPress = {
                Color = v0.Black, 
                Transparency = 0.95
            }, 
            Loading = {
                Color = v0.Black, 
                Transparency = 0.9
            }, 
            Disabled = {
                Color = v0.Black, 
                Transparency = 0.95
            }
        }, 
        Border = {
            Off = {
                Color = v0.Black, 
                Transparency = 0.5
            }, 
            On = {
                Color = v0.Black, 
                Transparency = 0.5
            }, 
            OnPress = {
                Color = v0.Black, 
                Transparency = 0.75
            }, 
            Loading = {
                Color = v0.Black, 
                Transparency = 0.5
            }, 
            Disabled = {
                Color = v0.Black, 
                Transparency = 0.75
            }
        }, 
        Icon = {
            Off = {
                Color = v0.Black, 
                Transparency = 0.5
            }, 
            On = {
                Color = v0.Green, 
                Transparency = 0
            }, 
            OnPress = {
                Color = v0.Green, 
                Transparency = 0.5
            }, 
            Loading = {
                Color = v0.Black, 
                Transparency = 0.5
            }, 
            Disabled = {
                Color = v0.Black, 
                Transparency = 0.5
            }
        }
    }, 
    EmptyStatePage = {
        ErrorMessage = {
            Color = v0.Gray3
        }
    }, 
    ShimmerAnimation = {
        Transparency = 0, 
        Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_lightTheme.png", 
        AspectRatio = 0.876
    }, 
    ShimmerPanel = {
        Color = v0.Alabaster, 
        Transparency = 0.5
    }, 
    ContextualMenu = {
        Cells = {
            Icon = {
                Color = v0.Flint, 
                OnColor = v0.Green, 
                Transparency = 0.5, 
                OnTransparency = 0, 
                DisabledTransparency = 0.5
            }, 
            Content = {
                Color = v0.Flint, 
                DisabledColor = v0.Flint, 
                DisabledTransparency = 0.5
            }, 
            Background = {
                OnPressColor = v0.Black, 
                OnPressTransparency = 0.9
            }
        }, 
        Background = {
            Color = v0.Alabaster
        }, 
        Title = {
            Color = v0.Flint, 
            Transparency = 0, 
            DisabledTransparency = 0.5
        }, 
        Divider = {
            Color = v0.Pumice
        }, 
        Cancel = {
            Color = v0.Smoke
        }
    }, 
    AlertWindow = {
        Background = {
            Color = v0.Alabaster
        }, 
        Title = {
            Color = v0.Flint
        }, 
        Message = {
            Color = v0.Graphite
        }, 
        Divider = {
            Color = v0.Pumice
        }
    }, 
    GameDetails = {
        Text = {
            Font = Enum.Font.SourceSans, 
            BoldFont = Enum.Font.SourceSansBold, 
            Color = {
                Main = v0.White, 
                Secondary = v0.Pumice
            }
        }, 
        GameBasicStats = {
            Color = v0.White, 
            Transparency = 0.3, 
            Font = Enum.Font.SourceSans
        }, 
        GameInfoList = {
            DividerColor = v0.Graphite, 
            Cells = {
                Background = {
                    Color = v0.Black, 
                    Transparency = {
                        Default = 1, 
                        Pressed = 0.7
                    }
                }
            }
        }, 
        Rating = {
            Background = {
                Color = v0.White, 
                Transparency = 0.7
            }
        }, 
        Carousel = {
            Text = {
                Color = v0.Flint
            }
        }, 
        TopBar = {
            Icon = {
                Color = v0.Slate
            }
        }, 
        LoadingView = {
            BackgroundImage = {
                Image = "rbxasset://textures/ui/LuaApp/graphic/GameDetailsBackground/loadingBkg_base.jpg", 
                Size = Vector2.new(500, 500), 
                Tint = {
                    Color = v0.Ash, 
                    Transparency = 0.45
                }
            }
        }, 
        SocialMediaButton = {
            Transparency = 0, 
            OnPressTransparency = 0.5
        }
    }, 
    GameMediaAccordion = {
        Item = {
            BackgroundColor = v0.Flint, 
            BackgroundTransparency = 0.5
        }, 
        FakeItem = {
            Loading = {
                Color = v0.Flint, 
                BaseTransparency = 0.5, 
                TransparencyStep = 0.25
            }, 
            Loaded = {
                Color = v0.White, 
                BaseTransparency = 0.5, 
                TransparencyStep = 0.25
            }
        }, 
        VideoIconColor = v0.White
    }, 
    GameCard = {
        Background = {
            Color = v0.White, 
            Transparency = 0
        }, 
        Title = {
            Font = Enum.Font.SourceSans, 
            Color = v0.Flint
        }, 
        GameBasicStats = {
            Color = v0.Black, 
            Transparency = 0.5, 
            Font = Enum.Font.SourceSans
        }
    }, 
    ChatTopBar = {
        Background = {
            Color = v0.ChatTopBarWhite, 
            Transparency = 0
        }, 
        Title = {
            Font = Enum.Font.SourceSans, 
            Size = 22, 
            Color = v0.Flint
        }, 
        Subtitle = {
            Font = Enum.Font.SourceSans, 
            Size = 14, 
            Color = v0.Flint
        }
    }, 
    BottomBar = {
        Background = {
            Color = v0.White, 
            Transparency = 0
        }, 
        TopBorder = {
            Color = v0.Pumice, 
            Transparency = 0
        }
    }, 
    BottomBarButton = {
        Icon = {
            Off = {
                Color = v0.Flint, 
                Transparency = 0.5
            }, 
            On = {
                Color = v0.Flint, 
                Transparency = 0
            }
        }, 
        Title = {
            Font = l_AppFonts_0.default:getMedium(), 
            Size = 14
        }
    }, 
    NumericalBadge = {
        Text = {
            Font = l_AppFonts_0.default:getMedium(), 
            Color = v0.White, 
            Size = 12
        }, 
        Border = {
            Default = {
                Color = v0.White, 
                Transparency = 1
            }, 
            AppChrome = {
                Color = v0.White, 
                Transparency = 0
            }
        }, 
        Inner = {
            Color = v0.Flint, 
            Transparency = 0
        }
    }, 
    MorePage = {
        Background = {
            Color = v0.Alabaster, 
            Transparency = 0
        }, 
        List = {
            Background = {
                Color = v0.White, 
                Transparency = 0
            }, 
            Divider = {
                Color = v0.Pumice, 
                Transparency = 0
            }
        }, 
        Button = {
            Background = {
                Default = {
                    Color = v0.White, 
                    Transparency = 0
                }, 
                Pressed = {
                    Color = v0.Alabaster, 
                    Transparency = 0
                }
            }, 
            Text = {
                Font = l_AppFonts_0.default:getMedium(), 
                Size = 19, 
                Color = v0.Smoke, 
                Transparency = 0
            }, 
            Icon = {
                Color = v0.White, 
                Transparency = 0
            }, 
            RightImage = {
                Color = v0.White, 
                Transparency = 0
            }
        }, 
        Footer = {
            Font = l_AppFonts_0.default:getMedium(), 
            Size = 12, 
            Color = v0.Smoke, 
            Transparency = 0
        }
    }, 
    EventsPage = {
        Text = {
            Font = l_AppFonts_0.default:getDefault(), 
            Size = 19, 
            Color = v0.Black, 
            Transparency = 0.5
        }
    }, 
    PremiumIcon = {
        Color = v0.Flint, 
        Transparency = 0
    }
};
v4.RetryButton = v4.SecondaryButton;
v4.Main = {
    Background = {
        Color = v0.Alabaster
    }, 
    Foreground = {
        Color = v0.White
    }, 
    TitleText = {
        Color = v0.Flint
    }, 
    BodyText = {
        Font = l_AppFonts_0.default:getDefault(), 
        Color = v0.Smoke
    }, 
    Divider = {
        Color = v0.Pumice
    }
};
v4.Buttons = {};
v4.Buttons.AgreementButton = {
    Text = {
        Font = l_AppFonts_0.default:getDefault(), 
        Color = v0.Smoke
    }
};
v4.Widget = {
    Header = {
        Text = {
            Font = l_AppFonts_0.default:getBold(), 
            Color = v0.White
        }
    }, 
    Background = {
        [l_FormFactor_0.UNKNOWN] = {
            Color = v0.Carbon, 
            Transparency = 0
        }, 
        [l_FormFactor_0.WIDE] = {
            Color = v0.Carbon, 
            Transparency = 0
        }, 
        [l_FormFactor_0.COMPACT] = {
            Color = v0.Black, 
            Transparency = 0.3
        }
    }, 
    ContentText = {
        Color = v0.Gray4, 
        Font = l_AppFonts_0.default:getDefault()
    }
};
v4.ScrollingFrameWithScrollBar = {
    ScrollBar = {
        Color = v0.Black, 
        Transparency = 0.7
    }
};
return v4;
