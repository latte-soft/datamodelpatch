local v0 = {
    Experiences = "experiences", 
    Friends = "friends"
};
return {
    Kind = v0, 
    Config = {
        margin = 48, 
        gutter = 48, 
        columns = 4; 
        {
            breakpoint = "xs", 
            min = 0, 
            max = 690, 
            margin = 12, 
            gutter = 12; 
            {
                kind = v0.Experiences, 
                columns = 3
            }
        }, 
        {
            breakpoint = "s", 
            min = 690, 
            max = 860, 
            margin = 12, 
            gutter = 12; 
            {
                kind = v0.Experiences, 
                columns = 4
            }
        }, 
        {
            breakpoint = "m", 
            min = 860, 
            max = 1050, 
            margin = 14, 
            gutter = 14; 
            {
                kind = v0.Experiences, 
                columns = 5
            }
        }, 
        {
            breakpoint = "mm", 
            min = 1050, 
            max = 1280, 
            margin = 18, 
            gutter = 18; 
            {
                kind = v0.Experiences, 
                columns = 6
            }
        }, 
        {
            breakpoint = "hd_ts", 
            min = 1280, 
            max = 1440, 
            margin = 24, 
            gutter = 24; 
            {
                kind = v0.Experiences, 
                columns = 7
            }
        }, 
        {
            breakpoint = "fhd", 
            min = 1440, 
            max = 1920, 
            margin = 34, 
            gutter = 34; 
            {
                kind = v0.Experiences, 
                columns = 8
            }
        }, 
        {
            breakpoint = "fhd_ts", 
            min = 1920, 
            max = 2260, 
            margin = 38, 
            gutter = 38; 
            {
                kind = v0.Experiences, 
                columns = 9
            }
        }, 
        {
            breakpoint = "2k", 
            min = 2260, 
            max = 2560; 
            {
                kind = v0.Experiences, 
                columns = 10
            }
        }, 
        {
            breakpoint = "2k_ts", 
            min = 2560, 
            max = 3240; 
            {
                kind = v0.Experiences, 
                columns = 11
            }
        }, 
        {
            breakpoint = "4k", 
            min = 3240, 
            max = 3840; 
            {
                kind = v0.Experiences, 
                columns = 12
            }
        }, 
        {
            breakpoint = "6k", 
            min = 3840, 
            max = math.huge, 
            width = 3840; 
            {
                kind = v0.Experiences, 
                columns = 12
            }
        }
    }
};
