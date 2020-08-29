module dim.imgui.types;

import std.bitmanip;

// https://github.com/Superbelko/imgui-d/blob/master/source/imgui/imgui_base.d
// https://p0nce.github.io/d-idioms/#Rvalue-references:-Understanding-auto-ref-and-then-not-using-it
mixin template RvalueRef()
{
    alias T = typeof(this);
    static assert(is(T == struct));

    @nogc @safe ref const(T) byRef() const pure nothrow return 
    {
        return this;
    }
}

struct ImVec2
{
    float x = 0.0f;
    float y = 0.0f;

    this(float x, float y)
    {
        this.x = x;
        this.y = y;
    }

    mixin RvalueRef;
}

struct ImVec4
{
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    float w = 0.0f;

    this(float x, float y, float z, float w)
    {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    mixin RvalueRef;
}

extern (C++) struct ImVector(T)
{
    int Size = 0;
    int Capacity = 0;
    T* Data = null;
}

alias ImTextureID = void*;
alias ImWchar = ushort;
alias ImU8 = ubyte;

enum IM_UNICODE_CODEPOINT_MAX = 0xFFFF;

struct ImGuiContext;
struct ImDrawData;

enum ImGuiWindowFlags : int
{
    None = 0,
    NoTitleBar = 1 << 0,
    NoResize = 1 << 1,
    NoMove = 1 << 2,
    NoScrollbar = 1 << 3,
    NoScrollWithMouse = 1 << 4,
    NoCollapse = 1 << 5,
    AlwaysAutoResize = 1 << 6,
    NoBackground = 1 << 7,
    NoSavedSettings = 1 << 8,
    NoMouseInputs = 1 << 9,
    MenuBar = 1 << 10,
    HorizontalScrollbar = 1 << 11,
    NoFocusOnAppearing = 1 << 12,
    NoBringToFrontOnFocus = 1 << 13,
    AlwaysVerticalScrollbar = 1 << 14,
    AlwaysHorizontalScrollbar = 1 << 15,
    AlwaysUseWindowPadding = 1 << 16,
    NoNavInputs = 1 << 18,
    NoNavFocus = 1 << 19,
    UnsavedDocument = 1 << 20,
    NoNav = ImGuiWindowFlags.NoNavInputs | ImGuiWindowFlags.NoNavFocus,
    NoDecoration = ImGuiWindowFlags.NoTitleBar | ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoScrollbar | ImGuiWindowFlags.NoCollapse,
    NoInputs = ImGuiWindowFlags.NoMouseInputs | ImGuiWindowFlags.NoNavInputs | ImGuiWindowFlags.NoNavFocus,

    NavFlattened = 1 << 23, // [BETA] Allow gamepad/keyboard navigation to cross over parent border to this child (only use on child that have no scrolling!)
    ChildWindow = 1 << 24, // Don't use! For internal use by BeginChild()
    Tooltip = 1 << 25, // Don't use! For internal use by BeginTooltip()
    Popup = 1 << 26, // Don't use! For internal use by BeginPopup()
    Modal = 1 << 27, // Don't use! For internal use by BeginPopupModal()
    ChildMenu = 1 << 28 // Don't use! For internal use by BeginMenu()
}

enum ImGuiKey : int
{
    Tab,
    LeftArrow,
    RightArrow,
    UpArrow,
    DownArrow,
    PageUp,
    PageDown,
    Home,
    End,
    Insert,
    Delete,
    Backspace,
    Space,
    Enter,
    Escape,
    KeyPadEnter,
    A, // for text edit CTRL+A: select all
    C, // for text edit CTRL+C: copy
    V, // for text edit CTRL+V: paste
    X, // for text edit CTRL+X: cut
    Y, // for text edit CTRL+Y: redo
    Z, // for text edit CTRL+Z: undo
    COUNT
}

enum ImGuiConfigFlags : int
{
    None = 0,
    NavEnableKeyboard = 1 << 0,
    NavEnableGamepad = 1 << 1,
    NavEnableSetMousePos = 1 << 2,
    NavNoCaptureKeyboard = 1 << 3,
    NoMouse = 1 << 4,
    NoMouseCursorChange = 1 << 5,

