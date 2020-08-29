module dim.imgui.bind;

import dim.imgui.types;

bool Begin(const(char)* name, bool* p_open = null, ImGuiWindowFlags flags = ImGuiWindowFlags.None)
{
    return ImGui.Begin(name, p_open, cast(int) flags);
}

extern (C++,ImGui):

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

void End();

void Image(ImTextureID user_texture_id, ref const(ImVec2) size, ref const(ImVec2) uv0 = ImVec2(0, 0).byRef(), ref const(ImVec2) uv1 = ImVec2(1, 1).byRef(), ref const(ImVec4) tint_col = ImVec4(1, 1, 1, 1).byRef(), ref const(ImVec4) border_col = ImVec4(0, 0, 0, 0).byRef());

void SameLine(float offset_from_start_x = 0.0f, float spacing = -1.0f);

private:

bool Begin(const(char)* name, bool* p_open = null, int flags = 0);
