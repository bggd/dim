module dim.imgui.glfw_ogl2;

import bindbc.glfw;
import dim.imgui.types;

extern (C++)
{
    bool ImGui_ImplOpenGL2_Init();
    void ImGui_ImplOpenGL2_Shutdown();
    void ImGui_ImplOpenGL2_NewFrame();
    void ImGui_ImplOpenGL2_RenderDrawData(ImDrawData* draw_data);

    bool ImGui_ImplGlfw_InitForOpenGL(GLFWwindow* window, bool install_callbacks);
    void ImGui_ImplGlfw_Shutdown();
    void ImGui_ImplGlfw_NewFrame();
}