    IsSRGB = 1 << 20,
    IsTouchScreen = 1 << 21
}

enum ImGuiBackendFlags : int
{
    None = 0,
    HasGamepad = 1 << 0,
    HasMouseCursors = 1 << 1,
    HasSetMousePos = 1 << 2,
    RendererHasVtxOffset = 1 << 3
}

extern (C++) struct ImGuiIO
{
    ImGuiConfigFlags ConfigFlags;
    ImGuiBackendFlags BackendFlags;
    ImVec2 DisplaySize;
    float DeltaTime;
    float IniSavingRate;
    const char* IniFilename;
    const char* LogFilename;
    float MouseDoubleClickTime;
    float MouseDoubleClickMaxDist;
    float MouseDragThreshold;
    int[ImGuiKey.COUNT] KeyMap;
    float KeyRepeatDelay;
    float KeyRepeatRate;
    void* UserData;

    ImFontAtlas* Fonts;
}

enum ImGuiDir : int
{
    None = -1,
    Left = 0,
    Right = 1,
    Up = 2,
    Down = 3,
    COUNT
}

enum ImGuiCol : int
{
    Text,
    TextDisabled,
    WindowBg,
    ChildBg,
    PopupBg,
    Border,
    BorderShadow,
    FrameBg,
    FrameBgHovered,
    FrameBgActive,
    TitleBg,
    TitleBgActive,
    TitleBgCollapsed,
    MenuBarBg,
    ScrollbarBg,
    ScrollbarGrab,
    ScrollbarGrabHovered,
    ScrollbarGrabActive,
    CheckMark,
    SliderGrab,
    SliderGrabActive,
    Button,
    ButtonHovered,
    ButtonActive,
    Header,
    HeaderHovered,
    HeaderActive,
    Separator,
    SeparatorHovered,
    SeparatorActive,
    ResizeGrip,
    ResizeGripHovered,
    ResizeGripActive,
    Tab,
    TabHovered,
    TabActive,
    TabUnfocused,
    TabUnfocusedActive,
    PlotLines,
    PlotLinesHovered,
    PlotHistogram,
    PlotHistogramHovered,
    TextSelectedBg,
    DragDropTarget,
    NavHighlight,
    NavWindowingHighlight,
    NavWindowingDimBg,
    ModalWindowDimBg,
    COUNT
}

extern (C++) struct ImGuiStyle
{
    float Alpha;
    ImVec2 WindowPadding;
    float WindowRounding;
    float WindowBorderSize;
    ImVec2 WindowMinSize;
    ImVec2 WindowTitleAlign;
    ImGuiDir WindowMenuButtonPosition;
    float ChildRounding;
    float ChildBorderSize;
    float PopupRounding;
    float PopupBorderSize;
    ImVec2 FramePadding;
    float FrameRounding;
    float FrameBorderSize;
    ImVec2 ItemSpacing;
    ImVec2 ItemInnerSpacing;
    ImVec2 TouchExtraPadding;
    float IndentSpacing;
    float ColumnsMinSpacing;
    float ScrollbarSize;
    float ScrollbarRounding;
    float GrabMinSize;
    float GrabRounding;
    float TabRounding;
    float TabBorderSize;
    ImGuiDir ColorButtonPosition;
    ImVec2 ButtonTextAlign;
    ImVec2 SelectableTextAlign;
    ImVec2 DisplayWindowPadding;
    ImVec2 DisplaySafeAreaPadding;
    float MouseCursorScale;
    bool AntiAliasedLines;
    bool AntiAliasedFill;
    float CurveTessellationTol;
    float CircleSegmentMaxError;
    ImVec4[ImGuiCol.COUNT] Colors;

    void ScaleAllSizes(float scale_factor);
}

extern (C++) struct ImFontConfig
{
    void* FontData;
    int FontDataSize;
    bool FontDataOwnedByAtlas = true;
    int FontNo;
    float SizePixels;
    int OversampleH = 3;
    int OversampleV = 1;
    bool PixelSnapH;
    ImVec2 GlyphExtraSpacing;
    ImVec2 GlyphOffset;
    const ImWchar* GlyphRanges;
    float GlyphMinAdvanceX;
    float GlyphMaxAdvanceX = float.max;
    bool MergeMode;
    uint RasterizerFlags;
    float RasterizerMultiply = 1.0f;
    ImWchar EllipsisChar = ImWchar.max;

    // [Internal]
    char[40] Name;
    ImFont* DstFont;
}

extern (C++) struct ImFontGlyph
{
    mixin(bitfields!(uint, "Codepoint", 31, uint, "Visible", 1));
    float AdvanceX;
    float X0, Y0, X1, Y1;
    float U0, V0, U1, V1;
}

extern (C++) struct ImFontAtlasCustomRect
{
    uint ID;
    ushort Width, Height;
    ushort X, Y;
    float GlyphAdvanceX;
    ImVec2 GlyphOffset;
    ImFont* Font;

}

enum ImFontAtlasFlags : int
{
    None = 0,
    NoPowerOfTwoHeight = 1 << 0,
    NoMouseCursors = 1 << 1
}

extern (C++) struct ImFontAtlas
{
    ImFont* AddFontDefault(const(ImFontConfig)* font_cfg = null);

    bool Locked;
    ImFontAtlasFlags Flags;
    ImTextureID TexID;
    int TexDesiredWidth;
    int TexGlyphPadding;

    // [Internal]
    ubyte* TexPixelsAlpha8;
    uint* TexPixelsRGBA32;
    int TexWidth;
    int TexHeight;
    ImVec2 TexUvScale;
    ImVec2 TexUvWhitePixel;
    ImVector!ImFont* Fonts;
    ImVector!ImFontAtlasCustomRect CustomRects;
    ImVector!ImFontConfig ConfigData;
    int[1] CustomRectIds;
}

extern (C++) struct ImFont
{
    ImVector!float IndexAdvanceX;
    float FallbackAdvanceX;
    float FontSize;

    ImVector!ImWchar IndexLookup;
    ImVector!ImFontGlyph Glyphs;
    const ImFontGlyph* FallbackGlyph;
    ImVec2 DisplayOffset;

    ImFontAtlas* ContainerAtlas;
    const ImFontConfig* ConfigData;
    short ConfigDataCount;
    ImWchar FallbackChar;
    ImWchar EllipsisChar;
    bool DirtyLookupTables;
    float Scale;
    float Ascent, Descent;
    int MetricsTotalSurface;
    ImU8[(IM_UNICODE_CODEPOINT_MAX + 1) / 4096 / 8] Used4kPagesMap;
}
