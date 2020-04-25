module dim.imgui.bind;

import dim.imgui.types;

extern (C++,ImGui)
{
    ImGuiContext* CreateContext(ImFontAtlas* shared_font_atlas = null);
    void DestroyContext(ImGuiContext* ctx = null);
    ImGuiContext* GetCurrentContext();
    void SetCurrentContext(ImGuiContext* ctx);

    ref ImGuiIO GetIO();
    ref ImGuiStyle GetStyle();

    void NewFrame();
    void EndFrame();
    void Render();
    ImDrawData* GetDrawData();

    void ShowDemoWindow(bool* p_open = null);

    void StyleColorsDark(ImGuiStyle* dst = null);
    void StyleColorsLight(ImGuiStyle* dst = null);
}
