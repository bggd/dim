module dim.stb.image;

alias stbi_uc = ubyte;
alias stbi_us = ushort;

extern (C)
{
    stbi_uc* stbi_load_from_memory(const(stbi_uc)* buffer, int len, int* x, int* y, int* channels_in_file, int desired_channels);

    void stbi_image_free(void* retval_from_stbi_load);

    const(char)* stbi_failure_reason();
}
