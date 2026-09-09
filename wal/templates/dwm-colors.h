static const char col_bg[]     = "{color0}";
static const char col_bg_alt[] = "{color2}";
static const char col_fg[]     = "{color0}";
static const char col_fg_dim[] = "{color15}";
static const char col_accent[] = "{color1}";

static const char *colors[][3] = {{
    /*               fg          bg          border     */
    [SchemeNorm] = {{ col_fg_dim, col_bg,    col_bg_alt }},
    [SchemeSel]  = {{ col_fg,     col_bg_alt, col_accent }},
}};
