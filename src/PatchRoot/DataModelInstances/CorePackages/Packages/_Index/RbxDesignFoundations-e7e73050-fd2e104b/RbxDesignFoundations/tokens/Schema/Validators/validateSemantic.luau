return function(v0)
    return {
        Typography = v0.strictInterface({
            Title = v0.strictInterface({
                Font = v0.enum(Enum.Font), 
                FontSize = v0.number, 
                LineHeight = v0.number, 
                LetterSpacing = v0.number
            }), 
            Header = v0.strictInterface({
                Font = v0.enum(Enum.Font), 
                FontSize = v0.number, 
                LineHeight = v0.number, 
                LetterSpacing = v0.number
            }), 
            Subheader = v0.strictInterface({
                Font = v0.enum(Enum.Font), 
                FontSize = v0.number, 
                LineHeight = v0.number, 
                LetterSpacing = v0.number
            }), 
            Body = v0.strictInterface({
                Font = v0.enum(Enum.Font), 
                FontSize = v0.number, 
                LineHeight = v0.number, 
                LetterSpacing = v0.number
            }), 
            CaptionHeader = v0.strictInterface({
                Font = v0.enum(Enum.Font), 
                FontSize = v0.number, 
                LineHeight = v0.number, 
                LetterSpacing = v0.number
            }), 
            CaptionBody = v0.strictInterface({
                Font = v0.enum(Enum.Font), 
                FontSize = v0.number, 
                LineHeight = v0.number, 
                LetterSpacing = v0.number
            }), 
            Footer = v0.strictInterface({
                Font = v0.enum(Enum.Font), 
                FontSize = v0.number, 
                LineHeight = v0.number, 
                LetterSpacing = v0.number
            })
        }), 
        Color = v0.strictInterface({
            Background = v0.strictInterface({
                Default = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Contrast = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Muted = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                OnHover = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                OnPress = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            BackgroundUi = v0.strictInterface({
                Default = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Contrast = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Ui = v0.strictInterface({
                Default = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Muted = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Emphasis = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Text = v0.strictInterface({
                Default = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Muted = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Emphasis = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Link = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Inverse = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Icon = v0.strictInterface({
                Default = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Emphasis = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                OnHover = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Action = v0.strictInterface({
                Primary = v0.strictInterface({
                    Background = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Border = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Content = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                PrimaryBrand = v0.strictInterface({
                    Background = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Border = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Content = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Secondary = v0.strictInterface({
                    Background = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Border = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Content = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Alert = v0.strictInterface({
                    Background = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Border = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Content = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Subtle = v0.strictInterface({
                    Background = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Border = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Content = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            }), 
            State = v0.strictInterface({
                Standard = v0.strictInterface({
                    Default = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Hover = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Pressed = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Lighten = v0.strictInterface({
                    Default = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Hover = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Pressed = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Inverse = v0.strictInterface({
                    Default = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Hover = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Pressed = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                }), 
                Darken = v0.strictInterface({
                    Default = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Hover = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    }), 
                    Pressed = v0.strictInterface({
                        Color3 = v0.Color3, 
                        Transparency = v0.number
                    })
                })
            }), 
            Focus = v0.strictInterface({
                Start = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                End = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Gradient = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            }), 
            Common = v0.strictInterface({
                Divider = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Overlay = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                DropShadow = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                NavigationBar = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Badge = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                BadgeContent = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Placeholder = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Online = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Offline = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Alert = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                }), 
                Success = v0.strictInterface({
                    Color3 = v0.Color3, 
                    Transparency = v0.number
                })
            })
        }), 
        Radius = v0.strictInterface({
            None = v0.number, 
            Small = v0.number, 
            Medium = v0.number, 
            Large = v0.number, 
            XLarge = v0.number, 
            Circle = v0.number
        }), 
        Icon = v0.strictInterface({
            Size = v0.strictInterface({
                Small = v0.number, 
                Medium = v0.number, 
                Large = v0.number, 
                XLarge = v0.number, 
                XxLarge = v0.number
            })
        }), 
        Stroke = v0.strictInterface({
            Input = v0.number, 
            Focus = v0.number
        }), 
        Offset = v0.strictInterface({
            Focus = v0.strictInterface({
                Standard = v0.number, 
                Inset = v0.number
            })
        }), 
        Opacity = v0.strictInterface({
            State = v0.strictInterface({
                Lighten = v0.strictInterface({
                    Hover = v0.number, 
                    Pressed = v0.number
                }), 
                Darken = v0.strictInterface({
                    Hover = v0.number, 
                    Pressed = v0.number
                })
            })
        })
    };
end;
