module dim.window.glfw_ogl2;

version (DIM_GLFW_OGL2)  : import dim.window.base;
import dim.window.config;
import bindbc.glfw;
import dim.imgui;

import core.stdc.stdio;

extern (C) void onErrorCallback(int error, const(char)* description) nothrow
{
    fprintf(stderr, "Glfw Error: %d %s\n", error, description);
}

class WindowGlfwOgl2 : WindowBase
{

    GLFWwindow* window;
    bool closeRequest;

    this(WindowConfig config)
    {
        glfwSetErrorCallback(&onErrorCallback);

        int status = glfwInit();
        assert(status == GLFW_TRUE);

        this.window = glfwCreateWindow(config.width, config.height, config.title.ptr, null, null);
        assert(this.window);

        glfwMakeContextCurrent(this.window);
        glfwSwapInterval(1);

        ImGui.CreateContext();

        ImGui_ImplGlfw_InitForOpenGL(this.window, true);
        ImGui_ImplOpenGL2_Init();
    }

    ~this()
    {
        ImGui_ImplOpenGL2_Shutdown();
        ImGui_ImplGlfw_Shutdown();
        ImGui.DestroyContext();
        glfwTerminate();
    }

    final bool isRunning()
    {
        return cast(bool) !glfwWindowShouldClose(this.window);
    }

    final void update()
    {
        glfwPollEvents();

        ImGui_ImplOpenGL2_NewFrame();
        ImGui_ImplGlfw_NewFrame();
        ImGui.NewFrame();

        this.onUpdate();

        ImGui.Render();
        ImGui_ImplOpenGL2_RenderDrawData(ImGui.GetDrawData());

        glfwSwapBuffers(this.window);
    }

    override void onUpdate()
    {
    }

}

unittest
{
    WindowConfig config;
    config.width = 640;
    config.height = 480;
    config.title = "dim window";

    auto window = new WindowGlfwOgl2(config);
    assert(window.isRunning());
    window.update();
}
