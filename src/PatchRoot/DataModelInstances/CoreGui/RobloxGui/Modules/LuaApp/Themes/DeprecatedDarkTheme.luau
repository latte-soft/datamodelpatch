local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Colors);
local v2 = require(script.Parent.Parent.Enum.ButtonState);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v5 = {
    Name = "dark", 
    Color = {
        Background = v1.Slate
    }, 
    ContextPrimaryButton = {
        Color = v1.Green, 
        Transparency = 0, 
        DisabledColor = v1.Green, 
        DisabledTransparency = 0.5, 
        LoadingTransparency = 0.5, 
        OnPressColor = v1.Green, 
        OnPressTransparency = 0.5, 
        Text = {
            Color = v1.White, 
            Transparency = 0
        }, 
        Border = {
            Hidden = true
        }
    }, 
    SystemPrimaryButton = {
        Color = v1.White, 
        Transparency = 0, 
        DisabledColor = v1.White, 
        DisabledTransparency = 0.5, 
        LoadingTransparency = 0.5, 
        OnPressColor = v1.White, 
        OnPressTransparency = 0.5, 
        Text = {
            Color = v1.Black, 
            Transparency = 0
        }, 
        Border = {
            Hidden = true
        }, 
        ShimmerAnimation = {
            Transparency = 0, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_lightTheme.png", 
            AspectRatio = 0.876
        }
    }, 
    SecondaryButton = {
        Color = v1.Pumice, 
        Transparency = 1, 
        HoverColor = v1.White, 
        OnPressColor = v1.Pumice, 
        OnPressTransparency = 0.5, 
        DisabledColor = v1.Pumice, 
        DisabledTransparency = 0.5, 
        Text = {
            Color = v1.White, 
            Transparency = 0.3
        }, 
        Border = {
            Hidden = false, 
            Color = v1.White, 
            Transparency = 0.3
        }
    }, 
    IconButton = {
        Fill = {
            Off = {
                Color = v1.White, 
                Transparency = 0.7
            }, 
            On = {
                Color = v1.White, 
                Transparency = 1
            }, 
            OnPress = {
                Color = v1.White, 
                Transparency = 0.85
            }, 
            Loading = {
                Color = v1.White, 
                Transparency = 0.7
            }, 
            Disabled = {
                Color = v1.White, 
                Transparency = 0.85
            }
        }, 
        Border = {
            Off = {
                Color = v1.White, 
                Transparency = 0.3
            }, 
            On = {
                Color = v1.White, 
                Transparency = 0.3
            }, 
            OnPress = {
                Color = v1.White, 
                Transparency = 0.85
            }, 
            Loading = {
                Color = v1.White, 
                Transparency = 0.3
            }, 
            Disabled = {
                Color = v1.White, 
                Transparency = 0.85
            }
        }, 
        Icon = {
            Off = {
                Color = v1.White, 
                Transparency = 0.3
            }, 
            On = {
                Color = v1.Green, 
                Transparency = 0
            }, 
            OnPress = {
                Color = v1.Green, 
                Transparency = 0.7
            }, 
            Loading = {
                Color = v1.White, 
                Transparency = 0.5
            }, 
            Disabled = {
                Color = v1.White, 
                Transparency = 0.7
            }
        }
    }, 
    EmptyStatePage = {
        ErrorMessage = {
            Color = v1.Graphite
        }
    }, 
    ShimmerAnimation = {
        Transparency = 0.65, 
        Image = "rbxasset://textures/ui/LuaApp/graphic/shimmer_darkTheme.png", 
        AspectRatio = 0.876
    }, 
    ShimmerPanel = {
        Color = v1.Flint, 
        Transparency = 0.5
    }, 
    ContextualMenu = {
        Cells = {
            Icon = {
                Color = v1.White, 
                OnColor = v1.Green, 
                Transparency = 0.3, 
                OnTransparency = 0, 
                DisabledTransparency = 0.5
            }, 
            Content = {
                Color = v1.White, 
                DisabledColor = v1.White, 
                DisabledTransparency = 0.5
            }, 
            Background = {
                OnPressColor = v1.Black, 
                OnPressTransparency = 0.7
            }
        }, 
        Background = {
            Color = v1.Flint
        }, 
        Title = {
            Font = l_AppFonts_0.default:getDefault(), 
            Color = v1.White, 
            Transparency = 0, 
            DisabledTransparency = 0.5
        }, 
        Divider = {
            Color = v1.Graphite
        }, 
        Cancel = {
            Color = v1.Pumice
        }, 
        DarkOverlay = {
            Color = v1.Black, 
            Transparency = 0.7
        }
    }, 
    Authentication = {
        WeChatButton = {
            Text = {
                Font = l_AppFonts_0.default:getBold(), 
                Size = 18, 
                Color = v1.White
            }, 
            Background = {
                Color = v1.Green2
            }
        }
    }, 
    AlertWindow = {
        Background = {
            Color = v1.Flint
        }, 
        Title = {
            Color = v1.White, 
            Font = l_AppFonts_0.default:getBold()
        }, 
        Message = {
            Color = v1.Pumice, 
            Font = l_AppFonts_0.default:getDefault()
        }, 
        Divider = {
            Color = v1.Graphite
        }, 
        Button = {
            Font = l_AppFonts_0.default:getDefault()
        }
    }, 
    GameDetails = {
        Background = {
            Color = v1.Black, 
            Transparency = 0.3
        }, 
        Text = {
            Font = l_AppFonts_0.default:getDefault(), 
            BoldFont = l_AppFonts_0.default:getBlack(), 
            Color = {
                Main = v1.White, 
                Secondary = v1.Pumice
            }
        }, 
        GameCard = {
            Background = {
                Color = v1.Flint, 
                Transparency = 0
            }, 
            Sponsor = {
                Color = v1.Graphite, 
                TextColor = v1.White, 
                Font = l_AppFonts_0.default:getDefault()
            }, 
            Title = {
                Font = l_AppFonts_0.default:getDefault(), 
                Color = v1.White
            }, 
            GameBasicStats = {
                Color = v1.White, 
                Transparency = 0.3, 
                Font = l_AppFonts_0.default:getDefault()
            }
        }, 
        GameBasicStats = {
            Color = v1.White, 
            Transparency = 0.3, 
            Font = l_AppFonts_0.default:getMedium()
        }, 
        GameInfoList = {
            DividerColor = v1.Graphite, 
            Cells = {
                Background = {
                    Color = v1.Black, 
                    Transparency = {
                        Default = 1, 
                        Pressed = 0.7
                    }
                }
            }
        }, 
        Rating = {
            Background = {
                Color = v1.White, 
                Transparency = 0.7
            }
        }, 
        Carousel = {
            Text = {
                Color = v1.White
            }
        }, 
        TopBar = {
            Icon = {
                Color = v1.White
            }
        }, 
        LoadingView = {
            BackgroundImage = {
                Image = "rbxasset://textures/ui/LuaApp/graphic/GameDetailsBackground/loadingBkg_base.jpg", 
                Size = Vector2.new(500, 500), 
                Tint = {
                    Color = v1.Obsidian, 
                    Transparency = 0.2
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
            BackgroundColor = v1.Flint, 
            BackgroundTransparency = 0.5
        }, 
        FakeItem = {
            Loading = {
                Color = v1.Flint, 
                BaseTransparency = 0.5, 
                TransparencyStep = 0.25
            }, 
            Loaded = {
                Color = v1.White, 
                BaseTransparency = 0.5, 
                TransparencyStep = 0.25
            }
        }, 
        VideoIconColor = v1.White
    }, 
    GameCard = {
        Background = {
            Color = v1.Flint, 
            Transparency = 0
        }, 
        Sponsor = {
            Color = v1.Graphite, 
            TextColor = v1.White, 
            Font = Enum.Font.SourceSans
        }, 
        Title = {
            Font = Enum.Font.SourceSans, 
            Color = v1.White
        }, 
        GameBasicStats = {
            Color = v1.White, 
            Transparency = 0.3, 
            Font = Enum.Font.SourceSans
        }
    }, 
    ChatTopBar = {
        Background = {
            Color = v1.ChatTopBarSlate, 
            Transparency = 0
        }, 
        Title = {
            Font = Enum.Font.SourceSans, 
            Size = 22, 
            Color = v1.White
        }, 
        Subtitle = {
            Font = Enum.Font.SourceSans, 
            Size = 14, 
            Color = v1.White
        }
    }, 
    BottomBar = {
        Background = {
            Color = v1.Carbon, 
            Transparency = 0
        }, 
        TopBorder = {
            Color = v1.Graphite, 
            Transparency = 0
        }
    }, 
    BottomBarButton = {
        Icon = {
            Off = {
                Color = v1.White, 
                Transparency = 0.5
            }, 
            On = {
                Color = v1.White, 
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
            Color = v1.Slate, 
            Size = 12
        }, 
        Border = {
            Default = {
                Color = v1.Slate, 
                Transparency = 1
            }, 
            AppChrome = {
                Color = v1.Slate, 
                Transparency = 0
            }
        }, 
        Inner = {
            Color = v1.White, 
            Transparency = 0
        }
    }, 
    MorePage = {
        Background = {
            Color = v1.Slate, 
            Transparency = 0
        }, 
        List = {
            Background = {
                Color = v1.Flint, 
                Transparency = 0
            }, 
            Divider = {
                Color = v1.Graphite, 
                Transparency = 0
            }
        }, 
        Button = {
            Background = {
                Default = {
                    Color = v1.Flint, 
                    Transparency = 0
                }, 
                Pressed = {
                    Color = v1.Slate, 
                    Transparency = 0
                }
            }, 
            Text = {
                Font = l_AppFonts_0.default:getMedium(), 
                Size = 19, 
                Color = v1.Pumice, 
                Transparency = 0
            }, 
            Icon = {
                Color = v1.White, 
                Transparency = 0
            }, 
            RightImage = {
                Color = v1.White, 
                Transparency = 0
            }
        }, 
        Footer = {
            Font = l_AppFonts_0.default:getMedium(), 
            Size = 12, 
            Color = v1.Pumice, 
            Transparency = 0
        }
    }, 
    EventsPage = {
        Text = {
            Font = l_AppFonts_0.default:getDefault(), 
            Size = 19, 
            Color = v1.White, 
            Transparency = 0.3
        }
    }, 
    PremiumIcon = {
        Color = v1.White, 
        Transparency = 0
    }
};
v5.RetryButton = v5.SecondaryButton;
v5.Main = {
    Background = {
        Color = v1.Slate
    }, 
    Foreground = {
        Color = v1.Flint
    }, 
    TitleText = {
        Color = v1.White
    }, 
    BodyText = {
        Font = l_AppFonts_0.default:getDefault(), 
        Color = v1.Pumice
    }, 
    Divider = {
        Color = v1.Graphite
    }
};
v5.TopBar = {
    Bar = {
        Color = v5.Main.Background.Color
    }, 
    Background = {
        Color = v5.Main.Background.Color
    }, 
    DarkOverlay = {
        Color = v1.Black, 
        Transparency = 0.3
    }, 
    Text = {
        Color = v5.Main.TitleText.Color, 
        Transparency = 0
    }, 
    Icon = {
        Color = v5.Main.BodyText.Color
    }, 
    Badge = {
        Color = v1.White
    }, 
    BadgeText = {
        Color = v1.Slate
    }, 
    Separator = {
        Color = v1.Obsidian
    }
};
v5.SearchBar = {
    Background = {
        Color = v1.Black
    }, 
    Placeholder = {
        Color = v1.Flint
    }, 
    Content = {
        Color = v1.Pumice
    }
};
v5.DropDownList = {
    [v2.Default] = {
        Background = {
            Color = v5.Main.Background.Color, 
            Transparency = 0.3
        }, 
        Content = {
            Color = v5.Main.BodyText.Color, 
            Transparency = 0.3
        }, 
        Border = {
            Color = v1.Smoke
        }
    }, 
    [v2.Pressed] = {
        Background = {
            Transparency = 0.5
        }, 
        Content = {
            Transparency = 0.5
        }
    }
};
v5.ListPickerItem = {
    [v2.Default] = {
        Background = {
            Color = v1.Flint, 
            Transparency = 0.5
        }, 
        Content = {
            Color = v1.Pumice, 
            Transparency = 0
        }, 
        Separator = {
            Color = v1.Flint
        }
    }, 
    [v2.Hover] = {
        Background = {
            Color = v1.Graphite
        }, 
        Content = {
            Color = v1.White
        }
    }, 
    [v2.Pressed] = {
        Background = {
            Color = v1.Black, 
            Transparency = 0.7
        }, 
        Content = {
            Color = v1.White, 
            Transparency = 0.7
        }
    }, 
    [v2.Disabled] = {
        Content = {
            Color = v1.White, 
            Transparency = 0.7
        }
    }
};
v5.Buttons = {};
v5.Buttons.CtaButton = {
    TextFont = Enum.Font.SourceSansBold, 
    [v2.Default] = {
        Background = {
            Color = v1.White, 
            Transparency = 0
        }, 
        Border = {
            Transparency = 1
        }, 
        Content = {
            Color = v1.Slate, 
            Transparency = 0
        }
    }, 
    [v2.Pressed] = {
        Background = {
            Transparency = 0.5
        }, 
        Content = {
            Transparency = 0.5
        }
    }, 
    [v2.Disabled] = {
        Background = {
            Transparency = 0.5
        }, 
        Content = {
            Transparency = 0.5
        }
    }
};
v5.Buttons.GrowthButton = {
    TextFont = Enum.Font.SourceSansBold, 
    [v2.Default] = {
        Background = {
            Color = v1.Green, 
            Transparency = 0
        }, 
        Border = {
            Transparency = 1
        }, 
        Content = {
            Color = v1.White, 
            Transparency = 0
        }
    }, 
    [v2.Pressed] = {
        Background = {
            Transparency = 0.5
        }, 
        Content = {
            Transparency = 0.5
        }
    }, 
    [v2.Disabled] = {
        Background = {
            Transparency = 0.5
        }, 
        Content = {
            Transparency = 0.5
        }
    }
};
v5.Buttons.SecondaryButton = {
    TextFont = Enum.Font.SourceSansBold, 
    [v2.Default] = {
        Background = {
            Transparency = 1
        }, 
        Border = {
            Color = v1.White, 
            Transparency = 0.3
        }, 
        Content = {
            Color = v1.White, 
            Transparency = 0.3
        }
    }, 
    [v2.Pressed] = {
        Border = {
            Transparency = 0.65
        }, 
        Content = {
            Transparency = 0.65
        }
    }, 
    [v2.Hover] = {
        Border = {
            Transparency = 0
        }, 
        Content = {
            Transparency = 0
        }
    }, 
    [v2.Disabled] = {
        Border = {
            Transparency = 0.65
        }, 
        Content = {
            Transparency = 0.65
        }
    }
};
v5.Buttons.ControlButton = v5.Buttons.SecondaryButton;
v5.Buttons.BuyButton = v5.Buttons.SecondaryButton;
v5.Buttons.AlertButton = {
    TextFont = Enum.Font.SourceSansBold, 
    [v2.Default] = {
        Background = {
            Transparency = 1
        }, 
        Border = {
            Color = v1.Red, 
            Transparency = 0.3
        }, 
        Content = {
            Color = v1.Red, 
            Transparency = 0.3
        }
    }, 
    [v2.Pressed] = {
        Border = {
            Transparency = 0.65
        }, 
        Content = {
            Transparency = 0.65
        }
    }, 
    [v2.Hover] = {
        Border = {
            Transparency = 0
        }, 
        Content = {
            Transparency = 0
        }
    }, 
    [v2.Disabled] = {
        Border = {
            Transparency = 0.65
        }, 
        Content = {
            Transparency = 0.65
        }
    }
};
v5.Buttons.ToggleButton = {
    TextFont = Enum.Font.SourceSans, 
    On = {
        [v2.Default] = {
            Background = {
                Transparency = 1
            }, 
            Border = {
                Color = v1.White, 
                Transparency = 0.3
            }, 
            Content = {
                Color = v1.Green, 
                Transparency = 0.3
            }
        }, 
        [v2.Pressed] = {
            Border = {
                Transparency = 0.65
            }, 
            Content = {
                Transparency = 0.65
            }
        }, 
        [v2.Hover] = {
            Border = {
                Transparency = 0
            }, 
            Content = {
                Transparency = 0
            }
        }, 
        [v2.Disabled] = {
            Border = {
                Transparency = 0.65
            }, 
            Content = {
                Transparency = 0.65
            }
        }
    }, 
    Off = v5.Buttons.SecondaryButton
};
v5.Buttons.AgreementButton = {
    Text = {
        Font = l_AppFonts_0.default:getDefault(), 
        Color = v1.Pumice
    }
};
v5.Widget = {
    Header = {
        Text = {
            Font = l_AppFonts_0.default:getBold(), 
            Color = v1.White
        }
    }, 
    Background = {
        [l_FormFactor_0.UNKNOWN] = {
            Color = v1.Carbon, 
            Transparency = 0
        }, 
        [l_FormFactor_0.WIDE] = {
            Color = v1.Carbon, 
            Transparency = 0
        }, 
        [l_FormFactor_0.COMPACT] = {
            Color = v1.Black, 
            Transparency = 0.3
        }
    }, 
    ContentText = {
        Color = v1.Pumice, 
        Font = l_AppFonts_0.default:getDefault()
    }
};
v5.IconCards = {
    Text = {
        Color = v1.Pumice, 
        Font = l_AppFonts_0.default:getDefault()
    }
};
v5.ScrollingFrameWithScrollBar = {
    ScrollBar = {
        Color = v1.White, 
        Transparency = 0.7
    }
};
return v5;
